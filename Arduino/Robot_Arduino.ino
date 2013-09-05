#include <BiMotor.h>

BiMotor robot(4,5,9,10);  //(izqNegativo,izqPositivo,derNegativo,derPositivo)

byte entrada;  //dato que recibe el bluetooth

const int primera = 155;  //velocidades
const int segona = 255;

void setup() {
  Serial1.begin(9600);
  delay(1000);
}

void loop() {
  if(Serial1.available()>0){
    entrada = Serial1.read();
    switch(entrada){
      case '1': robot.adelante(primera); break;
      case 'a': robot.adelante(segona); break;
      case '2': robot.atras(primera); break;
      case 'b': robot.atras(segona); break;
      case '3': robot.derecha(primera); break;
      case 'c': robot.derecha(segona); break;
      case '4': robot.izquierda(primera); break;
      case 'd': robot.izquierda(segona); break;
      case '5': robot.parar(); break;
    }
  }
  delay(50);
}
