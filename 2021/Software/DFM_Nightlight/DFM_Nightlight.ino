//      ******************************************************************
//      *                                                                *
//      *       Nightlight - ENGR3260 - Design For Manufacturing         *
//      *                                                                *
//      *             S. Reifel                    9/12/2020             *
//      *                                                                *
//      ******************************************************************


#include <arduino.h>


//
// pin assignments
//
const int MODE_BUTTON_PIN = 5;
const int POWER_BUTTON_PIN = 9;
const int KEEP_POWER_ON_PIN = 1;

const int LED_1_PIN = 0;              // NOTE: if the LED pins numbers are changed, the 
const int LED_2_PIN = 3;              //       function softwarePWM() must also be updated
const int LED_3_PIN = 7;
const int LED_4_PIN = 8;
const int LED_5_PIN = 2;
const int LED_6_PIN = 10;



//
// values for the button handles (also indexes into ButtonsTable)
// 
const byte MODE_BUTTON_HANDLE      = 0;
const byte POWER_BUTTON_HANDLE     = 1;
const byte BUTTON_TABLE_LAST_ENTRY = 1;



//
// types of button events
//
const byte BUTTON_NO_EVENT  = 0x00;
const byte BUTTON_PUSHED    = 0x40;
const byte BUTTON_RELEASED  = 0x80;
const byte BUTTON_REPEAT    = 0xc0;



//
// structure and storage for the state of each push button
//
typedef struct _BUTTON_TABLE_ENTRY
{
  byte ButtonPinNumber;
  byte State;
  unsigned long EventStartTime;
} BUTTON_TABLE_ENTRY;

static BUTTON_TABLE_ENTRY ButtonsTable[BUTTON_TABLE_LAST_ENTRY + 1];



//
// storage for the arrays of LED brightness values
//
const int NUMBER_OF_LEDS = 6;
int ledPwm[NUMBER_OF_LEDS];
byte ledCurrentBrightness[NUMBER_OF_LEDS];
byte ledNewBrightness[NUMBER_OF_LEDS];



//
//throb table - sinusoidal table normalized for eye linearity with a log function
//
const int throbTable[] PROGMEM = {
   0,     0,     0,     1,     1,     2,     2,     3,     3,     4, 
   4,     5,     6,     7,     8,    10,    12,    14,    17,    21, 
  26,    31,    38,    47,    57,    70,    85,   104,   126,   153, 
 185,   222,   266,   316,   375,   441,   516,   599,   691,   791, 
 899,  1012,  1130,  1250,  1370,  1487,  1599,  1702,  1793,  1870, 
1931,  1972,  1993};

const int throbTableLength = sizeof(throbTable) / sizeof(int);



//
// nightlight modes
//
const int NIGHTLIGHT_LOW_MODE = 0;
const int NIGHTLIGHT_MEDIUM_MODE = 1;
const int NIGHTLIGHT_HIGH_MODE = 2;
const int NIGHTLIGHT_THROB_MODE = 3;
const int NIGHTLIGHT_LAST_MODE = 3;



//
// how long to wait in milliseconds before auto-power-off (20 minutes)
//
const unsigned long AUTO_SHUTDOWN_PERIOD_MS = 20L * 60L * 1000L;



//
// global storage for state variables
//
int nightLightMode = NIGHTLIGHT_LOW_MODE;
boolean powerButtonReady = false;
unsigned long activityTime;


// ---------------------------------------------------------------------------------
//                              Hardware and software setup
// ---------------------------------------------------------------------------------

