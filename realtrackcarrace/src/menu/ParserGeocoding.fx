/*
 * ParserGeocoding.fx
 *
 * Created on 4-mag-2009, 15:06:03
 */

package menu;import javafx.data.pull.PullParser;
import javafx.io.http.HttpRequest;

/**
 * @author Diego Benna
 */

public function getData(street:String, city:String, state:String, zip:String, point:String):String{

    var urlZip = if(zip!=null){"&zip={zip}"}else("");
    var urlCity = if(city!=null){"&city={city}"}else("");
    var urlStreet = if(street!=null){"&street={street}"}else("");
    var urlState = if(state!=null){"&state={state}"}else("");
    var geocodeKey:String= util.Constants.geocodeKey_1;

    var url = "http://local.yahooapis.com/MapsService/V1/geocode?appid={geocodeKey}--{urlStreet}{urlCity}{urlState}{urlZip}";
    println(url);
    var textVal:String;

    if (url.length() > 0) {
           HttpRequest {
               location: url
                onInput: function(input) {
                   PullParser {
                       input: input
                       onEvent: function(event) {
                           if (event.type == PullParser.END_ELEMENT) {
                              var nodeName : String = event.qname.name;
                              // Now we extract the text only if the node is Latitude
    
                                textVal  = event.text;
                                if(nodeName == "Latitude"){
                                    if(point == "start"){
                                        MenuCreateTrack.latitudeStart = textVal;
                                        MenuCreateTrack.cont_step++;
                                    }
                                    else{
                                        MenuCreateTrack.latitudeEnd = textVal;
                                        MenuCreateTrack.cont_step++;
                                    }
                                }
                                if(nodeName == "Longitude"){
                                    if(point == "start"){
                                        MenuCreateTrack.longitudeStart = textVal;
                                        MenuCreateTrack.cont_step++;
                                    }
                                    else{
                                        MenuCreateTrack.longitudeEnd = textVal;
                                        MenuCreateTrack.cont_step++;
                                   }
                                }
                            }
                       }
                   }.parse()
               }
           }.enqueue();
    }
    textVal;
}

public class ParserGeocoding {

}
