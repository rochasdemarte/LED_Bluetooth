String data;
const int r_pin = 9;
const int g_pin = 10;
const int b_pin = 11;
int r_value = 0;
int g_value = 0;
int b_value = 0;

void setup() {
  Serial.begin(38400);
  pinMode(r_pin, OUTPUT);
  pinMode(g_pin, OUTPUT);
  pinMode(b_pin, OUTPUT);
}

void loop() {
  if (Serial.available() > 0){
    data = Serial.read();
    dataProcess(data);
    Serial.println("Procesing connected");
  }
}

void dataProcess(String data) {
  int ig = data.indexOf('g');
  int ib = data.indexOf('b');
  int f = data.indexOf('f');
  
  r_value = data.substring(1, ig).toInt();
  g_value = data.substring((ig+1), ib).toInt();
  b_value = data.substring((ib+1), f).toInt();

  analogWrite(r_pin, r_value);
  analogWrite(g_pin, g_value);
  analogWrite(b_pin, b_value);
}