//
// setup hardware and initialize the software
//
void setup()
{
  //
  // keep the battery power on by driving the KEEP_POWER_ON_PIN line high
  //
  pinMode(KEEP_POWER_ON_PIN, OUTPUT);
  digitalWrite(KEEP_POWER_ON_PIN, HIGH);

  
  //
  // configure the LED pins as outputs
  //
  pinMode(LED_1_PIN, OUTPUT);
  pinMode(LED_2_PIN, OUTPUT);
  pinMode(LED_3_PIN, OUTPUT);
  pinMode(LED_4_PIN, OUTPUT);
  pinMode(LED_5_PIN, OUTPUT);
  pinMode(LED_6_PIN, OUTPUT);


  //
  // initialize software functions
  //
  buttonsInitialize();

  
  //
  // initialize all LEDs to be off
  //
  for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
  {
    ledPwm[ledNumber] = 0;
    ledCurrentBrightness[ledNumber] = 0;
    ledNewBrightness[ledNumber] = 0;
  }

  resetActivityTime();
}


// ---------------------------------------------------------------------------------
//                      The Main Loop and Top Level Functions
// ---------------------------------------------------------------------------------

//
// main loop, execute the current mode
//
void loop()
{
  boolean modeChangedFlg;
  
  //
  // loop forever checking the buttons and PWMing the LEDs
  //
  while(true)
  {
    //
    // get new button events
    //
    byte buttonEvent = getButtonEvent();


    //
    // check for events from the Power button
    //
    if (buttonEvent == POWER_BUTTON_HANDLE + BUTTON_RELEASED)     // check for Power button released after firsted turn on
       powerButtonReady = true;
                                                                  // check for Power button pressed, to turn the power off
    if ((buttonEvent == POWER_BUTTON_HANDLE + BUTTON_PUSHED) && (powerButtonReady == true))
       powerDown();


    //
    // check for events from the Mode button
    //
    modeChangedFlg = false;
    if (buttonEvent == MODE_BUTTON_HANDLE + BUTTON_PUSHED)
    {
      //
      // mode button pressed, select the next mode
      //
      nightLightMode++;
      if (nightLightMode > NIGHTLIGHT_LAST_MODE)
        nightLightMode = 0;

      modeChangedFlg = true;
      resetActivityTime();
    }


    //
    // check for long periods of inactivity, if inactive then power off
    //
    unsigned long elapsedTime = millis() - activityTime;
    if (elapsedTime >= AUTO_SHUTDOWN_PERIOD_MS)
      powerDown();


    //
    // run the current mode
    //
    switch(nightLightMode)
    {
      case NIGHTLIGHT_LOW_MODE:
        nightlightLowMode(modeChangedFlg);
        break;

      case NIGHTLIGHT_MEDIUM_MODE:
        nightlightMediumMode(modeChangedFlg);
        break;

      case NIGHTLIGHT_HIGH_MODE:
        nightlightHighMode(modeChangedFlg);
        break;

      case NIGHTLIGHT_THROB_MODE:
        nightlightThrobMode(modeChangedFlg);
        break;
    }
  }
}



//
// nightlight mode: low brightness
//    Enter:  initializeFlg = true if this mode should be initialized
//
void nightlightLowMode(boolean initializeFlg)
{
  static byte modeState;
  const byte LEDBrightness = 22;
  const byte fadeSpeed = 2;             // lower values go faster
  
  //
  // check if resetting this mode
  //
  if (initializeFlg)
    modeState = 0;

  //
  // select this mode's current state
  //
  switch(modeState)
  {
    //
    // start fading the LEDs to the desired brightness 
    //
    case 0:
    {
      for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
        ledNewBrightness[ledNumber] = LEDBrightness;

      fadeAllLEDsAtOnce(fadeSpeed);
      modeState++;
      break;
    }

    //
    // continue fading the LEDs, check if fade complete
    //
    case 1:
    {
      if (fadeAllLEDsAtOnce(fadeSpeed))
        modeState++;
      break;
    }

    //
    // fading complete, just maintain LED brightness
    //
    default:
      softwarePWM(7);
  }
}



