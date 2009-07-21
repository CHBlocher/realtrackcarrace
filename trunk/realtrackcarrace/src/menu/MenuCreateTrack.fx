/*
 * MenuCreateTrack.fx
 *
 * Created on 3-mag-2009, 19:36:52
 */

package menu;


import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import menu.RectangleBackGround;
import Window.JDLayout.DigLayout;
import Window.JDLayout.Item;
import Window.JDLayout.Row;
import javafx.ext.swing.SwingButton;
import javafx.ext.swing.SwingComboBoxItem;
import javafx.scene.text.Text;
import javafx.scene.text.Font;

/**
 * @author Diego Benna
 */
public var latitudeStart:String; //= "45.547985";
public var longitudeStart:String;// = "11.549435";
public var latitudeEnd:String;// = "45.477946";
public var longitudeEnd:String;// = "11.609724";

// loading text message
public var loading_text = Text {
    font : Font {
        size: 15
    }
    fill:Color.WHITE
    x: 280, y: 97
    content: "ready   5/5 "
}
// loading step
var counter:Integer = 0;
public var cont_step:Integer = 0 on replace{
        MenuCreateTrack.counter++;
        if(MenuCreateTrack.counter==5){
            loading_text.content = "ready   {MenuCreateTrack.counter}/5";
            MenuCreateTrack.counter = 0;
        }
        else{
            loading_text.content = "loading {MenuCreateTrack.counter}/5";
        }
    };

public var points:track.Point[] = [];
public var allPointsTrack:track.Point[] = [];
public var roadNames:String[] = [
"Via Ragazzi del '99",
"Via Istria",
"Via Riccardo Colombina",
"Via Roma",
"",
"Viale Riviera Berica",
"",
"Viale Riviera Berica",
"",
"Viale Risorgimento Nazionale",
"Viale 10 Giugno",
"",
"Viale Venezia",
"Piazzale della Stazione",
"Viale Roma",
"",
"",
];


public class MenuCreateTrack extends MenuItem {
    
    public override var name ="map";



    /*
    *   TextBox object
    */
    var startStreet = javafx.scene.control.TextBox {
                    columns: 11,
                    style:  util.Constants.style
                    text: "Via+Ragazzi+del+99"
                    focusable:true
                }

    var startCity = javafx.scene.control.TextBox{
                    columns: 11,
                    style:  util.Constants.style
                    text: "Longare"
                }

    var startState = javafx.scene.control.TextBox{
                    columns: 11,
                    style:  util.Constants.style
                    text: "IT"
                };

    var startZip = javafx.scene.control.TextBox {
                    columns: 11,
                    style:  util.Constants.style
                    text: "36023"
                };


    var endStreet = javafx.scene.control.TextBox  {
                    columns: 11,
                    style:  util.Constants.style
                    text: "Viale+Roma"
                }

    var endCity = javafx.scene.control.TextBox {
                    columns: 11,
                    style:  util.Constants.style
                    text: "Vicenza"
                }

    var endState = javafx.scene.control.TextBox  {
                    columns: 11,
                    style:  util.Constants.style
                    text: "IT"
                };

    var endZip = javafx.scene.control.TextBox  {
                    columns: 11,
                    style:  util.Constants.style
                    text: "36100"
                };

 var xml_routing_url:String;

 var coord:String = bind "{longitudeStart}:{latitudeStart};{longitudeEnd}:{latitudeEnd}" on replace{
        //println("{longitudeStart}:{latitudeStart} {longitudeEnd}:{latitudeEnd}");

        if(latitudeStart!=null and longitudeStart!=null and latitudeEnd!=null and longitudeEnd!=null){
            track.ParserCoordinates.getData(latitudeStart,longitudeStart,latitudeEnd,longitudeEnd);
            cont_step++;
            println(url);
            image = Image {
                url: url
            }

            xml_routing_url = "http://developer.multimap.com/API/route/1.2/{util.Constants.multimapKey}?lat_1={latitudeStart}&lon_1={longitudeStart}&lat_2={latitudeEnd}&lon_2={longitudeEnd}";

            println(xml_routing_url);
            latitudeStart=null;
            longitudeStart=null;
            latitudeEnd=null;
            longitudeEnd=null;

            //counter = 0;
        }
    }

