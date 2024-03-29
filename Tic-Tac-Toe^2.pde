char[][] A0 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] A1 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] A2 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] B0 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] B1 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] B2 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] C0 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] C1 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};
char[][] C2 = {{' ',' ',' '},
               {' ',' ',' '},
               {' ',' ',' '}};  
               
               
char [][] AllLegal= {{'N','E','M'},
                     {'O','G','U'},
                     {'C','A','O'}};
char [][] D = {};
               
char [][][][] Velika = {{A0,A1,A2},{B0,B1,B2},{C0,C1,C2}};    
char[][]VelikaRez = {{' ',' ',' '},
                    {' ',' ',' '},
                    {' ',' ',' '}};  
char Player = 'x';
char znak = ' ';
boolean flag = false;


void setup(){

  size(640,640);
  stroke (50);
  strokeWeight (8);
  SetLegal(AllLegal);

}

void draw(){
  background(100);
  textSize(280);
  textAlign(CENTER);
  
  //velika
  stroke(28);
  line(width/3,0+20,width/3,height-20);
  line(2*width/3,0+20,2*width/3,height-20);
  line(0+20,height/3,width-20,height/3);
  line(0+20,2*height/3,width-20,2*height/3);
  

  //male
  stroke(50);
  int w = width/3;
  int h = height/3;
  for (int i =0; i<3;i++){
     for (int j =0; j<3; j++){
       line(w/3+w*i,0+h*j+20,w/3+w*i,h+h*j-20);
       line(2*w/3+w*i,0+20+h*j,2*w/3+w*i,h+h*j-20);
       line(0+w*i+20,h/3+h*j,w+w*i-20,h/3+h*j);
       line(0+w*i+20,2*h/3+h*j,w+w*i-20,2*h/3+h*j);}}
 
  //male popuna
 textSize(30);
  for(int i=0; i<3; i++){
    for(int j=0;j<3; j++){
      for(int k=0; k<3; k++){
        for(int l=0; l<3; l++){
      text(Velika[l][k][j][i],w/3*i+w*k+w/6,h/3*j+h*l+h/5);
    
    }}}}
    
    //velika popuna
  
  textSize(280);
   for(int i=0; i<3; i++){
    for(int j=0;j<3; j++){
      text(VelikaRez[j][i],width/3*i+width/6,height/3*j+height/3-28);
    }}
  

  if(flag){
  textSize(100);
  fill(100);
  rect(0, 0, width, height);
  fill(255);
  text("Game Over\nPobijedio je\n"+znak, width/2, height/3);}

    
}
void SetLegal(char [][] polje){
D = polje;
}

boolean IsLegal(char [][] polje){
  if (D == AllLegal) return true;
  if (polje == D) return true;
  return false;
}

void ChechWinSmall(char[][] Small, char[][] Velika, int i, int j, int stup, int red){
  if (Small[i][j]==Small[(i+1)%3][j] && Small[i][j]==Small[(i+2)%3][j] && Velika[stup][red] == ' ') Velika[stup][red] = Small [i][j];
  else if (Small[i][j]==Small[i][(j+1)%3] && Small[i][j]==Small[i][(j+2)%3] && Velika[stup][red] == ' ') Velika[stup][red] = Small [i][j];
  else if (i==j && Small[i][j]==Small[(i+1)%3][(j+1)%3] && Small[i][j]==Small[(i+2)%3][(j+2)%3] && Velika[stup][red] == ' ') Velika[stup][red] = Small [i][j];
  else if (i+j == 2 && Small[i][j]==Small[(i+1)%3][(j+2)%3] && Small[i][j]==Small[(i+2)%3][(j+1)%3] && Velika[stup][red] == ' ') Velika[stup][red] = Small [i][j];

}

boolean CheckWinBig(int i, int j){


      if(VelikaRez[i][j]==VelikaRez[(i+1)%3][j] && VelikaRez[i][j]==VelikaRez[(i+2)%3][j] && VelikaRez[i][j]!=' ')return true;
      else if(VelikaRez[i][j]==VelikaRez[i][(j+1)%3] && VelikaRez[i][j]==VelikaRez[i][(j+2)%3] && VelikaRez[i][j]!=' ') return true;
      else if(i==j && VelikaRez[i][j]==VelikaRez[(i+1)%3][(j+1)%3] && VelikaRez[i][j]==VelikaRez[(i+2)%3][(j+2)%3] && VelikaRez[i][j]!=' ') return true;
      else if(i+j == 2 && VelikaRez[i][j]==VelikaRez[(i+1)%3][(j+2)%3] && VelikaRez[i][j]==VelikaRez[(i+2)%3][(j+1)%3] && VelikaRez[i][j]!=' ') return true;
    return false;
}

void GameOver(char znakic){
  znak = znakic;
  flag=true;

}