//
// nightlight mode: medium brightness
//    Enter:  initializeFlg = true if this mode should be initialized
//
void nightlightMediumMode(boolean initializeFlg)
{
  static byte modeState;
  const byte LEDBrightness = 30;
  const byte fadeSpeed = 2;             // lower values go faster
  
  //
  // check if resetting this mode
  //
  if (initializeFlg)
    modeState = 0;

  //
  // select this mode's current state
  //
  switch(modeState)
  {
    //
    // start fading the LEDs to the desired brightness 
    //
    case 0:
    {
      for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
        ledNewBrightness[ledNumber] = LEDBrightness;

      fadeOneLEDAtATime(true, fadeSpeed, 1);
      modeState++;
      break;
    }

    //
    // continue fading the LEDs, check if fade complete
    //
    case 1:
    {
      if (fadeOneLEDAtATime(false, fadeSpeed, 1))
        modeState++;
      break;
    }

    //
    // fading complete, just maintain LED brightness
    //
    default:
      softwarePWM(7);
  }
}



//
// nightlight mode: high brightness
//    Enter:  initializeFlg = true if this mode should be initialized
//
void nightlightHighMode(boolean initializeFlg)
{
  static byte modeState;
  const byte LEDBrightness = 50;
  const byte fadeSpeed = 1;             // lower values go faster
  
  //
  // check if resetting this mode
  //
  if (initializeFlg)
    modeState = 0;

  //
  // select this mode's current state
  //
  switch(modeState)
  {
    //
    // start fading the LEDs to the desired brightness 
    //
    case 0:
    {
      for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
        ledNewBrightness[ledNumber] = LEDBrightness;

      fadeOneLEDAtATime(true, fadeSpeed, 1);
      modeState++;
      break;
    }

    //
    // continue fading the LEDs, check if fade complete
    //
    case 1:
    {
      if (fadeOneLEDAtATime(false, fadeSpeed, 1))
        modeState++;
      break;
    }

    //
    // fading complete, just maintain LED brightness
    //
    default:
      softwarePWM(7);
  }
}



//
// nightlight mode: throb
//    Enter:  initializeFlg = true if this mode should be initialized
//
void nightlightThrobMode(boolean initializeFlg)
{
  static byte modeState;
  static int8_t brightness;
  const byte minBrightness = 22;
  const byte maxBrightness = 35;
  const byte throbSpeed = 2;                   // higher values go faster
  const byte initialFadeSpeed = 4;             // lower values go faster

  
  //
  // check if resetting this mode
  //
  if (initializeFlg)
    modeState = 0;


  //
  // select this mode's current state
  //
  switch(modeState)
  {
    //
    // start fading down from the initial brightness to the "minBrightness"
    //
    case 0:
    {
      brightness = minBrightness;
      for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
        ledNewBrightness[ledNumber] = brightness;

      fadeAllLEDsAtOnce(initialFadeSpeed);
      modeState++;
      break;
    }

    //
    // continue fading down from the initial brightness to the "minBrightness"
    //
    case 1:
    {
      if (fadeAllLEDsAtOnce(initialFadeSpeed))
        modeState++;
      break;
    }
    
    //
    // start fading the LEDs from low to high 
    //
    case 2:
    {
      throbUpOneStep(true, brightness, throbSpeed);
      modeState++;
      break;
    }

    //
    // continue fading to high
    //
    case 3:
    {
      if (throbUpOneStep(false, brightness, throbSpeed))
      {
        brightness++;
        if (brightness <= maxBrightness)
           throbUpOneStep(true, brightness, throbSpeed);
        else
           modeState++;
        }
      break;
    }
   
    //
    // start fading the LEDs from high to low 
    //
    case 4:
    {
      throbDownOneStep(true, brightness, throbSpeed);
      modeState++;
      break;
    }

    //
    // continue fading to low
    //
    case 5:
    {
      if (throbDownOneStep(false, brightness, throbSpeed))
      {
        brightness--;
        if (brightness >= minBrightness)
           throbDownOneStep(true, brightness, throbSpeed);
        else
           modeState = 2;
      }
      break;
    }
  }
}



