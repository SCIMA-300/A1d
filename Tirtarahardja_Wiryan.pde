//block 2: piechart function implemented (not working due to NaN values)
//variables for entries
//changing the values of variables will change the piechart

//all the data entries
//a=family, b=friends, c=acquantances, d=anonynamous
//future plan: convert fam,fri,acq,ano entries below to array
int a0=1;
int b0=2;
int b1=10;
int b2=9;
int b3=1;
int b4=1;
int b5=2;
int c0=1;
int c1=1;
int c2=1;
int d0=4;
int d1=10;
int d2=1;

int angles[];

// number of contacts will affect catagory entry size
int fam = a0; //total family
int fri = b0+b1+b2+b3+b4+b5; //total friends
int acq = c0+c1+c2; //total acquaintances 
int ano = d0+d1+d2; //total anonynamous
int total = fam+fri+acq+ano;

//converting individual entry to angle values
float dega0=map(a0,1,fam,270,360); //NaN return
float degb0=map(b0,1,fri,270,360);
float degb1=map(b1,1,fri,270,360);
float degb2=map(b2,1,fri,270,360);
float degb3=map(b3,1,fri,270,360);
float degb4=map(b4,1,fri,270,360);
float degb5=map(b5,1,fri,270,360);
float degc0=map(c0,1,acq,270,360);
float degc1=map(c1,1,acq,270,360);
float degc2=map(c2,1,acq,270,360);
float degd0=map(d0,1,ano,270,360);
float degd1=map(d1,1,ano,270,360);
float degd2=map(d2,1,ano,270,360);
//putting angle values above to array var for piechart
float[] degsfam = {1}; //temporary fix for dega0
float[] degsfri = {degb0,degb1,degb2,degb3,degb4,degb5};
float[] degsacq = {degc0,degc1,degc1};
float[] degsano = {degd0,degd1,degd2};

//piechart radius calculation block
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
  pieChart(rad2ano,degsano);
  pieChart(rad2acq,degsacq);
  pieChart(rad2fri,degsfri);
  pieChart(rad2fam,degsfam);
}

void pieChart(float diameter, float[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    fill(gray);
    arc(0, 800, diameter, diameter, lastAngle, lastAngle+(angles[i]));
    lastAngle += radians(angles[i]);
  }
}

