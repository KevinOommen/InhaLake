#include <ESP8266WiFi.h>
#include <SPI.h>
#include <Wire.h>
#include "MQ135.h"

const char *ssid = "POCO X2";     // replace with your wifi ssid and wpa2 key
const char *pass = "@@@@@@@@@@";

void setup()
{
  Serial.begin(115200);
 
  Serial.println("Connecting to ");
  Serial.println(ssid);
  
  WiFi.begin(ssid, pass);
 
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
    Serial.println("");
    Serial.println("WiFi connected");
}
 
  void loop(){
    MQ135 gasSensor = MQ135(A0);
    float air_quality = gasSensor.getPPM();
    Serial.print("Air Quality: ");  
    Serial.print(air_quality);
    Serial.println("  PPM");   
    Serial.println();
    delay(1000);
  }