//
// power down: fade out then shut off
//
void powerDown(void)
{
  //
  // fade out to a brightness of 0
  //
  for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
    ledNewBrightness[ledNumber] = 0;
  while(fadeAllLEDsAtOnce(1) == false)
    ;

  //
  // turn off power to the FET
  //
  digitalWrite(KEEP_POWER_ON_PIN, LOW);    

  //
  // in case turning off fails, flash LED 1 forever
  //
  delay(5000);
  while(true)
  {
    digitalWrite(KEEP_POWER_ON_PIN, LOW);
    digitalWrite(LED_1_PIN, HIGH);    
    delayMicroseconds(5);
    digitalWrite(LED_1_PIN, LOW);    
    delay(100);
  }
}


//
// reset the "activity time" (used to auto power off after long periods of inactivity"
//
void resetActivityTime(void)
{
  activityTime = millis();
}



// ---------------------------------------------------------------------------------
//                           LED control functions
// ---------------------------------------------------------------------------------

//
// fade all the LEDs together, going from the Current value to the New value
//    Enter:  PWMCycleCount determines the speed of the fade, 1 is fastest
//            ledCurrentBrightness -> array of current brightness values for each LED
//            ledNewBrightness -> array of new brightness values for each LED
//    Exit:   true returned when fade complete
//
boolean fadeAllLEDsAtOnce(byte PWMCycleCount)
{
  boolean fadeCompleteFlg = true;
  
  for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
  {
    if (ledNewBrightness[ledNumber] > ledCurrentBrightness[ledNumber])
    {
      ledCurrentBrightness[ledNumber]++;
      ledPwm[ledNumber] = pgm_read_word(&throbTable[ledCurrentBrightness[ledNumber]]);
      fadeCompleteFlg = false;
    }
  
    if (ledNewBrightness[ledNumber] < ledCurrentBrightness[ledNumber])
    {
      ledCurrentBrightness[ledNumber]--;
      ledPwm[ledNumber] = pgm_read_word(&throbTable[ledCurrentBrightness[ledNumber]]);
      fadeCompleteFlg = false;
    }
  }

  if (fadeCompleteFlg)
    return(true);
        
  softwarePWM(PWMCycleCount);
  return(false);
}



//
// fade all the LEDs one-at-a-time, going from the Current value to the New value
//    Enter:  initializeFlg = true if this mode should be initialized
//            PWMCycleCount determines the speed of the fade, 1 is fastest
//            increment = step in brightness between as fading, larger values fade faster (typically 1, 2 or 3)
//            ledCurrentBrightness -> array of current brightness values for each LED
//            ledNewBrightness -> array of new brightness values for each LED
//    Exit:   true returned when fade complete
//
boolean fadeOneLEDAtATime(boolean initializeFlg, byte PWMCycleCount, byte increment)
{
  static int ledNumber;
  boolean fadeCompleteFlg = true;

  //
  // check if resetting the fade
  //
  if (initializeFlg)
    ledNumber = 0;

  int8_t newBrightness = ledNewBrightness[ledNumber];
  int8_t currentBrightness = ledCurrentBrightness[ledNumber];

  //
  // check if increasing or decreasing the LED's brightness
  //
  if (newBrightness > currentBrightness)
  {
    currentBrightness += increment;
    
    if (currentBrightness > newBrightness)
      currentBrightness = newBrightness;
      
    ledCurrentBrightness[ledNumber] = currentBrightness;
    fadeCompleteFlg = false;
  }

  else if (newBrightness < currentBrightness)
  {
    currentBrightness -= increment;
    
    if (currentBrightness < newBrightness)
      currentBrightness = newBrightness;
      
    ledCurrentBrightness[ledNumber] = currentBrightness;
    fadeCompleteFlg = false;
  }


  //
  // check if this LED is finished fading
  //
  if (fadeCompleteFlg == false)
  {
    ledPwm[ledNumber] = pgm_read_word(&throbTable[currentBrightness]);
    softwarePWM(PWMCycleCount);
    return(false);
  }

  //
  // this LED is done fading, now fade the next one
  //
  else
  {
    ledNumber++;
    if (ledNumber >= NUMBER_OF_LEDS)
      return(true);             // fading all LEDs complete so return true

    return(false);              // fade not finished yet
  }
}



