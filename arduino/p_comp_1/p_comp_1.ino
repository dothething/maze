int sensor = 0;
int sensor2 = 0;

void setup() {
  Serial.begin(14400);
  Serial.println("0,0");
  //delay(100);
}

void loop() {
      

  sensor = analogRead(A0);
    sensor2 = analogRead(A1);
  
  if(Serial.available()>0){
    char input=Serial.read();
    int sensor=analogRead(A0);
       int sensor2=analogRead(A1);
    //Serial.print("sensor= ");
    Serial.print(sensor,DEC);
    Serial.print(",");
    delay(1);


 
    
//    Serial.print(", sensor2 = ");
    Serial.println(sensor2,DEC);
 delay(10);   
  }
}

