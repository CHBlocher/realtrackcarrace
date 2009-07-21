/*
 * ParserCoordinates.fx
 *
 * Created on 18-mag-2009, 15:19:08
 */

package track;

import javafx.data.pull.PullParser;
import javafx.io.http.HttpRequest;

/**
 * @author Diego Benna
 */

public function getData(latitudeStart:String,longitudeStart:String,latitudeEnd:String,longitudeEnd:String):Point[]{

    var url = "http://developer.multimap.com/API/route/1.2/OA09041014836631534?lat_1={latitudeStart}&lon_1={longitudeStart}&lat_2={latitudeEnd}&lon_2={longitudeEnd}";
    println("coordinate parser {url}");
    var textVal:String;

    var points:Point[] = [];

    if (url.length() > 0) {
           HttpRequest {
               location: url
                onInput: function(input) {
                   PullParser {
                       input: input
                       var lat:Number;
                       var lon:Number;
                       onEvent: function(event) {
                           if (event.type == PullParser.END_ELEMENT) {
                              var nodeName : String = event.qname.name;
                              // Now we extract the text only if the node is Latitude
                                textVal  = event.text;
                                if(nodeName == "Lat"){
                                    lat = java.lang.Double.parseDouble(textVal);
                                }
                                if(nodeName == "Lon"){
                                    lon =  java.lang.Double.parseDouble(textVal);
                                    //util.RemoteObject.remoteObject.addPoint(lat,lon);
                                }
                                if(nodeName == "Vector"){
                                    //println(textVal);
                                    var arrayVector = textVal.split(",", 0);
                                    //println(arrayVector);

                                    var firstPoint = Point{x:java.lang.Double.parseDouble(arrayVector[1]),
                                                        y:java.lang.Double.parseDouble(arrayVector[0]),
                                                        }

                                    var index = 3;
                                    var array:Point[];

                                    insert firstPoint into array;
                                    var cont = 0;

                                    while(index < arrayVector.size()){
                                        insert Point{x:java.lang.Double.parseDouble(arrayVector[index]),
                                                        y:java.lang.Double.parseDouble(arrayVector[index-1]),
                                                        }
                                                        into array;
                                        index=index+2;
                                    }

                                    index = 1;
                                    var points:Point[];
                                    insert array[0] into points;
                                    while(index < array.size()){
                                        insert Point{x: (points[index-1].x + array[index].x)
                                                     y: (points[index-1].y + array[index].y)
                                               }
                                        into points;
                                       
                                        index++;
                                    }

                                    Point.printPoints(points);
                                    menu.MenuCreateTrack.allPointsTrack = points;
                                }
                                if(nodeName == "StartPoint"){
                                    //println("{lat} {lon}");

                                    var lat_1:String;

                                    try{
                                        lat_1 = Number.toString(lat).substring(3,8);
                                    }catch(e:java.lang.Exception){
                                        lat_1 = lat.toString().substring(3);
                                        if(lat_1.length() == 4){
                                            lat_1 = "{lat_1}0";
                                        }
                                        if(lat_1.length() == 3){
                                            lat_1 = "{lat_1}00";
                                        }
                                        if(lat_1.length() == 2){
                                            lat_1 = "{lat_1}000";
                                        }
                                        if(lat_1.length() == 1){
                                            lat_1 = "{lat_1}0000";
                                        }
                                    }

                                    var lon_1:String;
                                    try{
                                        lon_1 = Number.toString(lon).substring(3,8);
                                    }catch(e:java.lang.Exception){
                                        lon_1 = lon.toString().substring(3);
                                        //println(lon_1.length());
                                        if(lon_1.length() == 4){
                                            lon_1 = "{lon_1}0";
                                        }
                                        if(lon_1.length() == 3){
                                            lon_1 = "{lon_1}00";
                                        }
                                        if(lon_1.length() == 2){
                                            lon_1 = "{lon_1}000";
                                        }
                                        if(lon_1.length() == 1){
                                            lon_1 = "{lon_1}0000";
                                        }
                                    }

                                    var lat_0 = Number.toString(lat).substring(0,2);
                                    var lat_num = java.lang.Double.parseDouble("{lat_0}{lat_1}");
                                    var lon_0 = Number.toString(lon).substring(0,2);
                                    var lon_num = java.lang.Double.parseDouble("{lon_0}{lon_1}");
                                    //println("{lat_num} {lon_num}");
                                    insert Point{x:lat_num,y:lon_num} into menu.MenuCreateTrack.points;

                                }
                                if(nodeName == "RoadName"){
                                    //println(textVal);
                                    insert textVal into menu.MenuCreateTrack.roadNames;
                                }
                                if(nodeName == "Route"){
                                     //println("//////////////////////////////");
                                     //Point.printPoints(menu.MenuCreateTrack.points);
                                }
                               

                            }
                       }
                   }.parse()
               
               }
           }.enqueue();
    }
    points;
}


public class ParserCoordinates {

}