//
// fade up between two values in the throb table
//    Enter:  initializeFlg = true if this mode should be initialized
//            throbIdx = index into the throb table of the starting PWM value
//            throbSpeed = speed of the fade, typically 1 to 10, larger numbers go faster
//    Exit:   true returned when fade complete
//
boolean throbUpOneStep(boolean initializeFlg, byte throbIdx, byte throbSpeed)
{
  static int maxLedPWM;
  static int ledPWMValue;
  
  //
  // check if resetting this mode
  //
  if (initializeFlg)
  {
    ledPWMValue = pgm_read_word(&throbTable[throbIdx]);
    maxLedPWM = pgm_read_word(&throbTable[throbIdx+1]);
  }

  //
  // set the LEDs to this PWM value
  //
  for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
    ledPwm[ledNumber] = ledPWMValue;

  softwarePWM(1);


  //
  // determine the next PWM value, then check if finished with fade
  //
  ledPWMValue += throbSpeed;
  if (ledPWMValue > maxLedPWM)
  {
    for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
      ledCurrentBrightness[ledNumber] = throbIdx+1;
    return(true);
  }

  //
  // fade not complete, return false
  //
  return(false);
}



//
// fade down between two values in the throb table
//    Enter:  initializeFlg = true if this mode should be initialized
//            throbIdx = index into the throb table of the starting PWM value
//            throbSpeed = speed of the fade, typically 1 to 10, larger numbers go faster
//    Exit:   true returned when fade complete
//
boolean throbDownOneStep(boolean initializeFlg, byte throbIdx, byte throbSpeed)
{
  static int minLedPWM;
  static int ledPWMValue;

  //
  // check if resetting this mode
  //
  if (initializeFlg)
  {
    ledPWMValue = pgm_read_word(&throbTable[throbIdx]);
    minLedPWM = pgm_read_word(&throbTable[throbIdx-1]);
  }


  //
  // determine the next PWM value, then check if finished with fade
  //
  for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
    ledPwm[ledNumber] = ledPWMValue;

  softwarePWM(1);

  ledPWMValue -= throbSpeed;
  if (ledPWMValue < minLedPWM)
  {
    for (byte ledNumber = 0; ledNumber < NUMBER_OF_LEDS; ledNumber++)
      ledCurrentBrightness[ledNumber] = throbIdx-1;
    return(true);
  }

  //
  // fade not complete, return false
  //
  return(false);
}



//
// PWM all pins with a value between 0 and 2000, for aprox n milliseconds
//    Enter:  ledPwm[] contains the array of PWM values, corresponding to each LED
//            PWMCycleCount = number of times the PWM should by cycled.  Typical values
//              are 1 or 2 or 3
//
void softwarePWM(int PWMCycleCount)
{    
  for (byte j = 0; j < PWMCycleCount; j++)
  { //
    // turn on all LEDS that have a PWM value greater than 0
    //
    if (ledPwm[0]) bitSet(PORTA, 0);      // LED 1 - D0  - PA0
    if (ledPwm[1]) bitSet(PORTA, 3);      // LED 2 - D3  - PA3
    if (ledPwm[2]) bitSet(PORTA, 7);      // LED 3 - D7  - PA7
    if (ledPwm[3]) bitSet(PORTB, 2);      // LED 4 - D8  - PB2
    if (ledPwm[4]) bitSet(PORTA, 2);      // LED 5 - D2  - PA2
    if (ledPwm[5]) bitSet(PORTB, 0);      // LED 6 - D10 - PB0
   
    //
    // loop for one PWM cycle, turning off each LED at the right PWM value
    //
    for (int i = 1; i <= 2000; i++)
    { if (i == ledPwm[0]) bitClear(PORTA, 0);      // LED 1 - D0  - PA0
      if (i == ledPwm[1]) bitClear(PORTA, 3);      // LED 2 - D3  - PA3
      if (i == ledPwm[2]) bitClear(PORTA, 7);      // LED 3 - D7  - PA7
      if (i == ledPwm[3]) bitClear(PORTB, 2);      // LED 4 - D8  - PB2
      if (i == ledPwm[4]) bitClear(PORTA, 2);      // LED 5 - D2  - PA2
      if (i == ledPwm[5]) bitClear(PORTB, 0);      // LED 6 - D10 - PB0
    }
  }
}