void mousePressed(){
 int coX = mouseX;
 int coY = mouseY;
 int red = 0;
 int stup = 0;
 int malastup = 0;
 int malared = 0;
 String mala = "";
 char[][] Mala = {};
 

 
 if(coY>0 && coY<width/3){stup = 0;mala += "A";}
else if(coY>width/3 && coY<2*width/3){stup = 1;mala += "B";}
else {stup=2;mala += "C";}

if(coX>0 && coX<height/3){red = 0; mala += "0";}
else if(coX>height/3 && coX<2*height/3){red = 1;mala += "1";}
else {red=2;mala += "2";}


switch (mala){
case "A0":
Mala = A0;
 if(coY>0 && coY<width/9){malastup = 0;}
else if(coY>width/9 && coY<2*width/9){malastup = 1;}
else if(coY>2*width/9 && coY<3*width/9){malastup=2;}

if(coX>0 && coX<height/9){malared = 0;}
else if(coX>height/9 && coX<2*height/9){malared = 1;}
else if(coX>2*height/9 && coX<3*height/9){malared=2;}
break;
case "B0":
Mala = B0;
 if(coY>width/3 && coY<4*width/9){malastup = 0;}
else if(coY>4*width/9 && coY<5*width/9){malastup = 1;}
else if(coY>5*width/9 && coY<6*width/9){malastup=2;}

if(coX>0 && coX<height/9){malared = 0;}
else if(coX>height/9 && coX<2*height/9){malared = 1;}
else if(coX>2*height/9 && coX<3*height/9){malared=2;}
break;
case "C0":
Mala = C0;
 if(coY>2*width/3 && coY<7*width/9){malastup = 0;}
else if(coY>7*width/9 && coY<8*width/9){malastup = 1;}
else if(coY>8*width/9 && coY<9*width/9){malastup=2;}

if(coX>0 && coX<height/9){malared = 0;}
else if(coX>height/9 && coX<2*height/9){malared = 1;}
else if(coX>2*height/9 && coX<3*height/9){malared=2;}
break;
case "A1":
Mala = A1;
 if(coY>0 && coY<width/9){malastup = 0;}
else if(coY>width/9 && coY<2*width/9){malastup = 1;}
else if(coY>2*width/9 && coY<3*width/9){malastup=2;}

if(coX>height/3 && coX<4*height/9){malared = 0;}
else if(coX>4*height/9 && coX<5*height/9){malared = 1;}
else if(coX>5*height/9 && coX<6*height/9){malared=2;}

break;
case "B1":
Mala = B1;
 if(coY>width/3 && coY<4*width/9){malastup = 0;}
else if(coY>4*width/9 && coY<5*width/9){malastup = 1;}
else if(coY>5*width/9 && coY<6*width/9){malastup=2;}

if(coX>height/3 && coX<4*height/9){malared = 0;}
else if(coX>4*height/9 && coX<5*height/9){malared = 1;}
else if(coX>5*height/9 && coX<6*height/9){malared=2;}
break;
case "C1":
Mala = C1;
 if(coY>2*width/3 && coY<7*width/9){malastup = 0;}
else if(coY>7*width/9 && coY<8*width/9){malastup = 1;}
else if(coY>8*width/9 && coY<9*width/9){malastup=2;}

if(coX>height/3 && coX<4*height/9){malared = 0;}
else if(coX>4*height/9 && coX<5*height/9){malared = 1;}
else if(coX>5*height/9 && coX<6*height/9){malared=2;}
break;
case "A2":
Mala = A2;
 if(coY>0 && coY<width/9){malastup = 0;}
else if(coY>width/9 && coY<2*width/9){malastup = 1;}
else if(coY>2*width/9 && coY<3*width/9){malastup=2;}

if(coX>2*height/3 && coX<7*height/9){malared = 0;}
else if(coX>7*height/9 && coX<8*height/9){malared = 1;}
else if(coX>8*height/9 && coX<9*height/9){malared=2;}
break;
case "B2":
Mala = B2;
 if(coY>width/3 && coY<4*width/9){malastup = 0;}
else if(coY>4*width/9 && coY<5*width/9){malastup = 1;}
else if(coY>5*width/9 && coY<6*width/9){malastup=2;}

if(coX>2*height/3 && coX<7*height/9){malared = 0;}
else if(coX>7*height/9 && coX<8*height/9){malared = 1;}
else if(coX>8*height/9 && coX<9*height/9){malared=2;}
break;
case "C2":
Mala = C2;
 if(coY>2*width/3 && coY<7*width/9){malastup = 0;}
else if(coY>7*width/9 && coY<8*width/9){malastup = 1;}
else if(coY>8*width/9 && coY<9*width/9){malastup=2;}

if(coX>2*height/3 && coX<7*height/9){malared = 0;}
else if(coX>7*height/9 && coX<8*height/9){malared = 1;}
else if(coX>8*height/9 && coX<9*height/9){malared=2;}
break;
}



if (Player=='x' && Mala[malastup][malared]==' ' && IsLegal(Mala)){
  Mala[malastup][malared]='x'; 
  Player = 'o'; 
  ChechWinSmall(Mala, VelikaRez, malastup, malared, stup, red);
  if (CheckWinBig(stup, red)) GameOver(VelikaRez[stup][red]);
  if(VelikaRez[malastup][malared] == 'x' || VelikaRez[stup][red] == 'o') SetLegal(AllLegal);
  else SetLegal(Velika[malastup][malared]); 
}

else if(Player=='o' && Mala[malastup][malared]==' ' && IsLegal(Mala)){
  Mala[malastup][malared]='o';
  Player = 'x';
  ChechWinSmall(Mala, VelikaRez, malastup, malared, stup, red);
  if (CheckWinBig(stup, red)) GameOver(VelikaRez[stup][red]);
  if(VelikaRez[malastup][malared] == 'x' || VelikaRez[stup][red] == 'o') SetLegal(AllLegal);
  else SetLegal(Velika[malastup][malared]); 

}
}
