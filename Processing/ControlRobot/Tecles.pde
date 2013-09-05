byte tecla;    //variables para controlar la dirección del robot
byte teclaAnt = 0;
int vel = 0;

void keyPressed() {    //método que se activa cuando es pulsa una tecla
  if(key=='1') Connectar = true;    //asignación de teclas de menú
  else if(key=='2') Instruccions = true;
  else if(key=='3') Amagar = true;
  else if(key=='4') INFO = true;
  else if(key=='5') Reiniciar = true;
  else if(key=='6') Sortir = true;
  try{
    if(Connectat){    //cuando hay conexión con el puerto serie,
      if(key==CODED){ //asigna a la variable "tecla" la dirección
        if(keyCode==UP){  //que ha de tomar el robot
          tecla = 1;
        }
        else if(keyCode==DOWN){
          tecla = 2;
        }
        else if(keyCode==RIGHT){
          tecla = 3;
        }
        else if(keyCode==LEFT){
          tecla = 4;
        }
      }
      else if(key=='a'||key=='A') tecla = 5;  //si no está conectado lo para
      if(tecla==1){    //si la tecla pulsada és "adelante-1" y la que
        if(teclaAnt==2){  //había pulsada antes era "atras-2"
          if(vel<=2&&vel>0){  //reduce la velocidad
            vel--;
            if(vel==1) robot.write('2');
          }
        }
        else{    //si no había ninguna tecla pulsada antes,
          if(vel<2) vel++;  //aumenta la velocidad hacia adelante
          if(vel==1) robot.write('1');
          else if(vel==2) robot.write('a');
          teclaAnt = 1;
        }
      }
      if(tecla==2){    //si la tecla pulsada es "atras-2" y la que
        if(teclaAnt==1){  //había antes pulsada era "adelante-1"
          if(vel<=2&&vel>0){  //reduce la velocidad
            vel--;
            if(vel==1) robot.write('1');
          }
        }
        else{    //si no había ninguna tecla pulsada antes,
          if(vel<2) vel++;  //aumenta la velocidad hacia atrás
          if(vel==1) robot.write('2');
          else if(vel==2) robot.write('b');
          teclaAnt = 2;
        }
      }
      if(tecla==3){    //si la tecla pulsada es "derecha-3" y la que
        if(teclaAnt==4){  //había antes pulsada era "izquierda-4"
          if(vel<=2&&vel>0){  //reduce la velocidad de giro
            vel--;
            if(vel==1) robot.write('4');
          }
        }
        else{    //si no había ninguna tecla pulsada antes,
          if(vel<2) vel++;  //aumenta la velocidad de giro hacia la derecha
          if(vel==1) robot.write('3');
          else if(vel==2) robot.write('c');
          teclaAnt = 3;
        }
      }
      if(tecla==4){    //si la telca pulsada es "izquierda-4" y la que
        if(teclaAnt==3){  //había antes pulsada era "derecha-3"
          if(vel<=2&&vel>0){  //reduce la velocidad de giro
            vel--;
            if(vel==1) robot.write('3');
          }
        }
        else{    //si no había ninguna tecla pulsada antes,
          if(vel<2) vel++;  //aumenta la velocidad de giro hacia la izquierda
          if(vel==1) robot.write('4');
          else if(vel==2) robot.write('d');
          teclaAnt = 4;
        }
      }
      if(tecla==5){    //si se ha pulsado la tecla 'a'||'A'
        teclaAnt = 0;  //se hace la asignación de tecla y se para el robot
        vel = 0;
        robot.write('5');
      }
      else if(vel==0){    //cuando la velocidad se reduce a 0 en algún momento
        teclaAnt = 0;     //del programa, se para el robot
        robot.write('5');
      }
      velocitat.setValue(vel);  //actualiza el slider de velocidad
    }
  } catch(Exception e){    //si se deconecta el puerto serie
    vel = 0;               //avisa y se reinicia el programa
    velocitat.remove();
    Connectat = !Connectat;
    println("\nNo hay ningún puerto serie conectado.\n");
    try{
      Thread.sleep(1500);
    } catch(Exception e1){
      System.err.print(e1);
    }
    setup();
  }
}
  
