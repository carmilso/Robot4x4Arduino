#include <BiMotor.h>

BiMotor robot(4,5,9,10);  //(izqNegativo,izqPositivo,derNegativo,derPositivo)

byte entrada;  //dato que recibe el bluetooth


void setup() {
  Serial.begin(9600);
  delay(1000);
}

void loop() {
  parar();
  adelante(); delay(1000); parar();
  atras(); delay(1000); parar(); delay(500);
  derecha(); delay(1750); parar();
  izquierda(); delay(1750); parar();
  delay(2000);
}
