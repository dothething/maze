int ud = 0;
int lr = 0;
//int hr = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  ud = analogRead(A0);
  delay(5);
  lr = analogRead(A1);
  delay(5);
  //hr = analogRead(A2);
  //delay(1);
  Serial.print(ud);
  Serial.print(",");
  Serial.println(lr);
  //Serial.print(",");
  //Serial.println(hr);
  //delay(1);
}
