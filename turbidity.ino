#include <ESP8266WiFi.h>        // Include the Wi-Fi library
#include "ThingSpeak.h"
#define TurbidityPin D0
const char* ssid     = "POCO X2";         // The SSID (name) of the Wi-Fi network you want to connect to
const char* password = "@@@@@@@@@@";
WiFiClient  client;

unsigned long myChannelNumber = 2061562;
const char * myWriteAPIKey = "7PK3LRCEWPQ50YZ4";
void setup() {
  Serial.begin(115200);         // Start the Serial communication to send messages to the computer
  delay(10);
  Serial.println('\n');
  
  WiFi.begin(ssid, password);             // Connect to the network
  Serial.print("Connecting to ");
  Serial.print(ssid); Serial.println(" ...");

  int i = 0;
  while (WiFi.status() != WL_CONNECTED) { // Wait for the Wi-Fi to connect
    delay(1000);
    Serial.print(++i); Serial.print(' ');
  }

  Serial.println('\n');
  Serial.println("Connection established!");  
  Serial.print("IP address:\t");
  Serial.println(WiFi.localIP());         // Send the IP address of the ESP8266 to the computer
  pinMode(TurbidyPin,INPUT);
  ThingSpeak.begin(client);
}

void loop() { 
  int sensorValue = analogRead(TurbidityPin);
  float voltage = sensorValue * (5.0 / 1024.0);
  Serial.println ("turbidity Output (V):");
  Serial.println (voltage);
  delay(1000);
  int x = ThingSpeak.writeField(myChannelNumber, 1,voltage, myWriteAPIKey);
    //uncomment if you want to get temperature in Fahrenheit
    //int x = ThingSpeak.writeField(myChannelNumber, 1, temperatureF, myWriteAPIKey);

  if(x == 200){
    Serial.println("Channel update successful.");
  }
  else{
    Serial.println("Problem updating channel. HTTP error code " + String(x));
  }
}


