Boton[] pasador;

PImage[] flechas=new PImage[16];
PImage[][] ima=new PImage[4][4];
PImage buferImagen;
int buferAnimago;
int animago[][] =new int [4][4];
int puntos;

void setup() {

  size(800, 700);


  for (int i =0; i<4; i++) {

    for (int j =0; j<4; j++) {
      int p=i+1;
      int y=j+1;
      ima[i][j] = loadImage("("+p+"-"+y+").png");
    }
  }


  background(240, 160, 230);

  pasador = new BotonImagen[16];
  for (int i =0; i<4; i++) {
    flechas[i] = loadImage("arriba.png");
    animago[i][0]=i;
    pasador[i]=new BotonImagen(124+i*90, 32, 42, 42, flechas[i], 0);
  }

  for (int i =0; i<4; i++) {
    flechas[i+4] = loadImage("abajo.png");
    animago[i][1]=i+4;
    pasador[i+4]=new BotonImagen(124+i*90, 502, 42, 42, flechas[i+4], 0);
  }

  for (int i =0; i<4; i++) {
    flechas[i+8] = loadImage("izquierda.png");
    animago[i][2]=i+8;
    pasador[i+8]=new BotonImagen(44, 128+i*90, 42, 42, flechas[i+8], 0);
  }

  for (int i =0; i<4; i++) {
    flechas[i+12] = loadImage("derecha.png");
    animago[i][3]=i+12;
    pasador[i+12]=new BotonImagen(500, 128+i*90, 42, 42, flechas[i+12], 0);
  }
  //pasador = BotonImagen(200,200,20,40,);
  for (int i =0; i<4; i++) {
    for (int j =0; j<4; j++) {
      println(animago[i][j]);
    }
  }
}

void draw() {

  //println(mouseX+" - "+mouseY);

  background(240, 160, 230);


  for (int i =0; i<pasador.length; i++) {
    pasador[i].Mostrar();
  }

  for (int i =0; i<4; i++) {
    for (int j =0; j<4; j++) {
      noFill();

      //rect(90+i*100,90+j*100,100,100);

      image(ima[i][j], 90+i*100, 90+j*100, 100, 100);
      fill(0);
      text(animago[i][j], 600+i*20, 400+j*20);
    }
  }
}

void cambiador(int u, int m) {

  if (pasador[u].MouseIsOver()) {

    buferAnimago=animago[u][0];
    buferImagen=ima[u][0];
    animago[u][0]=animago[u][1];
    ima[u][0]=ima[u][1];
    animago[u][1]=animago[u][2];
    ima[u][1]=ima[u][2];
    animago[u][2]=animago[u][3];
    ima[u][2]=ima[u][3];
    animago[u][3]=buferAnimago;
    ima[u][3]=buferImagen;
  }
  if (pasador[m].MouseIsOver()) {

    buferAnimago=animago[u][3];
    buferImagen=ima[u][3];
    animago[u][3]=animago[u][2];
    ima[u][3]=ima[u][2];
    animago[u][2]=animago[u][1];
    ima[u][2]=ima[u][1];
    animago[u][1]=animago[u][0];
    ima[u][1]=ima[u][0];
    animago[u][0]=buferAnimago;
    ima[u][0]=buferImagen;
  }
}
void cambiadorLateral(int u, int bot1, int bot2) {

  if (pasador[bot1].MouseIsOver()) {
    buferAnimago=animago[0][u];
    buferImagen=ima[0][u];
    animago[0][u]=animago[1][u];
    ima[0][u]=ima[1][u];
    animago[1][u]=animago[2][u];
    ima[1][u]=ima[2][u];
    animago[2][u]=animago[3][u];
    ima[2][u]=ima[3][u];
    animago[3][u]=buferAnimago;
    ima[3][u]=buferImagen;
  }
  if (pasador[bot2].MouseIsOver()) {
    buferAnimago=animago[3][u];
    buferImagen=ima[3][u];
    animago[3][u]=animago[2][u];
    ima[3][u]=ima[2][u];
    animago[2][u]=animago[1][u];
    ima[2][u]=ima[1][u];
    animago[1][u]=animago[0][u];
    ima[1][u]=ima[0][u];
    animago[0][u]=buferAnimago;
    ima[0][u]=buferImagen;
  }
}
void mousePressed() {

  cambiador(0, 4);
  cambiador(1, 5);
  cambiador(2, 6);
  cambiador(3, 7);

  cambiadorLateral(0, 8, 12);
  cambiadorLateral(1, 9, 13);
  cambiadorLateral(2, 10, 14);
  cambiadorLateral(3, 11, 15);
}

void keyPressed() {

  if (key==' ') {
    for (int i =0; i<4; i++) {
      for (int j =0; j<4; j++) {
        if (animago[i][j]==2) {
          int c, v;
          v=i+1;
          c=j+1;
          if (c<4 && v<4) {
            if (animago[v][j]==6 && animago[v][c]==14 && animago[i][c]==10) {
              println("exito1");
              puntos+=5;
            }
          }
        }
        if (animago[i][j]==0) {
          int c, v;
          v=i+1;
          c=j+1;
          if (c<4 && v<4) {
            //println(animago[v][j]+"-"+animago[v][c]+"-"+animago[i][c]);
            if ((animago[v][j]==4 && animago[v][c]==12 && animago[i][c]==8))
            {
              println("exito2");
              puntos+=5;
            }
          }
        }
        if (animago[i][j]==3) {
          int c, v;
          v=i+1;
          c=j+1;
          if (c<4 && v<4) {
            if ((animago[v][j]==7 && animago[v][c]==15 && animago[i][c]==11))
            {
              println("exito3");
              puntos+=5;
            }
          }
        }
        if (animago[i][j]==1) {
          int c, v;
          v=i+1;
          c=j+1;
          if (c<4 && v<4) {
            if ((animago[v][j]==5 && animago[v][c]==13 && animago[i][c]==9))
            {
              println("exito4");
              puntos+=5;
            }
          }
        }
      }
    }
    println(puntos);
  }
}