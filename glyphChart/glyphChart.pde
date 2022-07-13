import org.gicentre.utils.colour.*;      // For colour tables. //<>//
import java.text.NumberFormat;
import org.gicentre.utils.stat.*; 
import java.text.NumberFormat;
// Support code for CSci-5609 Assignment on St. Paul Budget Data
// January 2022
// Authors Dan Keefe and Bridger Herman, Univ. of Minnesota
// {dfk, herma582}@umn.edu

// --------------------- Sketch-wide variables ----------------------

PFont titleFont, smallFont;
BudgetData budgetData;
int gap = 135;
int [] years;
//String [] services;
//float[] services_data;
//float[] norm;
final color BAR_COLOR = color(163, 222, 255, 255);
final int[] DATA = {572621120, 575411010, 614393660, 691049600, 701383170, 750710140, 714607230, 710351490, 811242560};
final String[] LABELS = {"2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022"};
final int[] labels = {2014,2015,2016,2017,2018,2019,2020,2021,2022};
NumberFormat us = NumberFormat.getCurrencyInstance(Locale.US);
List<HashMap<String, Float>> l = new ArrayList<HashMap<String, Float>>();
// ------------------------ Initialisation --------------------------
// HELPER FUNCTIONS
float remap(float value, float min1, float max1, float min2, float max2) {
    return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}
// HELPER FUNCTIONS
float find_max(float[] services_data){
  float maxValue = services_data[0]; 
    for(int i=1;i < services_data.length;i++){ 
      if(services_data[i] > maxValue){ 
         maxValue = services_data[i]; 
      } 
    } 
    return maxValue; 
}

// HELPER FUNCTIONS
float find_min(float[] services_data){
  float minValue = services_data[0]; 
    for(int i=1;i<services_data.length;i++){ 
      if(services_data[i] < minValue){ 
        minValue = services_data[i]; 
      }
    } 
    return minValue; 
}
// Initialises the data and bar chart.
void setup()
{
  size(1280, 720);
  smooth();

  titleFont = loadFont("Helvetica-22.vlw");
  smallFont = loadFont("Helvetica-12.vlw");
  textFont(smallFont);

  budgetData = new BudgetData();
  budgetData.loadFromFile("operating_budget-2022-01-16.csv");
  
  // get the years available in the budget data and save in a global variable for easy access
  years = budgetData.getYears();
  
  for(int i = 0; i < years.length;i++){
    HashMap<String, Float> map = new HashMap<String, Float>();
    map.put("Public Safety", 0.0);
    map.put("Transportation & Infrastructure", 0.0);
    map.put("Debt Management", 0.0);
    map.put("General Government", 0.0);
    map.put("Libraries, Culture & Recreation", 0.0);
    map.put("Community Development & Housing", 0.0);
    map.put("Health and Human Services", 0.0);
    int y = years[i];
    String[] services = budgetData.getYearlyData(y).getServices();
    float[] services_data = new float[services.length];//7
    for(int j = 0; j < services.length; j++){
    services_data[j] = budgetData.getYearlyData(y).getTotalProposedByService(services[j]);
    }
    float lowerest = find_min(services_data);
    float highest = find_max(services_data);
    float[] norm = new float[services_data.length];//7
    for(int j = 0; j < norm.length; j++){
      norm[j] = remap(services_data[j],lowerest, highest,0,1);
    }
    for(int j = 0; j < norm.length; j++){ //7
      map.put(services[j], norm[j]);      
    }
    l.add(map);
  }
  
  // get the services for the most recent year and save in a global variable.  it's smart to
  // use the ordered list of services from just the most recent budget for drawing all of the
  // flowers so that each flower has a consistent ordering of petals and we can compare the
  // same service categories across years.
  //services = budgetData.getYearlyData(years[years.length-1]).getServices(); 
  //services = budgetData.getYearlyData(2014).getServices(); 
  //services_data = new float[services.length];
  //for(int i = 0; i < services.length; i++){
  //  services_data[i] = budgetData.getYearlyData(2014).getTotalProposedByService(services[i]);
  //}
  //norm = new float[services_data.length];
  //for(int i = 0; i < norm.length; i++){
  //  norm[i] = remap(services_data[i],3492901, 164525632,0,1);
  //}
  
}

// ------------------ Processing draw --------------------

