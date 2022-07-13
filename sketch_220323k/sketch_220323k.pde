import org.gicentre.utils.colour.*;   
import java.text.NumberFormat;
import org.gicentre.utils.stat.*; 
import java.text.NumberFormat;
import java.util.*;
NumberFormat us = NumberFormat.getCurrencyInstance(Locale.US);

PImage img, img1, img2, img3, img4, img5, img6, img7, img8, img9, img10;
PImage img11, img12;
PImage safe_subcate;

PFont titleFont;
PFont smallFont;
boolean p1 = true, p2 = true, p3 = true, p4 = true,p5 = true, p6 = true, p7 = true, p8 = true,p9 = true, cm = true;
boolean p10 = false, p11 = false,p12 = false,p13 = false ,p14 = false,p15 = false ,p16 = false;
boolean barTotal = true, barCommunity = false, barDebt = false, barPublicSafety = false;
int gap = 5,gap2 = 25;
final int maximum = 210000000, minimum = 1000000; 
final int[] budget_2014 = {164525632,75624960,145603360, 83660520, 56125584, 43585576, 3492901,0};
final int[] budget_2015 = {166998368,74223648,136481888, 86302888, 61077636, 46745596, 3573455,0};
final int[] budget_2016 = {175558224,76766528,141568256, 100508888, 68245080, 48631280, 3129687,0};
final int[] budget_2017 = {177670544,80359160,151101312, 99928528, 129040648, 49946628, 3010400,0};
final int[] budget_2018 = {183101248,79972880,143361728, 108378616, 132662688, 50915204, 2985189,0};
final int[] budget_2019 = {192956640,84286672,154552000, 118833640, 142320464, 55061180, 2694425,0};
final int[] budget_2020 = {200546224, 87375600, 162163344, 123315600,81247424, 57692736,2276786,0};
final int[] budget_2021 = {200794320, 85943968,163043120,122947832,87090256,48642008,1886091,0};
final int[] budget_2022 = {205828304,88646008,175756176,205255968,82828688,51425512,1487353,0};
final int[] LCR = {75624960,74223648,76766528,80359160,79972880,84286672,87375600,85943968,88646008};
final int[] COM = {43585576,46745596,48631280,49946628,50915204,55061180,57692736,48642008,51425512}; 
final int[] DE = {56125584,61077636,68245080,129040648,132662688,142320464,81247424,87090256,82828688};


final HashMap<Integer,Integer> map = new HashMap<Integer,Integer>();
final color[] colormap = {color(135,206,250),color(134,246,20), color(255,0,0), color(160,160,160),color(204,0,204), color(0,255,255), color(255,255,51), 
color(153,153,0), color(0,102,102)};

final color[] colormap1 = {color(251,180,174),color(179,205,227), color(204,235,197),color(222,203,228), color(254,217,166), color(255,255,204), color(229,216,189)};

final ArrayList<Float> x_y_coord = new ArrayList<Float>();
ArrayList<Integer> l_LCR = new ArrayList<Integer>();
ArrayList<Integer> l_COM = new ArrayList<Integer>();
ArrayList<Integer> l_D = new ArrayList<Integer>();
ArrayList<Integer> yearly = new ArrayList<Integer>();

final float[] norm_2014 = new float[8];
final float[] norm_2015 = new float[8];
final float[] norm_2016 = new float[8];
final float[] norm_2017 = new float[8];
final float[] norm_2018 = new float[8];
final float[] norm_2019 = new float[8];
final float[] norm_2020 = new float[8];
final float[] norm_2021 = new float[8];
final float[] norm_2022 = new float[8];


