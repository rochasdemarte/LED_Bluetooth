int data;

void setup() {
  Serial.begin(38400);
}

void loop() {
  if (Serial.available() > 0){
    data = Serial.read();
  }

  if (data == '1'){
    Serial.println("Procesing connected");
  } else if (data == '0'){
    Serial.println("Processing not connected");
  }
}