// ---------------------------------------------------------------------------------
//                                  Button functions  
// ---------------------------------------------------------------------------------

//
// values for State in ButtonsTable
//
const byte WAITING_FOR_BUTTON_DOWN                 = 0;
const byte DEBOUNCE_AFTER_BUTTON_DOWN              = 1;
const byte WAITING_FOR_BUTTON_UP                   = 2;
const byte WAITING_FOR_BUTTON_UP_AFTER_AUTO_REPEAT = 3;
const byte DEBOUNCE_AFTER_BUTTON_UP                = 4;


//
// delay periods for dealing with buttons in milliseconds
//
const long BUTTON_DEBOUNCE_PERIOD = 30;
const long BUTTON_AUTO_REPEAT_DELAY = 800;
const long BUTTON_AUTO_REPEAT_RATE = 130;


//
// initialize the buttons
//
void buttonsInitialize(void)
{
  BUTTON_TABLE_ENTRY buttonTableEntry;
  

  //
  // initialize the button table for each push button
  //
  buttonTableEntry.State = WAITING_FOR_BUTTON_DOWN;

  buttonTableEntry.ButtonPinNumber = MODE_BUTTON_PIN;
  ButtonsTable[MODE_BUTTON_HANDLE] = buttonTableEntry;

  buttonTableEntry.ButtonPinNumber = POWER_BUTTON_PIN;
  ButtonsTable[POWER_BUTTON_HANDLE] = buttonTableEntry;

  //
  // set all the buttons to inputs with pullups
  //
  for (int buttonNumber = 0; buttonNumber <= BUTTON_TABLE_LAST_ENTRY; buttonNumber++)
    pinMode(ButtonsTable[buttonNumber].ButtonPinNumber, INPUT_PULLUP);
}



//
// check for an event any of the push buttons
//   Exit:  event value returned (sum of the button index + the button event)
//           BUTTON_NO_EVENT returned if no event
//
byte getButtonEvent(void)
{
  byte buttonIdx;
  byte buttonEvent;
  
  for(buttonIdx = 0; buttonIdx <= BUTTON_TABLE_LAST_ENTRY; buttonIdx++)
  {
    buttonEvent = checkButton(buttonIdx);
    if (buttonEvent != BUTTON_NO_EVENT)
      return(buttonIdx + buttonEvent);
  }
  
  return(BUTTON_NO_EVENT);
}



