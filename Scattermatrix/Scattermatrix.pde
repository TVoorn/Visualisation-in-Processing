String[] scatterData;  
PVector[] xyList;  
String[] splitScatterData;  
float[] tijd;  
float[] afstand;  
float[] gewicht;  
float[] bonus;  
float[] maandloon;  
float dataMin, dataMax;  
int data1Min, data1Max;  
  
int plotX1, plotX2;  
int plotY1, plotY2;  
int bd;  
boolean canDraw;  
  
void setup()  
{  
  size(850,650);  
  smooth();  
  tijd = new float[0];  
  afstand = new float[0];  
  gewicht = new float[0];  
  bonus = new float[0];  
  maandloon = new float[0];  
  bd = 30;   // border space  
  loadData();  
  // Corners of the plotted time series  
  plotX1 = 30;  
  plotX2 = 200;  
  plotY1 = 30;  
  plotY2 = 200;  
  canDraw = true;  
}  
void loadData()  
{  
  scatterData = loadStrings("Data-voor-scattermatrix.txt");  
  for (int i=1; i<scatterData.length; i++)   
  {  
    splitScatterData = split(scatterData[i], "\t");  
    tijd = append(tijd, float(splitScatterData[0]));  
    afstand = append(afstand, float(splitScatterData[1]));  
    gewicht = append(gewicht, float(splitScatterData[2]));  
    bonus = append(bonus, float(splitScatterData[3]));  
    maandloon = append(maandloon, float(splitScatterData[4]));  
  }  
}  
void showData(float dataMin, float dataMax, float data1Min, float data1Max,float plotX1, float plotX2, float plotY1, float plotY2,float[]xArray,float[]yArray)   
{  
  xyList = new PVector[0];  
  for (int i=1; i<scatterData.length; i++)   
  {  
    xyList = (PVector []) append(xyList, new PVector(xArray[i-1], yArray[i-1]));  
  }  
    
  for (int i=0; i<xyList.length; i++)   
  {  
    float x = map(xyList[i].x, data1Min, data1Max, plotX1, plotX2);  
    float y = map(xyList[i].y, dataMin, dataMax, plotY2, plotY1);  
    point(x, y);  
  }  
}  
void draw()  
{  
    if(canDraw)  
    {  
      background(200);  
        
      fill(255);  
      noStroke();  
      rect(plotX1, plotY1, plotX2-30, plotY2-30);  
      rect(plotX1+200, plotY1, plotX2-30, plotY2-30);  
      rect(plotX1+400, plotY1, plotX2-30, plotY2-30);  
      rect(plotX1+600, plotY1, plotX2-30, plotY2-30);  
      rect(plotX1, plotY1+200, plotX2-30, plotY2-30);  
      rect(plotX1+200, plotY1+200, plotX2-30, plotY2-30);  
      rect(plotX1+400, plotY1+200, plotX2-30, plotY2-30);  
      rect(plotX1+600, plotY1+200, plotX2-30, plotY2-30);  
      rect(plotX1, plotY1+400, plotX2-30, plotY2-30);  
      rect(plotX1+200, plotY1+400, plotX2-30, plotY2-30);  
      strokeWeight(2);  
      stroke(#c12e21);  
        
      //tijd,afstand  
      showData(800,1100,600,800,plotX1,plotX2,plotY1,plotY2,tijd,afstand);   
       
      //tijd, gewicht  
      showData(28.7,33,600,800,plotX1+200,plotX2+200,plotY1,plotY2,tijd,gewicht);   
        
      //tijd, bonus  
      showData(1900,2500,600,800,plotX1+400,plotX2+400,plotY1,plotY2,tijd,bonus);   
        
      //tijd, maandloon  
      showData(4700,6400,600,800,plotX1+600,plotX2+600,plotY1,plotY2,tijd,maandloon);   
      
      //afstand,gewicht  
      showData(28.7,33.1,800,1100,plotX1,plotX2,plotY1+200,plotY2+200,afstand,gewicht);   
        
      //afstand,bonus  
      showData(1900,2500,800,1100,plotX1+200,plotX2+200,plotY1+200,plotY2+200,afstand,bonus);   
        
      //afstand,maandloon  
      showData(4700,6400,800,1100,plotX1+400,plotX2+400,plotY1+200,plotY2+200,afstand,maandloon);   
        
      //gewicht,bonus  
      showData(1900,2500,28.7,33.1,plotX1+600,plotX2+600,plotY1+200,plotY2+200,gewicht,bonus);   
        
      //gewicht,maandloon  
      showData(4700,6400,28.7,33.1,plotX1,plotX2,plotY1+400,plotY2+400,gewicht,maandloon);      
        
      //bonus,maandloon  
      showData(4700,6400,1900,2500,plotX1+200,plotX2+200,plotY1+400,plotY2+400,bonus,maandloon);   
        
      // draw the axes  
      stroke(0);  
      fill(0);  
        
      // x-axis    
      line( 30, 200, 200, 200 );  textAlign(CENTER,TOP);  text(600+"      Tijd (sec)      "+800, 115, 200 );       
      line( 230, 200, 400, 200 );  textAlign(CENTER,TOP);  text(600+"      Tijd (sec)      "+800, 315, 200 );      
      line( 430, 200, 600, 200 );  textAlign(CENTER,TOP);  text(600+"      Tijd (sec)      "+800, 515, 200 );      
      line( 630, 200, 800, 200 );  textAlign(CENTER,TOP);  text(600+"      Tijd (sec)      "+800, 715, 200 );   
      line( 30, 400, 200, 400 );  textAlign(CENTER,TOP);  text(800+"      Afstand (m)      "+1100, 115, 400 );   
      line( 230, 400, 400, 400 );  textAlign(CENTER,TOP);  text(800+"      Afstand (m)      "+1100, 315, 400 );     
      line( 430, 400, 600, 400 );  textAlign(CENTER,TOP);  text(800+"      Afstand (m)      "+1100, 515, 400 );         
      line( 630, 400, 800, 400 );  textAlign(CENTER,TOP);  text(28.7+"      Gewicht (kg)      "+33.1, 715, 400 );  
      line( 30, 600, 200, 600 );  textAlign(CENTER,TOP);  text(28.7+"      Gewicht (kg)      "+33.1, 115, 600 );        
      line( 230, 600, 400, 600 );  textAlign(CENTER,TOP);  text(1900+"    Bonus (euro)"    +2500, 315, 600 );      
        
      // y-axis  
      line( 30, 30, 30, 200 );    
      line( 230, 30, 230, 200 );    
      line( 430, 30, 430, 200 );  
      line( 630, 30, 630, 200 );  
      line( 30, 230, 30, 400 );  
      line( 230, 230, 230, 400 );  
      line( 430, 230, 430, 400 );  
      line( 630, 230, 630, 400 );  
      line( 30, 430, 30, 600 );  
      line( 230, 430, 230, 600 );  
      rotate(radians(-90));   
      text(800+"      Afstand (m)      "+1100, -115, 15);  
      text(28.7+"      Gewicht (kg)      "+33.1, -115, 215);  
      text(1900+"    Bonus (euro)        "+2500, -115, 415);        
      text(4700+"    Maandloon (euro)    "+6400, -115, 615);  
      text(28.7+"      Gewicht (kg)      "+33.1, -315, 15);  
      text(1900+"    Bonus (euro)        "+2500, -315, 215);  
      text(4700+"    Maandloon (euro)    "+6400, -315, 415);  
      text(1900+"    Bonus (euro)        "+2500, -315, 615);  
      text(4700+"    Maandloon (euro)    "+6400, -515, 15);  
      text(4700+"    Maandloon (euro)    "+6400, -515, 215);        
      canDraw = false;  
    }  }  

