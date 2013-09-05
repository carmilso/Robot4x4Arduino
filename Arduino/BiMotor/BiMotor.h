/*
  BiMotor.cpp - Librería para controlar dos motores
  con un integrado L293D.
  Creado por Carlos Millán Soler, 02/09/13.
  Dominio público - Software Libre
*/


#ifndef BiMotor_h
#define BiMotor_h
#include "Arduino.h"


class BiMotor {
  public:
	BiMotor(int esqN,int esqP,int dretN,int dretP);
	void adelante(int pwm);
	void atras(int pwm);
	void derecha(int pwm);
	void izquierda(int pwm);
	void adelante();
	void atras();
	void derecha();
	void izquierda();
	void parar();
  private:
	int _esqN;
	int _esqP;
	int _dretN;
	int _dretP;
	int _pwm;
};

#endif
