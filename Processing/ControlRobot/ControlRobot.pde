import processing.serial.*;    //llibreries
import controlP5.*;

Serial robot;        //creació objectes de les libreries
ControlP5 controlp5;

PImage im;    //variable per a la imatge del background
PImage imInst;    //imatge d'Instruccions
PImage imInf;    //imatge d'INFO

Textarea textarea;    //objecte per a modificar text

Slider velocitat;    //creació Slider per a la velocitat

boolean Instruccions;    //variables booleanes per als botons
boolean Amagar;
boolean Connectar;
boolean Sortir;
boolean Reiniciar;
boolean INFO;
boolean Connectat;
boolean MostrantInst;
boolean MostrantInf;


void setup() {
  controlp5 = new ControlP5(this); //inicialització controlp5
  im = loadImage("arduino.png");    //imatges per al background
  imInst = loadImage("arduinoInst.png");
  imInf = loadImage("arduinoInf.png");
  interficie();    //carrega la interfície del programa
  if(!Connectat){
    iniBoolean();    //inicia els booleans dels botons a false
    println("\n-------------------\nNo connectat");    //avisa que no hi ha cap connexió
    println("-------------------");
  }
}

void draw() {
  if(MostrantInst||MostrantInf){    //canvia el background segons el botó activat
    if(MostrantInst) background(imInst);
    else if(MostrantInf) background(imInf);
  }
  else background(im);
  if(Connectar&&!Connectat) ConnectaSerial();    //connecta al port sèrie
  if(Instruccions){    //activa les instruccions i canvia el background
    if(Connectat){
      iniBoolean();
      Connectat = true;
    }
    else iniBoolean();
    MostrantInst = true;
  }
  if(INFO){    //activa la informació i canvia el background
    if(Connectat){
      iniBoolean();
      Connectat = true;
    }
    else iniBoolean();
    MostrantInf = true;
  }
  if(Amagar){    //mostra la finestra principal
    if(Connectat){
      iniBoolean();
      Connectat = true;
    }
    else iniBoolean();
  }
  if(Reiniciar){    //desconnecta el port sèrie i torna al setup() del programa
    if(Connectat){
      DesconnectaSerial();
    }
    setup();
  }
  if(Sortir){    //desconnecta el port sèrie i surt del programa
    if(Connectat) DesconnectaSerial();
    exit();
    println("\n\nHas sortit del programa.\n");
  }
}

void interficie() {
  size(600,450);    //Grandària finestra
  controlp5.addButton("Connectar")        //crea els botons
                            .setPosition(20,20)
                            .setSize(80,40);
  controlp5.addButton("Instruccions")
                            .setPosition(20,70)
                            .setSize(80,40);
  controlp5.addButton("INFO")
                            .setPosition(20,120)
                            .setSize(80,40);
  controlp5.addButton("Amagar")
                            .setPosition(20,170)
                            .setSize(80,40);
  controlp5.addButton("Reiniciar")
                            .setPosition(20,340)
                            .setSize(80,40);
  controlp5.addButton("Sortir")
                            .setPosition(20,390)
                            .setSize(80,40);
}

void iniBoolean() {    //inicialització de les variables booleanes a false
  Instruccions = false;
  INFO = false;
  Amagar = false;
  Connectar = false;
  Sortir = false;
  Reiniciar = false;
  Connectat = false;
  MostrantInst = false;
  MostrantInf = false;
}

void ConnectaSerial() {    //connecta al primer port sèrie i crea el slider per a controlar la velocitat
  try{
    robot = new Serial(this,Serial.list()[0],9600);
    Connectat = true;
    velocitat = controlp5.addSlider("Velocitat",0,2,vel,540,325,20,100);
    println("\n-------------------\nConnectat amb èxit!");
    println("-------------------");
  } catch(ArrayIndexOutOfBoundsException e){
    println("\nError al connectar al port sèrie.\n");
    try{
      Thread.sleep(1500);
    } catch(Exception e1){
      System.err.print(e1);
    }
    setup();
  }
}

void DesconnectaSerial() {    //envia al robot la instrucció d'aturar, ho deconnecta
  try{                        //i elimina el slider de velocitat
    robot.write(5);
  } catch(Exception e){
    println("\nNo hi ha cap port sèrie connectat.\n");
    try{
      Thread.sleep(1500);
    } catch(Exception e1){
      System.err.print(e1);
    }
    setup();
  }
  vel = 0;
  robot.clear();
  robot.stop();
  velocitat.remove();
  Connectat = false;
}