    var url:String = bind "http://developer.multimap.com/API/map/1.2/{util.Constants.multimapKey}?output=png&routeKey={startState.text},{coord},0&width=300&height=300&routeColor=255,0,0&routeOpacity=1";
    var image:Image = Image {
            url: "http://developer.multimap.com/API/map/1.2/OA09041014836631534?output=png&routeKey={startState.text},11.609990:45.474600;11.549435:45.547985,0&width=300&height=300&routeColor=255,0,0&routeOpacity=1"
        }

    var imageMap = ImageView {
        image: bind image
        translateX:280
        translateY:100
    }
    

    /*
    *   Form by search geocoding
    */
    var geocodingForm = DigLayout{
        columns:["0","e:20","0","e:5"]
        rows:["0","e:5","0","0","0","0","e:30","0","e:5","0","0","0","0","e:30","0"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX:700
        translateY:100

        margin:0
        fixed:true
        digrows : [
                Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"
                            colspan:3
                            item:
                                menu.util.MenuLabel{text:"START"}

                        }
                      ]
                    },
                Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"Street: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                startStreet
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"City: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                startCity
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"State: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                startState
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"Zip code: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                startZip
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"
                            colspan:3
                            item:
                                menu.util.MenuLabel{text:"END"}

                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"Street: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                endStreet
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"City: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                endCity
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"State: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                endState
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"

                            item:
                                menu.util.MenuLabel{text:"Zip code: "}

                        },
                        Item{
                            valign:"middle"
                            halign:"right"
                            item:
                                endZip
                        }
                      ]
                    },
                    Row{
                    items:[
                        Item{
                            valign:"middle"
                            halign:"right"
                            colspan:3

                            item:
                            SwingButton {
                                text: "Search track"
                                action: function() {
                                    points = [];
                                    allPointsTrack = [];
                                    roadNames = [];
                                    if(cont_step >= 20){
                                        loading_text.content = "yahoo geocoding API limit.. sorry restart application";
                                    }
                                    if((latitudeStart!=null and longitudeStart!=null and latitudeEnd!=null and longitudeEnd!=null)==false){
                                        counter=0;
                                    }
                                    ParserGeocoding.getData(startStreet.text,startCity.text,startState.text,startZip.text,"start");
                                    ParserGeocoding.getData(endStreet.text,endCity.text,endState.text,endZip.text,"end");
                                    
                                }
                            }

                        }
                      ]
                    }
                    ]
                }

    var gameButtonForm = DigLayout{
        columns:["150","150"]
        rows:["70"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX: 260 + 680 - 300 + 10
        translateY: 470

        margin:0
        fixed:true
        digrows : [
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"

                                item:
                                    SwingButton {
                                        text: "Play in multiplayer"
                                        action: function() {

                                            var sceneMenu = scene as GameSceneMenu;
                                            sceneMenu.select(sceneMenu.menu.menuMultiplayer,this);
                                            sceneMenu.menu.menuMultiplayer.img_track = image;
                                            sceneMenu.menu.menuMultiplayer.points = points;
                                            sceneMenu.menu.menuMultiplayer.allPointsTrack = allPointsTrack;
                            
                                            //track.Point.printPoints(allPointsTrack);

                                            insert 
                                            SwingComboBoxItem {
                                                text: "{this.startCity.text}-{this.endCity.text}"
                                                selected: true
                                            } into   
                                            sceneMenu.menu.menuMultiplayer.tf_track.items;
                                        }
                                    }
                            },
                            Item{
                                valign:"middle"
                                halign:"center"

                            }
                          ]
                        }
                    ]
                }




     public override function create(): Node {
         this.startStreet.requestFocus();
        group = Group {
            translateX:-120
             content: [
                RectangleBackGround{
                    translateX:260
                    translateY:80
                    width: 680, height: 380
                },
                RectangleBackGround{
                    translateX:260 + 680 - 300
                    translateY:470
                    width: 300, height: 70
                },
                imageMap,
                geocodingForm,
                gameButtonForm,
                loading_text,
             ]
         };
         return group;
     }
 }