// draws a single petal of the flower by drawing an ellipsed scaled in size
// by the data and rotated into position based on the index of the data var
// x = the x position of the center of the flower
// y = the y position of the center of the flower
// index = the index of the petal to draw, 0 for the first, 1 for the second, ...
// nPetals = the total number of petals that will be drawn for the flower
// col = the color to use for this petal
// size = a scaling factor for the petal that should range between 0.0 for the smallest
//        possible petal and 1.0 for the largest possible petal
void drawPetal(float x, float y, int index, int nPetals, color col, float size) {
  float minLen = 5;
  float maxLen = 100;
  float len = minLen + size*(maxLen - minLen);  
  fill(col);
  pushMatrix();
  float angle = (float)index/(float)(nPetals) * TWO_PI;
  translate(x, y);
  rotate(angle);
  ellipse(0, -len/2, len/4, len); 
  popMatrix();
}


// Draws the graph in the sketch.
void draw()
{
  background(255);
  textFont(titleFont);
  fill(0);
  text("St.Paul Proposed Budget, 2014-2022", 500, 30);
  float[] h = new float[years.length];
  for(int i = 0; i < years.length; i++){
    float normalizedValue = remap(DATA[i], 550000000, 850000000, 100, 500);
    h[i] = normalizedValue;
    fill(BAR_COLOR);
    rect(120 + (i * gap), 680, 1, -normalizedValue);
    fill(120);
    text(LABELS[i], 100 + (i * gap),700);
  }
  //circle(mouseX, mouseY, 10); 6-1
  int mouseIndex = int((mouseX / (float) width) * DATA.length);
  fill(color(255,255,255,100));
  fill(153);
  rect(mouseX, mouseY, -300, -200);
  fill(0);
  textSize(15);
  text(LABELS[mouseIndex] + "Proposed Budget",mouseX - 200, mouseY - 180);
  text(us.format(DATA[mouseIndex]), mouseX - 200, mouseY - 165);
  
  textSize(10);
  fill(color(148,0,211));
  text("Health and Human Services", mouseX-295, mouseY-150);
  text(us.format(budgetData.getYearlyData(labels[mouseIndex]).getTotalProposedByService("Health and Human Services")), mouseX-72,mouseY-150);
  fill(color(70,0,130));
  text("Community Development & Housing", mouseX-295, mouseY-135);
  text(us.format(budgetData.getYearlyData(labels[mouseIndex]).getTotalProposedByService("Community Development & Housing")), mouseX-72,mouseY-135);
  fill(color(0,0,255));
  text("Debt Management", mouseX-295, mouseY-120);
  text(us.format(budgetData.getYearlyData(labels[mouseIndex]).getTotalProposedByService("Debt Management")), mouseX-72,mouseY-120);
  fill(color(255,127,0));
  text("Libraries, Culture & Recreation", mouseX-295, mouseY-105);
  text(us.format(budgetData.getYearlyData(labels[mouseIndex]).getTotalProposedByService("Libraries, Culture & Recreation")), mouseX-72,mouseY-105);
  fill(color(255,255,0));
  text("Transportation & Infrastructure", mouseX-295, mouseY-90);
  text(us.format(budgetData.getYearlyData(labels[mouseIndex]).getTotalProposedByService("Transportation & Infrastructure")), mouseX-72,mouseY-90);
  fill(color(0,255,0));
  text("General Government", mouseX-295, mouseY-75);
  text(us.format(budgetData.getYearlyData(labels[mouseIndex]).getTotalProposedByService("General Government")), mouseX-72,mouseY-75);
  fill(color(255,0,0));
  text("Public Safety", mouseX-295, mouseY-60);
  text(us.format(budgetData.getYearlyData(labels[mouseIndex]).getTotalProposedByService("Public Safety")), mouseX-72,mouseY-60);
  color c1 = color(255,0,0);   
  color c2 = color(255,127,0);  
  color c3 = color(255,255,0);  
  color c4 = color(0,255,0);  
  color c5 = color(0,0,255); 
  color c6 = color(70,0,130); 
  color c7 = color(148,0,211);
  
  color[] c = {c1,c2,c3,c4,c5,c6,c7};
  for(int k = 0; k < years.length; k++){ //9
    drawPetal(120 + (k * gap),height-h[k], 0, 7, c[0], l.get(k).get("Public Safety"));
    drawPetal(120 + (k * gap),height-h[k], 1, 7, c[1], l.get(k).get("Libraries, Culture & Recreation"));
    drawPetal(120 + (k * gap),height-h[k], 2, 7, c[2], l.get(k).get("Transportation & Infrastructure")); 
    drawPetal(120 + (k * gap),height-h[k], 3, 7, c[3], l.get(k).get("General Government"));
    drawPetal(120 + (k * gap),height-h[k], 4, 7, c[4], l.get(k).get("Debt Management"));
    drawPetal(120 + (k * gap),height-h[k], 5, 7, c[5], l.get(k).get("Community Development & Housing"));
    drawPetal(120 + (k * gap),height-h[k], 6, 7, c[6], l.get(k).get("Health and Human Services"));
  }
}
