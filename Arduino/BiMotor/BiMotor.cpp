/*
  BiMotor.cpp - Librería para controlar dos motores
  con un integrado L293D.
  Creado por Carlos Millán Soler, 02/09/13.
  Dominio público - Software Libre
*/

#include "Arduino.h"
#include "BiMotor.h"


BiMotor::BiMotor(int esqN,int esqP,int dretN, int dretP) {
  pinMode(esqN, OUTPUT);
  pinMode(esqP, OUTPUT);
  pinMode(dretN, OUTPUT);
  pinMode(dretP, OUTPUT);
  _esqN = esqN;
  _esqP = esqP;
  _dretN = dretN;
  _dretP = dretP;
}

void BiMotor::adelante(int pwm) {
  _pwm = pwm;
  delay(20);
  digitalWrite(_esqN, 0);
  analogWrite(_esqP, _pwm);
  digitalWrite(_dretN, 0);
  analogWrite(_dretP, _pwm);
}
void BiMotor::adelante() {
  delay(20);
  digitalWrite(_esqN, 0);
  analogWrite(_esqP, 1);
  digitalWrite(_dretN, 0);
  analogWrite(_dretP, 1);
}
void BiMotor::atras(int pwm) {
  _pwm = pwm;
  delay(20);
  analogWrite(_esqN, _pwm);
  digitalWrite(_esqP, 0);
  analogWrite(_dretN, _pwm);
  digitalWrite(_dretP, 0);
}
void BiMotor::atras() {
  delay(20);
  analogWrite(_esqN, 1);
  digitalWrite(_esqP, 0);
  analogWrite(_dretN, 1);
  digitalWrite(_dretP, 0);
}
void BiMotor::derecha(int pwm) {
  _pwm = pwm;
  delay(20);
  analogWrite(_esqN, _pwm);
  digitalWrite(_esqP, 0);
  digitalWrite(_dretN, 0);
  analogWrite(_dretP, _pwm);
}
void BiMotor::derecha() {
  delay(20);
  analogWrite(_esqN, 1);
  digitalWrite(_esqP, 0);
  digitalWrite(_dretN, 0);
  analogWrite(_dretP, 1);
}
void BiMotor::izquierda(int pwm) {
  _pwm = pwm;
  delay(20);
  digitalWrite(_esqN, 0);
  analogWrite(_esqP, _pwm);
  analogWrite(_dretN, _pwm);
  digitalWrite(_dretP, 0);
}
void BiMotor::izquierda() {
  delay(20);
  digitalWrite(_esqN, 0);
  analogWrite(_esqP, 1);
  analogWrite(_dretN, 1);
  digitalWrite(_dretP, 0);
}
void BiMotor::parar() {
  delay(20);
  digitalWrite(_esqN, 0);
  digitalWrite(_esqP, 0);
  digitalWrite(_dretN, 0);
  digitalWrite(_dretP, 0);
}
