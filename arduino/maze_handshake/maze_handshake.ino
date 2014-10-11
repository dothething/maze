void setup() {
  Serial.begin(9600);
  establishContact();
}

void loop() {
  if (Serial.available() > 0) {
    char receivedValue = Serial.read();
    int sensorValue = analogRead(A0);
    Serial.print(sensorValue);
    Serial.print(",");
    delay(1);
    sensorValue = analogRead(A1);
    Serial.println(sensorValue);
    delay(1);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("hello");
    delay(300);
  }
}
