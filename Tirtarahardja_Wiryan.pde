//block-0. no piechart, fixed non array data entries
//variables for entries
//changing the values of variables will change the piechart

//all the data entries
//a=family, b=friends, c=acquantances, d=anonynamous
int a1=1;
int b1=2;
int b2=10;
int b3=9;
int b4=1;
int b5=1;
int b6=2;
int c1=1;
int c2=1;
int c3=1;
int d1=4;
int d2=10;
int d3=1;

// number of contacts will affect catagory entry
int fam = a1; //total family
int fri = b1+b2+b3+b4+b5+b6; //total friends
int acq = c1+c2+c3; //total acquaintances 
int ano = d1+d2+d3; //total anonynamous
int total = fam+fri+acq+ano;

//unmapped radius for catagory circle
int rad1fam = fam;
int rad1fri = fam + fri;
int rad1acq = fam + fri + acq;
int rad1ano = fam + fri + acq + ano;
//mapped radius for catagory circles
float rad2fam = map(rad1fam,1,total,100,1400);
float rad2fri = map(rad1fri,1,total,100,1400);
float rad2acq = map(rad1acq,1,total,100,1400);
float rad2ano = map(rad1ano,1,total,100,1400);

void setup(){
  size(800,800);
}

//testblock for circle w/o piechart
void draw(){
  //the idea is that the max circle size stays the same
  //regardless of entry size, and the divisions would change

  ellipse(0,800,rad2ano,rad2ano);
  ellipse(0,800,rad2acq,rad2acq);
  ellipse(0,800,rad2fri,rad2fri);
  ellipse(0,800,rad2fam,rad2fam);
}