float remap(float value, float min1, float max1, float min2, float max2) {
    return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

int heightShown(int a){
  if(a < 10000000){
    return a/300000;
  }
  int res = a / 2000000;
  return res;  
}

//value of height when show subcategory
int heightShownSubcategory(int a){
    if(a < 5000000){
    return a/80000;
  }
  return a/800000;
}

int averageValue(int[] a){
  int res = 0;
  for(int i = 0; i < 7; i++){
    res += heightShown(a[i]);
  }
  return res;
}
void setup(){
  size(1200, 800);
  smooth();
  surface.setTitle("Budget Visualization");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  titleFont = loadFont("Helvetica-22.vlw");
  smallFont = loadFont("Helvetica-12.vlw");
  
  safe_subcate = loadImage("SafetyFirst.jpeg");
  img = loadImage("library.jpeg");
  img1 = loadImage("COMM.jpeg");
  img2 = loadImage("safety.jpeg");
  //img3 = loadImage("health.jpeg");
  //img4 = loadImage("trans.jpeg");
  //img5 = loadImage("goverment.jpeg");
  img6 = loadImage("debt.jpeg");
  img7 = loadImage("cancel.png");
  img8 = loadImage("choose.png");
  img9 = loadImage("MN.png");
  img10 = loadImage("mm.png");
  img11 = loadImage("questionmark.png");
 
  
                                      
  for(int i = 0; i < budget_2014.length; i++){
    norm_2014[i] = remap(budget_2014[i], minimum, maximum, 10, 100);
    norm_2015[i] = remap(budget_2015[i], minimum, maximum, 10, 100);
    norm_2016[i] = remap(budget_2016[i], minimum, maximum, 10, 100);
    norm_2017[i] = remap(budget_2017[i], minimum, maximum, 10, 100);
    norm_2018[i] = remap(budget_2018[i], minimum, maximum, 10, 100);
    norm_2019[i] = remap(budget_2019[i], minimum, maximum, 10, 100);
    norm_2020[i] = remap(budget_2020[i], minimum, maximum, 10, 100);
    norm_2021[i] = remap(budget_2021[i], minimum, maximum, 10, 100);
    norm_2022[i] = remap(budget_2022[i], minimum, maximum, 10, 100);
  }
  //for(int i = 0; i < x_y_coord.size();i++){
  //  println(x_y_coord.get(i));
    
  //}
  
  
    
}
void lagend(){
  pushMatrix();
  fill(135,206,250);
  rect(20, 50, 15, 15);
  fill(134,246,20);
  rect(20, 70, 15, 15);
  fill(255,0,0);
  rect(20, 90, 15, 15);
  fill(160,160,160);
  rect(20, 110, 15, 15);
  fill(204,0,204);
  rect(20, 130, 15, 15);
  fill(0,255,255);
  rect(20, 150, 15, 15);
  fill(255,255,51);
  rect(20, 170, 15, 15);
  fill(153,153,0);
  rect(20, 190, 15, 15);
  fill(0,102,102);
  rect(20, 210, 15, 15);
  fill(0); // black
  
  if(!p1){
    fill(255,0,0);
    text("2014", 40, 60);
    fill(135,206,250);
    triangle(140, 380, 150, 400, 160, 380); //Mark
  }
  else if(p1){
    text("2014", 40, 60);
  }
  fill(0);
  if(!p2){
    fill(255,0,0);
    text("2015", 40, 80);
    fill(134,246,20);
    triangle(255, 380, 265, 400, 275, 380); //Mark
  }
  else if(p2){
    text("2015", 40, 80);
  }
  fill(0);
  if(!p3){
    fill(255,0,0);
    text("2016", 40, 100);
    triangle(380, 370, 390, 390, 400, 370); //Mark
  }
  else if(p3){
    text("2016", 40, 100);
  }
  fill(0);
  if(!p4){
    fill(255,0,0);
    text("2017", 40, 120);
    fill(160,160,160);
    triangle(500, 330, 510, 350, 520, 330); //Mark
  }
  else if(p4){
    text("2017", 40, 120);
  }
  fill(0);
  
  if(!p5){
    fill(255,0,0);
    text("2018", 40, 140);
    fill(204,0,204);
    triangle(620, 310, 630, 330, 640, 310); //Mark
  }
  else if(p5){
    text("2018", 40, 140);
  }
  fill(0);
  if(!p6){
    fill(255,0,0);
    text("2019", 40, 160);
    fill(0,255,255);
    triangle(740, 310, 750, 330, 760, 310); //Mark
  }
  else if(p6){
    text("2019", 40, 160);
  }
  
  fill(0);
  if(!p7){
    fill(255,0,0);
    text("2020", 40, 180);
    fill(255,255,51);
    triangle(860, 320, 870, 340, 880, 320); //Mark
  }
  else if(p7){
    text("2020", 40, 180);
  }
  fill(0);
  
  if(!p8){
    fill(255,0,0);
    text("2021", 40, 200);
    fill(153,153,0);
    triangle(980, 330, 990, 350, 1000, 330); //Mark
  }
  else if(p8){
    text("2021", 40, 200);
  }
  fill(0);
  
  if(!p9){
    fill(255,0,0);
    text("2022", 40, 220);
    fill(0,102,102);
    triangle(1100, 280, 1110, 300, 1120, 280); //Mark
  }
  else if(p9){
    text("2022", 40, 220);
  }
  fill(0);
 
  popMatrix();
  
}
void radar_graph(){
  pushMatrix();
  fill(70, 103, 235);
  textFont(titleFont);
  text("St.Paul Proposed Budgets 2014-2022", 420,40);
  popMatrix();
   
  pushMatrix();
  fill(0);
  float angle2 = radians(-128.25);
  translate(250, 260);
  rotate(angle2);
  textFont(smallFont);
  text("Government", 0,0);
  popMatrix();
  
  pushMatrix();
  fill(0);
  float angle = radians(-256.5);
  translate(433, 150);
  rotate(angle);
  textFont(smallFont);
  text("Public Safety", 0,0);
  popMatrix();
  
  pushMatrix();
  fill(0);
  float angle3 = radians(128.25);
  translate(400, 245);
  rotate(angle3);
  textFont(smallFont);
  text("Health", 0,0);
  popMatrix();
  
  pushMatrix();
  fill(0);
  float angle4 = radians(40);
  translate(360, 75);
  rotate(angle4);
  textFont(smallFont);
  text("Community", 0,0);
  popMatrix();
  
  pushMatrix();
  fill(0);
  float angle5 = radians(-175);
  translate(330, 285);
  rotate(angle5);
  textFont(smallFont);
  text("Tran & Infra", 0,0);
  popMatrix();
  
  pushMatrix();
  fill(0);
  float angle6 = radians(-60);
  translate(215, 145);
  rotate(angle6);
  textFont(smallFont);
  text("Debt", 0,0);
  popMatrix();
  
  pushMatrix();
  fill(0);
  float angle7 = radians(-15);
  translate(280, 80);
  rotate(angle7);
  textFont(smallFont);
  text("LC&R", 0,0);
  popMatrix();
  fill(255);
  
}
void line1(ArrayList<Float>x_y_coord){
  //for(int i = 0; i < x_y_coord.size();i++){
  //  println(x_y_coord.get(i));
    
  //}
  //println(x_y_coord.size());
  if(x_y_coord.size() <= 1){
    return;
  }
  else{
  for(int i = 2; i < x_y_coord.size(); i+=2){
    line(x_y_coord.get(i-2),x_y_coord.get(i-1),x_y_coord.get(i),x_y_coord.get(i+1));  
    }
  }  
}
void data_shape(float x, float y, float[] norm, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  int i = 0;
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * norm[i];
    float sy = y + sin(a) * norm[i];
    i++;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void mousePressed() {
  if (mouseX > 15 && mouseX <= 25 && mouseY > 45 && mouseY <=55) {
    p1 = !p1;
    if(p1 == true){
       l_LCR.remove(Integer.valueOf(0));
       l_COM.remove(Integer.valueOf(0));
       l_D.remove(Integer.valueOf(0));
       yearly.remove(Integer.valueOf(2014));
     }
     else{
     yearly.add(2014);
     l_COM.add(0);
     l_D.add(0);
     l_LCR.add(0);}
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 65 && mouseY <=75){
    p2 = !p2;
    if(p2 == true){
       l_LCR.remove(Integer.valueOf(1));
       l_COM.remove(Integer.valueOf(1));
       l_D.remove(Integer.valueOf(1));
       yearly.remove(Integer.valueOf(2015));
     }
     else{
     yearly.add(2015);
     l_COM.add(1);
      l_D.add(1);
     l_LCR.add(1);}
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 85 && mouseY <=95){
    p3 = !p3;
    if(p3 == true){
       l_LCR.remove(Integer.valueOf(2));
       l_COM.remove(Integer.valueOf(2));
       l_D.remove(Integer.valueOf(2));
       yearly.remove(Integer.valueOf(2016));
     }
     else{
     yearly.add(2016);
      l_D.add(2);
     l_COM.add(2);
     l_LCR.add(2);
     }
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 105 && mouseY <=115){
    p4 = !p4;
    if(p4 == true){
       l_LCR.remove(Integer.valueOf(3));
       l_COM.remove(Integer.valueOf(3));
       l_D.remove(Integer.valueOf(3));
       yearly.remove(Integer.valueOf(2017));
     }
     else{
     yearly.add(2017);
     l_COM.add(3);
     l_D.add(3);
     l_LCR.add(3);}  
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 125 && mouseY <=135){
    p5 = !p5;
    if(p5 == true){
       l_LCR.remove(Integer.valueOf(4));
       l_COM.remove(Integer.valueOf(4));
       l_D.remove(Integer.valueOf(4));
       yearly.remove(Integer.valueOf(2018));
     }
     else{
     yearly.add(2018);
     l_COM.add(4);
     l_D.add(4);
     l_LCR.add(4);} 
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 145 && mouseY <=155){
    p6 = !p6;
    if(p6 == true){
       l_LCR.remove(Integer.valueOf(5));
       l_COM.remove(Integer.valueOf(5));
       l_D.remove(Integer.valueOf(5));
       yearly.remove(Integer.valueOf(2019));
     }
     else{
     yearly.add(2019);
     l_COM.add(5);
      l_D.add(5);
     l_LCR.add(5);}
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 165 && mouseY <=175){
    p7 = !p7;
    if(p7 == true){
       l_LCR.remove(Integer.valueOf(6));
       l_COM.remove(Integer.valueOf(6));
       l_D.remove(Integer.valueOf(6));
       yearly.remove(Integer.valueOf(2020));
     }
     else{
     yearly.add(2020);
     l_COM.add(6);
     l_D.add(6);
     l_LCR.add(6);}   
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 185 && mouseY <=195){
    p8 = !p8;
    if(p8 == true){
       l_LCR.remove(Integer.valueOf(7));
       l_COM.remove(Integer.valueOf(7));
       l_D.remove(Integer.valueOf(7));
       yearly.remove(Integer.valueOf(2021));
     }
     else{
     yearly.add(2021);
     l_COM.add(7);
     l_D.add(7);
     l_LCR.add(7);}   
  }
  if(mouseX > 15 && mouseX <= 25 && mouseY > 205 && mouseY <=215){
    p9 = !p9;
    if(p9 == true){
       l_LCR.remove(Integer.valueOf(8));
       l_COM.remove(Integer.valueOf(8));
       l_D.remove(Integer.valueOf(8));
       yearly.remove(Integer.valueOf(2022));
     }
     else{
     yearly.add(2022);
     l_COM.add(8);
     l_D.add(8);
     l_LCR.add(8);}
  }
  
  
  if(mouseX > 15 && mouseX <= 80 && mouseY > 490 && mouseY < 510){
    p10 = true;
    p11 = false;
    p12 = false;
    p13 = false;
    p14 = false;
    p15 = false;
    p16 = false;
  }
  if(mouseX > 15 && mouseX <= 80 && mouseY > 510 && mouseY < 530){
    p11 = true;
    p10 = false;
    p12 = false;
    p13 = false;
    p14 = false;
    p15 = false;
    p16 = false;
  }
  if(mouseX > 15 && mouseX <= 80 && mouseY > 530 && mouseY < 550){
    p12 = true;
    p11 = false;
    p10 = false;
    p13 = false;
    p14 = false;
    p15 = false;
    p16 = false;
  }
  if(mouseX > 15 && mouseX <= 80 && mouseY > 550 && mouseY < 570){
    p13 = true;
    p11 = false;
    p10 = false;
    p12 = false;
    p14 = false;
    p15 = false;
    p16 = false;
  }
  if(mouseX > 15 && mouseX <= 80 && mouseY > 570 && mouseY < 590){
    p14 = true;
    p11 = false;
    p10 = false;
    p13 = false;
    p12 = false;
    p15 = false;
    p16 = false;
  }
  if(mouseX > 15 && mouseX <= 80 && mouseY > 590 && mouseY < 610){
    p15 = true;
    p11 = false;
    p10 = false;
    p13 = false;
    p12 = false;
    p14 = false;
    p16 = false;
  }
  if(mouseX > 15 && mouseX <= 80 && mouseY > 610 && mouseY < 630){
    p16 = true;
    p11 = false;
    p10 = false;
    p13 = false;
    p12 = false;
    p14 = false;
    p15 = false;
  }
  if(mouseX > 3 && mouseX <= 40 && mouseY > 630 && mouseY < 670){
    p16 = false;
    p11 = false;
    p10 = false;
    p13 = false;
    p12 = false;
    p14 = false;
    p15 = false;
  }
  
}
void keyPressed(){
  if (key == 'c') {
     cm = !cm; //false
  }
  if (key == 'r'){
    p1 = true;
    p2 = true;
    p3 = true;
    p4 = true;
    p5 = true;
    p6 = true;
    p7 = true;
    p8 = true;
    p9 = true;
    yearly.removeAll(yearly);
    l_LCR.removeAll(l_LCR);
    l_COM.removeAll(l_COM);
    l_D.removeAll(l_D);
    System.out.println("Reset the visualization");
  }
  
    if (key == 't') {
      //barTotal = !barTotal;
      if(!barTotal){
        barTotal = !barTotal;
        barPublicSafety = !barPublicSafety;
      }
    }
  
    if (barTotal == true) { 
      if (key == '6') {
        barPublicSafety = !barPublicSafety;
        barTotal = !barTotal;
      }
    }
}

// helper method for pie chart
int[] angleCalculation(int[] a, int total) {
  int[] res = new int[7];
  int last = 360;
  for (int i = 0; i < 6; i++) {
    res[i] = int(float(a[i]) / float(total) * 360);
    last -= res[i];
  }
  res[6] = last;
  return res;
}

void draw(){
  background(240);
  //triangle(120, 300, 232, 380, 344, 300); Mark
  image(img9, 800,5,48,48);
  fill(0);
  
  text("FAQ", 1090,45);
  image(img11,1120,15,64,64);
  
  if(mouseX >= 1100 && mouseX <= 1200 && mouseY > 5 && mouseY <= 75){
    fill(255);
    rect(1000,175,350,250);
    fill(0);
    text("Guide", 980,70);
    text("RADAR:", 830, 90);
    text("1. Click on the legends to show the year you want", 840, 105);
    text("2. Move cursor over service name to see detail in subplot", 840, 120);
    text("3. Use 'C' to change number / line chart in the subplot", 840, 135);
    text("4. Use 'R' to clear the radar graph", 840, 150);
    text("BAR CHART:", 830, 180);
    text("1. Move the cursor over the bar to see pie chart", 840, 195);
    text("2. Click on legends to see percent shown in the subplot", 840, 210);
    text("3. Press corresponding key to show subcategory bar chart", 840, 225);
    text("4. Legends corresponding '1' to '7' from top to bottom " , 840, 240);
    text("5. Press 'T' to go back to show total value" , 840, 255);
  }
  
  int[] total =       {572621120, 575411008, 614393664, 691049600, 701383168, 750710144, 714607232, 710351488, 811242560};
  int[] Community =   {43585576,    46745596,   48631280,    49946628,     50915204,    55061180,    57692736,    48642008,    51425512}; 
  int[] Debt      =   {56125584,    61077636,   68245080,    129040648,    132662688,   142320464,   81247424,    87090256,    82828688};
  int[] GeneralG  =   {83660520,    86302888,   100508888,   99928528,     108378616,   118833640,   123315600,   122947832,   205255968};
  int[] Health    =   {3492901,     3573455,    3129687,     3010400,      2985189,     2694425,     2276786,     1886091,     1487353};
  int[] Library   =   {75624960,    74223648,   76766528,    80359160,     79972880,    84286672,    87375600,    85943968,    88646008};
  int[] PubSafety =   {164525632,   166998368,  175558224,   177670544,    183101248,   192956640,   200546224,   200794320,   205828304};
  int[] Transport =   {145603360,   136481888,  141568256,   151101312,    143361728,   154552000,   162163344,   163043120,   175756176};
  
int[] pie_2014 = {43585576, 56125584, 83660520, 3492901, 75624960, 164525632, 145603360};
  int[] pie_2015 = {46745596, 61077636, 86302888, 3573455, 74223648, 166998368, 136481888};
  int[] pie_2016 = {48631280, 68245080, 100508888, 3129687, 76766528, 175558224, 141568256};
  
  //if(cur){
  //  cursor(img10);
  //}
  //else{    
  //  cursor(ARROW);
  //}
  
  String[] legand = {"Community","Debt","GeneralG","Health","Library","PubSafety","Transport"};
  int[][] data = new int[7][9];
  
  for(int i = 0; i < 9; i++){
    data[0][i] = Community[i];
    data[1][i] = Debt[i];
    data[2][i] = GeneralG[i];
    data[3][i] = Health[i];
    data[4][i] = Library[i];
    data[5][i] = PubSafety[i];
    data[6][i] = Transport[i];
  }
  int firstColx = 150; 
  int gap = 40;
  int allWidth = 80; 
  
  int[] heightSoFar = new int[9]; 
  
  
 
  if(barTotal){
    // legend for barchart
  noStroke();
  image(img8, 5, 420, 50, 50);
  if(p10){
      fill(0);
      rect(40, 500 , 75,15);
      fill(colormap1[6]);
      text(legand[6], 15, 505);
      
    }
    else if(!p10){
      fill(colormap1[6]);
      rect(40, 500 , 75,15);
      fill(0);
      text(legand[6], 15, 505);
    }
    
  if(p11){
      fill(0);
      rect(40, 520 , 75,15);
      fill(colormap1[5]);
      text(legand[5], 15, 525);
      
    }
    else if(!p11){
      fill(colormap1[5]);
      rect(40, 520 , 75,15);
      fill(0);
      text(legand[5], 15, 525);
    }
    
  if(p12){
      fill(0);
      rect(40, 540 , 75,15);
      fill(colormap1[4]);
      text(legand[4], 15, 545);
      
    }
    else if(!p12){
      fill(colormap1[4]);
      rect(40, 540 , 75,15);
      fill(0);
      text(legand[4], 15, 545);
    }
  if(p13){
      fill(0);
      rect(40, 560 , 75,15);
      fill(colormap1[3]);
      text(legand[3], 15, 565);
      
    }
    else if(!p13){
      fill(colormap1[3]);
      rect(40, 560 , 75,15);
      fill(0);
      text(legand[3], 15, 565);
    }
    
  if(p14){
      fill(0);
      rect(40, 580 , 75,15);
      fill(colormap1[2]);
      text(legand[2], 15, 585);
      
    }
    else if(!p14){
      fill(colormap1[2]);
      rect(40, 580 , 75,15);
      fill(0);
      text(legand[2], 15, 585);
    }
    
  if(p15){
      fill(0);
      rect(40, 600 , 75,15);
      fill(colormap1[1]);
      text(legand[1], 15, 605);
      
    }
    else if(!p15){
      fill(colormap1[1]);
      rect(40, 600 , 75,15);
      fill(0);
      text(legand[1], 15, 605);
    }
    
  if(p16){
      fill(0);
      rect(40, 620 , 75,15);
      fill(colormap1[0]);
      text(legand[0], 15, 625);
      
    }
    else if(!p16){
      fill(colormap1[0]);
      rect(40, 620 , 75,15);
      fill(0);
      text(legand[0], 15, 625);
    }
  

  image(img7, 5, 640, 24, 24);
  fill(0);
  text("Cancel" ,35,655);

  for(int i = 0; i < 7; i++){
    //colorVal += 30;
    firstColx = 150; 
    fill(colormap1[i]);
    for(int j = 0; j < 9; j++){
      rectMode(CENTER);
      rect(firstColx, 720 - heightSoFar[j]- heightShown(data[i][j])/2, allWidth, heightShown(data[i][j]));
     
      heightSoFar[j] += heightShown(data[i][j]);
      firstColx += gap + 80;
    }
  }
  int AverageHeight = (averageValue(budget_2014) + averageValue(budget_2015)+ averageValue(budget_2016)+averageValue(budget_2017)+
  averageValue(budget_2018)+averageValue(budget_2019)+averageValue(budget_2020)+averageValue(budget_2021)+averageValue(budget_2022)) / 9;
  stroke(2);
  line(100, 720 - AverageHeight, 1150, 720 -AverageHeight);
  fill(2);
  text("Average", 50, 720 -AverageHeight);
  noStroke();
  if (mouseX <= 190 && mouseX >= 110 && mouseY <= 800 && mouseY >= 400) {
      //fill(102, 178, 255);
      
      stroke(0);
      fill(255);
      rect(mouseX + 120, mouseY - 100, 300, 200);
      fill(0);
      text("2014 Category Pie Chart", mouseX + 50 , mouseY - 180);
      noStroke();
      float lastAngle = 0;
      int[] angles = angleCalculation(pie_2014, total[0]);
      for (int j = 0; j < angles.length; j++) {
        fill(colormap1[j]);
        arc(mouseX + 120, mouseY - 90, 150, 150, lastAngle, lastAngle+radians(angles[j]));
        lastAngle += radians(angles[j]);  
      }
      fill(255);
      circle(mouseX + 120, mouseY - 90,120);
      //fill(0);
      if(p10){
          fill(0);
          text("Transport -  25.43%" , mouseX + 70, mouseY-90);
      }
      else if(p11){
        fill(0);
        text("Public Safety -  15.43%" , mouseX + 60, mouseY-90);
      }
      else if(p12){
        fill(0);
        text("Library -  13.21%" , mouseX + 75, mouseY-90);
      }
      else if(p13){
        fill(0);
        text("Health -  6.10%" , mouseX + 77, mouseY-90);
      }
      else if(p14){
        fill(0);
        text("Government -  14.61%" , mouseX + 65, mouseY-90);
      }
      else if(p15){
        fill(0);
        text("Debt -  9.80%" , mouseX + 90, mouseY-90);
      }
      else if(p16){
        fill(0);
        text("Community -  7.60%" , mouseX + 70, mouseY-90);
      }
    }
    if (mouseX <= 310 && mouseX >= 230 && mouseY <= 800 && mouseY >= 400) {
      //fill(102, 178, 255);
      
      stroke(0);
      fill(255);
      rect(mouseX + 120, mouseY - 100, 300, 200);
      fill(0);
      text("2015 Category Pie Chart", mouseX + 50 , mouseY - 180);
      noStroke();
      float lastAngle = 0;
      int[] angles = angleCalculation(pie_2015, total[1]);
      for (int j = 0; j < angles.length; j++) {
        fill(colormap1[j]);
        arc(mouseX + 120, mouseY - 90, 150, 150, lastAngle, lastAngle+radians(angles[j]));
        lastAngle += radians(angles[j]);  
      }
      fill(255);
      circle(mouseX + 120, mouseY - 90,120);
      //fill(0);
      if(p10){
          fill(0);
          text("Transport -  26.21%" , mouseX + 70, mouseY-90);
      }
      else if(p11){
        fill(0);
        text("Public Safety -  14.13%" , mouseX + 60, mouseY-90);
      }
      else if(p12){
        fill(0);
        text("Library -  14.01%" , mouseX + 75, mouseY-90);
      }
      else if(p13){
        fill(0);
        text("Health -  5.19%" , mouseX + 77, mouseY-90);
      }
      else if(p14){
        fill(0);
        text("Government -  17.81%" , mouseX + 65, mouseY-90);
      }
      else if(p15){
        fill(0);
        text("Debt -  8.81%" , mouseX + 90, mouseY-90);
      }
      else if(p16){
        fill(0);
        text("Community -  8.32%" , mouseX + 70, mouseY-90);
      }
    }
    
    if (mouseX <= 430 && mouseX >= 350 && mouseY <= 800 && mouseY >= 400) {
      //fill(102, 178, 255);
      
      stroke(0);
      fill(255);
      rect(mouseX + 120, mouseY - 100, 300, 200);
      fill(0);
      text("2016 Category Pie Chart", mouseX + 50 , mouseY - 180);
      noStroke();
      float lastAngle = 0;
      int[] angles = angleCalculation(pie_2016, total[2]);
      for (int j = 0; j < angles.length; j++) {
        fill(colormap1[j]);
        arc(mouseX + 120, mouseY - 90, 150, 150, lastAngle, lastAngle+radians(angles[j]));
        lastAngle += radians(angles[j]);  
      }
      fill(255);
      circle(mouseX + 120, mouseY - 90,120);
      //fill(0);
      if(p10){
          fill(0);
          text("Transport -  28.12%" , mouseX + 70, mouseY-90);
      }
      else if(p11){
        fill(0);
        text("Public Safety -  13.03%" , mouseX + 60, mouseY-90);
      }
      else if(p12){
        fill(0);
        text("Library -  15.27%" , mouseX + 75, mouseY-90);
      }
      else if(p13){
        fill(0);
        text("Health -  6.15%" , mouseX + 77, mouseY-90);
      }
      else if(p14){
        fill(0);
        text("Government -  12.81%" , mouseX + 65, mouseY-90);
      }
      else if(p15){
        fill(0);
        text("Debt -  8.81%" , mouseX + 90, mouseY-90);
      }
      else if(p16){
        fill(0);
        text("Community -  6.03%" , mouseX + 70, mouseY-90);
      }
    }
   
  }

  if (barPublicSafety) {
    text("Bar Chart of Public Safety", 500, 400);
    
      fill(colormap1[2]);
      rect(45, 597 , 75,15);
      fill(0);
      text("Police", 15, 600);
      
      fill(colormap1[1]);
      rect(45, 622 , 75,15);
      fill(0);
      text("Fire", 15, 625);
      
      fill(colormap1[0]);
      rect(45, 647 , 75,15);
      fill(0);
      text("Emergency", 15, 650);
      
    //int[] PubSafety =   {164525632,   166998368,  175558224,   177670544,    183101248,   192956640,   200546224,   200794320,   205828304};
    int[] PS2014 = {1392043, 62460287, 108692612}; int[] PS2015 = {1372550, 62925387, 102700396}; int[] PS2016 = {1392043, 65472954, 108692612};
    int[] PS2017 = {1429716, 67787971, 108453241}; int[] PS2018 = {2035952, 69484280, 111581969}; int[] PS2019 = {2180718, 73783846, 116993086};
    int[] PS2020 = {2035344, 75979043, 122531205}; int[] PS2021 = {1963216, 76498947, 122332628}; int[] PS2022 = {6625598, 78395342, 120807668};
    int[] heightSoFar_PS = new int[9];
      int[][] PSdata = new int[3][9];
      
      for(int i = 0; i < 3; i++){
        PSdata[i][0] = PS2014[i];
        PSdata[i][1] = PS2015[i];
        PSdata[i][2] = PS2016[i];
        PSdata[i][3] = PS2017[i];
        PSdata[i][4] = PS2018[i];
        PSdata[i][5] = PS2019[i];
        PSdata[i][6] = PS2020[i];
        PSdata[i][7] = PS2021[i];
        PSdata[i][8] = PS2022[i];
      }
      
    int AveragePS = 0; 

   for(int i = 0; i < 3; i++){
    //colorVal += 30;
    noStroke();
    firstColx = 150; 
    fill(colormap1[i]);
    for(int j = 0; j < 9; j++){
      
      rectMode(CENTER);
      rect(firstColx, 720 - heightSoFar_PS[j]- heightShownSubcategory(PSdata[i][j])/2, allWidth, heightShownSubcategory(PSdata[i][j]));
     //rect(100,100,100,100);
      heightSoFar_PS[j] += heightShownSubcategory(PSdata[i][j]);
      firstColx += 120;
      AveragePS += heightShownSubcategory(PSdata[i][j]);
    }
  }
  
  AveragePS = AveragePS/9;
  stroke(2);
  line(100, 720 - AveragePS, 1150, 720 - AveragePS);
  fill(2);
  text("Average", 50, 720 -AveragePS);
    
    // ------  detailed in the subcategory --------
    if (mouseX <= 190 && mouseX >= 110 && mouseY <= 800 && mouseY >= 500) {
      stroke(0);
      fill(255);
      rect(mouseX + 120, mouseY - 100, 300, 200);
      fill(0);
      text("Public Safety for 2014", mouseX + 50 , mouseY - 180);
      text("Emergency Management", mouseX - 25 , mouseY - 140);
      text("$1,367,909.04", mouseX + 180 , mouseY - 140);
      text("Fire and Safety Services", mouseX -25 , mouseY - 110);
      text("$624,60,287.23", mouseX + 180 , mouseY - 110);
      text("Police", mouseX - 25 , mouseY - 80);
      text("$100,697,490.9", mouseX + 180 , mouseY - 80);
      image(safe_subcate, mouseX + 50, mouseY - 100, width/14, height/8);
      
    }
    if (mouseX <= 310 && mouseX >= 230 && mouseY <= 800 && mouseY >= 500) {
      stroke(0);
      fill(255);
      rect(mouseX + 120, mouseY - 100, 300, 200);
      fill(0);
      text("Public Safety for 2014", mouseX + 50 , mouseY - 180);
      text("Emergency Management", mouseX - 25 , mouseY - 140);
      text("$1,372,550.2", mouseX + 180 , mouseY - 140);
      text("Fire and Safety Services", mouseX -25 , mouseY - 110);
      text("$629,25,387.89", mouseX + 180 , mouseY - 110);
      text("Police", mouseX - 25 , mouseY - 80);
      text("$102,700,396.2", mouseX + 180 , mouseY - 80);
      image(safe_subcate, mouseX + 50, mouseY - 100, width/14, height/8);
      
    }
  
  
      if (mouseX <= 430 && mouseX >= 350 && mouseY <= 800 && mouseY >= 500) {
      stroke(0);
      fill(255);
      rect(mouseX + 120, mouseY - 100, 300, 200);
      fill(0);
      text("Public Safety for 2014", mouseX + 50 , mouseY - 180);
      text("Emergency Management", mouseX - 25 , mouseY - 140);
      text("$1,392,043.81", mouseX + 180 , mouseY - 140);
      text("Fire and Safety Services", mouseX -25 , mouseY - 110);
      text("$65,472,954.43", mouseX + 180 , mouseY - 110);
      text("Police", mouseX - 25 , mouseY - 80);
      text("$108,692,612.4", mouseX + 180 , mouseY - 80);
      image(safe_subcate, mouseX + 50, mouseY - 100, width/14, height/8);
      
    }
}
  
  int yearPrint = 2014;
  firstColx = 130; 
  fill(0);
  for(int i = 0; i < 9; i++){
    text(Integer.toString(yearPrint), firstColx, 750);
    yearPrint++;
    firstColx += gap + 80;
  }
  
  stroke(0);
  lagend();
  radar_graph();
  
  pushMatrix();
  int index = 100;
  for(int i = 0; i < 10; i++){  
    polygon(320, 180, index, 7);  // Heptagon
    index -=10;
  }
  popMatrix();
  
  pushMatrix();
  //fill(135,206,250);
  if(!p1){ //is false 
    fill(135,206,250,40);
    data_shape(320,180,norm_2014,7);
    fill(0);
    
  }
  if(!p2){
    fill(134,246,20,40);
    data_shape(320,180,norm_2015,7);
  }
  if(!p3){
    fill(255,0,0,40);
    data_shape(320,180,norm_2016,7);
  }
  if(!p4){
    fill(160,160,160,40);
    data_shape(320,180,norm_2017,7);
  }
  if(!p5){
    fill(204,0,204,40);
    data_shape(320,180,norm_2018,7);
  }
  if(!p6){
    fill(0,255,255,40);
    data_shape(320,180,norm_2019,7);
  }
  if(!p7){
    fill(255,255,51,40);
    data_shape(320,180,norm_2020,7);
  }
  if(!p8){
    fill(153,153,0,40);
    data_shape(320,180,norm_2021,7);
  }
  if(!p9){
    fill(0,102,102,40); 
    data_shape(320,180,norm_2022,7);
  }
  popMatrix();
  
  Collections.sort(l_LCR);
  Collections.sort(l_COM);
  Collections.sort(l_D);
  Collections.sort(yearly);
  map.put(2014,0);
  map.put(2015,1);
  map.put(2016,2);
  map.put(2017,3);
  map.put(2018,4);
  map.put(2019,5);
  map.put(2020,6);
  map.put(2021,7);
  map.put(2022,8);
 
  if(mouseX > 270 && mouseX < 320 && mouseY > 70 && mouseY < 90){
    image(img, 880, 77, width/4, height/4);
    fill(255);
    rect(630, 180,300,200);
    fill(0);
    if(cm){
      for(int i = 0; i < l_LCR.size(); i++){
        fill(colormap[l_LCR.get(i)]);
        text(yearly.get(i) + " Libraries, Culture & Recreation: " + us.format(LCR[l_LCR.get(i)]), 485, 95+20*i); 
        fill(255);
      }
    }
    else{
        text("Line Graph for LCR", 580, 100);
        line(540, 250,760,250);
        line(540, 250,540,110);
        text("14", 545,265);
        text("15", 570,265);
        text("16", 595,265);
        text("17", 620,265);
        text("18", 645,265);
        text("19", 670,265);
        text("20", 695,265);
        text("21", 720,265);
        text("22", 745,265);     
        textSize(8);
        text(us.format(70000000), 485,245);
        text(us.format(75000000), 485,215);
        text(us.format(80000000), 485,185);
        text(us.format(85000000), 485,155);
        text(us.format(90000000), 485,120);
        textFont(smallFont);
        for(int i = 0; i < l_LCR.size(); i++){  
          int temp = map.get(yearly.get(i));
          float sx = 545.01 + temp*25;
          float sy = 245-remap(LCR[l_LCR.get(i)],70000000,90000000,30,120);
          circle(sx ,sy, 5);
          x_y_coord.add(sx);
          x_y_coord.add(sy);
         }
        fill(0);
        line1(x_y_coord); 
     }
     x_y_coord.clear();
   }
   else if(mouseX > 360 && mouseX <= 390 && mouseY > 75&& mouseY <= 105){
     image(img1, 880, 77, width/4, height/4);
     fill(255);
     rect(630, 180,300,200);
     fill(0);
     if(cm){
      for(int i = 0; i < l_COM.size(); i++){
        fill(colormap[l_COM.get(i)]);
        text(yearly.get(i) + " Community: " + us.format(COM[l_COM.get(i)]), 485, 95+20*i); 
        fill(255);
      }
    }
    else{
        text("Line Graph for Community", 560, 100);
        line(540, 250,760,250);
        line(540, 250,540,110);
        text("14", 545,265);
        text("15", 570,265);
        text("16", 595,265);
        text("17", 620,265);
        text("18", 645,265);
        text("19", 670,265);
        text("20", 695,265);
        text("21", 720,265);
        text("22", 745,265);     
        textSize(8);
        text(us.format(40000000), 485,245);
        text(us.format(45000000), 485,215);
        text(us.format(50000000), 485,185);
        text(us.format(55000000), 485,155);
        text(us.format(60000000), 485,120);
        textFont(smallFont);
        for(int i = 0; i < l_COM.size(); i++){  
          int temp = map.get(yearly.get(i));
          float sx = 545.01 + temp*25;
          float sy = 245-remap(COM[l_COM.get(i)],40000000,60000000,30,120);
          circle(sx ,sy, 5);
          x_y_coord.add(sx);
          x_y_coord.add(sy);
         }
        fill(0);
        line1(x_y_coord); 
     }
     x_y_coord.clear();

   }
   
   else if(mouseX > 410 && mouseX <= 440 && mouseY > 160&& mouseY <= 190){
     image(img2, 880, 77, width/4, height/4);
     fill(255);
     rect(630, 180,300,200);
     fill(0);     
   }
   else if(mouseX > 210 && mouseX <= 240 && mouseY > 130&& mouseY <= 160){
     image(img6, 880, 77, width/4, height/4);
     fill(255);
     rect(630, 180,300,200);
     fill(0); 
     if(cm){
      for(int i = 0; i < l_D.size(); i++){
        fill(colormap[l_D.get(i)]);
        text(yearly.get(i) + " Debt Mangement: " + us.format(DE[l_D.get(i)]), 485, 95+20*i); 
        fill(255);
      }
    }
    else{
        text("Line Graph for Debt", 580, 100);
        line(540, 250,760,250);
        line(540, 250,540,110);
        text("14", 545,265);
        text("15", 570,265);
        text("16", 595,265);
        text("17", 620,265);
        text("18", 645,265);
        text("19", 670,265);
        text("20", 695,265);
        text("21", 720,265);
        text("22", 745,265);     
        textSize(8);
        text(us.format(50000000), 485,245);
        text(us.format(75000000), 485,215);
        text(us.format(100000000), 485,185);
        text(us.format(125000000), 485,155);
        text(us.format(150000000), 485,120);
        textFont(smallFont);
        for(int i = 0; i < l_D.size(); i++){  
          int temp = map.get(yearly.get(i));
          float sx = 545.01 + temp*25;
          float sy = 245-remap(DE[l_D.get(i)],50000000,150000000,30,120);
          circle(sx ,sy, 5);
          x_y_coord.add(sx);
          x_y_coord.add(sy);
         }
        fill(0);
        line1(x_y_coord); 
     }
     x_y_coord.clear();
   }
   
}
