PImage icelandMap;
JSONObject testData;

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="Iceland_location_map.svg"; */ 
PShape iceland;

float startWidth;
float endWidth;

float longLeft = -25.0;
float longRight = -13.0;

float startHeight;
float endHeight;

float latTop = 66.8;
float latBottom = 63.1;

void setup()
{
   size(1186,841);
   icelandMap = loadImage("iceland.jpg");
   iceland = loadShape("Iceland_location_map.svg");
   
   startWidth = 0;
   endWidth = 1186;
   
   startHeight = 0;
   endHeight = 841;

   /*for (int i = 0; i < values.size(); i++) 
   {
     JSONObject earthquake = values.getJSONObject(i); 
     float lat = earthquake.getFloat("latitude");
     float longi = earthquake.getFloat("longitude");
    // println(lat+" "+longi);
  }*/
   //println(testData);
}

void draw()
{
  // De titel van de visualisatie wordt getoont
  frame.setTitle("Visualisatie - Aardbevingen op Ijsland");
  //image(icelandMap,0,0);
  shape(iceland);
  fill(255, 255, 255);//set the rect color to red
  rect(0, 0, 140, 95);
  
  fill(255, 0, 0);//set the rect color to red
  ellipse(16, 10, 10, 10);
  fill(0);//set the text color to black
  text("High magnitude", 35, 15);
  
  fill(255, 255, 0);//set the rect color to yellow
  ellipse(16, 25, 10, 10);
  fill(0);//set the text color to black
  text("Low magnitude", 35, 30);
  
  fill(255, 255, 0);//set the rect color to red
  ellipse(16, 45, 20, 20);
  fill(0);//set the text color to black
  text("Low depth", 35, 50);
  
  fill(255, 255, 0);//set the rect color to red
  ellipse(16, 75, 30, 30);
  fill(0);//set the text color to black
  text("High depth", 35, 80);
  
  testData = loadJSONObject("ijsland-metingen.json");
  JSONArray values = testData.getJSONArray("results");
  for (int i = 0; i < values.size(); i++) 
  {
     JSONObject earthquake = values.getJSONObject(i); 
     float lat = earthquake.getFloat("latitude");
     float longi = earthquake.getFloat("longitude");
     float mapX = map(longi,longLeft,longRight,startWidth,endWidth);
     float mapY = map(lat,latTop,latBottom,startHeight,endHeight);
     float magnitude = earthquake.getFloat("size");
     float magnitudeColor = 255;
     if (magnitude > 0 && magnitude < 2)
     {
        magnitudeColor = (magnitudeColor - (magnitude * 120));
     }
     else if (magnitude >= 2)
     {
       magnitudeColor = 0;
     }
     color c = color(255,magnitudeColor,0);
     float circleWidth = 30; float circleHeight = 30;
     float quakeDepth = earthquake.getFloat("depth");
     fill(c);
     ellipse(mapX,mapY,quakeDepth*3,quakeDepth*3);
    // println(lat+" "+longi);
    fill(0,0,0);
    text("Bron : https://en.wikipedia.org/wiki/Template:Location_map_Iceland#/media/File:Iceland_location_map.svg"
    ,550,20);
  }
}