//
// check for an event from a push button
//  Enter:  buttonIdx = index of which button to test
//  Exit:   event value returned, BUTTON_NO_EVENT returned if no event
//
byte checkButton(byte buttonIdx)
{
  byte buttonValue;
  unsigned long currentTime;
  
  //
  // read the button
  //
  buttonValue = !digitalRead(ButtonsTable[buttonIdx].ButtonPinNumber);

  //
  // check if nothing is going on (waiting for button to go down and it's not pressed)
  //
  if ((ButtonsTable[buttonIdx].State == WAITING_FOR_BUTTON_DOWN) && (buttonValue == false))
    return(BUTTON_NO_EVENT);                      // return no new event
  
  //
  // something is going on, read the time
  //
  currentTime = millis();    
  
  //
  // check the state that the button was in last
  //
  switch(ButtonsTable[buttonIdx].State)
  {
    //
    // check if waiting for button to go down
    //
    case WAITING_FOR_BUTTON_DOWN:
    {
      if (buttonValue == true)                   // check if button is now down
      {                                          // button is down, start timer
        ButtonsTable[buttonIdx].EventStartTime = currentTime;
        ButtonsTable[buttonIdx].State = DEBOUNCE_AFTER_BUTTON_DOWN;
        return(BUTTON_PUSHED);                  // return button "pressed" event
      }
      return(BUTTON_NO_EVENT);
    } 
    
    //
    // check if waiting for timer after button has gone down
    //    
    case DEBOUNCE_AFTER_BUTTON_DOWN:
    {                                           // check if it has been up long enough
      if (currentTime >= (ButtonsTable[buttonIdx].EventStartTime + BUTTON_DEBOUNCE_PERIOD))
      {                                         // debouncing period over, start auto repeat timer
        ButtonsTable[buttonIdx].EventStartTime = currentTime;
        ButtonsTable[buttonIdx].State = WAITING_FOR_BUTTON_UP;
      }
      return(BUTTON_NO_EVENT);
    }

    //
    // check if waiting for button to go back up
    //      
    case WAITING_FOR_BUTTON_UP:
    {
      if (buttonValue == false)                 // check if button is now up
      {                                         // button up, start debounce timer
        ButtonsTable[buttonIdx].EventStartTime = currentTime;
        ButtonsTable[buttonIdx].State = DEBOUNCE_AFTER_BUTTON_UP;
        return(BUTTON_RELEASED);                // return button "released" event
      }
                                                // button still down, check if time to auto repeat
      if (currentTime >= (ButtonsTable[buttonIdx].EventStartTime + BUTTON_AUTO_REPEAT_DELAY))
      {                                         // reset auto repeat timer
        ButtonsTable[buttonIdx].EventStartTime = currentTime;
        ButtonsTable[buttonIdx].State = WAITING_FOR_BUTTON_UP_AFTER_AUTO_REPEAT;
        return(BUTTON_REPEAT);                  // return button "auto repeat" event
      }
      return(BUTTON_NO_EVENT);
    }

    //
    // check if waiting for button to repeat
    //
    case WAITING_FOR_BUTTON_UP_AFTER_AUTO_REPEAT:
    {
      if (buttonValue == false)                 // check if button is now up
      {                                         // button up, start debounce timer
        ButtonsTable[buttonIdx].EventStartTime = currentTime;
        ButtonsTable[buttonIdx].State = DEBOUNCE_AFTER_BUTTON_UP;
        return(BUTTON_RELEASED);                // return button "released" event
      }
                                                // button still down, check if time to auto repeat
      if (currentTime >= (ButtonsTable[buttonIdx].EventStartTime + BUTTON_AUTO_REPEAT_RATE))
      {                                         // reset auto repeat timer
        ButtonsTable[buttonIdx].EventStartTime = currentTime;
        return(BUTTON_REPEAT);                  // return button "auto repeat" event
      }
      return(BUTTON_NO_EVENT);
    }     
    
    //
    // check if waiting for debouncing after button has gone up
    //
    case DEBOUNCE_AFTER_BUTTON_UP:
    {                                            // after button goes up, wait before check for down
      if (currentTime >= (ButtonsTable[buttonIdx].EventStartTime + BUTTON_DEBOUNCE_PERIOD))
        ButtonsTable[buttonIdx].State = WAITING_FOR_BUTTON_DOWN;
      return(BUTTON_NO_EVENT);
    }
  }
  
  return(BUTTON_NO_EVENT);                      // return no new event
}


// -------------------------------------- End --------------------------------------
