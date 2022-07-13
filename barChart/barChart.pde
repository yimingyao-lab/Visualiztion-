import org.gicentre.utils.stat.*;        // For chart classes. //<>//

// Adapted for CSci-5609 Assignment on St. Paul Budget Data
// January 2022
// Authors Dan Keefe and Bridger Herman, Univ. of Minnesota
// {dfk, herma582}@umn.edu

// Sketch to demonstrate the use of the BarChart class to draw simple bar charts.
// Version 1.3, 6th February, 2016.
// Author Jo Wood, giCentre.

// --------------------- Sketch-wide variables ----------------------

BarChart barChart;
BarChart approvedBarChart;
PFont titleFont,smallFont;

BudgetData budgetData;

// ------------------------ Initialisation --------------------------

// Initialises the data and bar chart.
float remap(float value, float min1, float max1, float min2, float max2) {
    return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

void setup()
{
  size(1280, 720);
  smooth();

  titleFont = loadFont("Helvetica-22.vlw");
  smallFont = loadFont("Helvetica-12.vlw");
  textFont(smallFont);

  // here's how to load the budget data
  budgetData = new BudgetData();
  budgetData.loadFromFile("operating_budget-2022-01-16.csv");

  // here's how to get the years available in the budget data as an array of ints
  int [] years = budgetData.getYears(); //2014-2022 
  float [] barData = new float[years.length];
  float [] barData2 = new float[years.length];
  
  //float [] barData3 = new float[years.length];
  
  for(int i = 0; i < years.length; i++){
    // here's an example of how you can request data aggregated by year for the first available year:
    YearlyData yd = budgetData.getYearlyData(years[i]);
    float pd = yd.getTotalProposed();
    float pd2 = yd.getTotalApproved();
    barData[i] = pd;
    barData2[i] = pd2;
  }
  System.out.println(barData[0]);
  System.out.println(barData2[0]);
  
  String [] barLabels = new String[years.length];
  for(int i = 0; i < years.length; i++){
    barLabels[i] = String.valueOf(years[i]);
  }
  
  
  // right now the data are hardcoded based on the example provided with giCentreUtils
  // you need to change the values in the arrays below in order to create data and label
  // arrays to visualize the st. paul budget.
  //float [] barData = new float[] {2462,2801,3280,3983, 4490, 4894, 5642, 6322, 6489,
  //                                6401,7657,9649,9767,12167,15154,18200,23124,28645,39471};
  //String [] barLabels = new String[] {"1830","1840","1850","1860","1870","1880","1890",
  //                                    "1900","1910","1920","1930","1940","1950","1960",
  //                                    "1970","1980","1990","2000","2010"};
  
  barChart = new BarChart(this);
  barChart.setData(barData);
  barChart.setBarLabels(barLabels);
  barChart.setBarColour(color(255,80,20,100));
  barChart.setBarGap(2); 
  barChart.setValueFormat("$###,###");
  barChart.setMinValue(550000000);
  barChart.setMaxValue(850000000);
  barChart.showValueAxis(true); 
  barChart.showCategoryAxis(true);
  
  
  approvedBarChart = new BarChart(this);
  approvedBarChart.setData(barData2);
  approvedBarChart.setBarLabels(barLabels);
  approvedBarChart.setBarColour(color(100,80,20,100));
  approvedBarChart.setBarGap(2); 
  approvedBarChart.setValueFormat("$###,###");
  approvedBarChart.setMinValue(550000000);
  approvedBarChart.setMaxValue(850000000);
  approvedBarChart.showValueAxis(true); 
  approvedBarChart.showCategoryAxis(true);
  
}

// ------------------ Processing draw --------------------

// Draws the graph in the sketch.
void draw()
{
  background(255);
  textSize(10);
  fill(color(255,80,20,100));
  rect(140, 70, 25, 25);
  fill(color(100,80,20,100));
  rect(140, 100, 25, 25);
  fill(0);
  text("Proposed", 180, 80);
  text("Approved", 180, 120);
  
  barChart.draw(20,20,width-30,height-30); //20,20
  approvedBarChart.draw(20,20,width-30, height-30);

  fill(120);
  textFont(titleFont);
  text("St.Paul Proposed Budget, 2014-2022", 120,30);
  float textHeight = textAscent();
  textFont(smallFont);
  text("", 70,30+textHeight);
}
