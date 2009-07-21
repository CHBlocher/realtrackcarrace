/*
 * MenuMultiPlayer.fx
 *
 * Created on 16-apr-2009, 18:09:05
 */

package menu;

import java.awt.Window;
import java.lang.Exception;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import javafx.ext.swing.SwingButton;
import javafx.ext.swing.SwingComboBox;
import javafx.ext.swing.SwingComboBoxItem;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import menu.GameSceneMenu;
import menu.GameStage;
import menu.MenuItem;
import menu.MenuMultiplayerRunningServer;
import menu.RectangleBackGround;
import track.PhysicsManager;
import track.PhysicsManagerClient;
import track.Point;
import Window.JDLayout.DigLayout;
import Window.JDLayout.Item;
import Window.JDLayout.Row;


/**
 * @author Diego Benna
 *  This is menu for multiplayer game
 */

 /*
 *  Tutti i punti e la pista di default
 */
 public var allPointsTrack:Point[] = [
    Point{x:4547214.0, y:1160880.0}
    Point{x:4547216.0, y:1160881.0}
    Point{x:4547218.0, y:1160877.0}
    Point{x:4547232.0, y:1160834.0}
    Point{x:4547427.0, y:1160962.0}
    Point{x:4547457.0, y:1160983.0}
    Point{x:4547472.0, y:1160996.0}
    Point{x:4547504.0, y:1160986.0}
    Point{x:4547530.0, y:1160975.0}
    Point{x:4547554.0, y:1160955.0}
    Point{x:4547575.0, y:1161073.0}
    Point{x:4547612.0, y:1161062.0}
    Point{x:4547666.0, y:1161042.0}
    Point{x:4547747.0, y:1161002.0}
    Point{x:4547829.0, y:1160948.0}
    Point{x:4547867.0, y:1160919.0}
    Point{x:4547900.0, y:1160889.0}
    Point{x:4547959.0, y:1160828.0}
    Point{x:4547982.0, y:1160797.0}
    Point{x:4548012.0, y:1160751.0}
    Point{x:4548079.0, y:1160628.0}
    Point{x:4548088.0, y:1160610.0}
    Point{x:4548140.0, y:1160474.0}
    Point{x:4548167.0, y:1160421.0}
    Point{x:4548192.0, y:1160385.0}
    Point{x:4548265.0, y:1160296.0}
    Point{x:4548293.0, y:1160258.0}
    Point{x:4548356.0, y:1160183.0}
    Point{x:4548378.0, y:1160153.0}
    Point{x:4548392.0, y:1160138.0}
    Point{x:4548408.0, y:1160125.0}
    Point{x:4548441.0, y:1160111.0}
    Point{x:4548591.0, y:1160081.0}
    Point{x:4548623.0, y:1160076.0}
    Point{x:4548729.0, y:1160053.0}
    Point{x:4548758.0, y:1160042.0}
    Point{x:4548768.0, y:1160034.0}
    Point{x:4548786.0, y:1160006.0}
    Point{x:4548794.0, y:1159979.0}
    Point{x:4548800.0, y:1159948.0}
    Point{x:4548818.0, y:1159881.0}
    Point{x:4548839.0, y:1159832.0}
    Point{x:4548854.0, y:1159801.0}
    Point{x:4548864.0, y:1159784.0}
    Point{x:4548875.0, y:1159768.0}
    Point{x:4548911.0, y:1159725.0}
    Point{x:4548953.0, y:1159679.0}
    Point{x:4549030.0, y:1159609.0}
    Point{x:4549042.0, y:1159595.0}
    Point{x:4549096.0, y:1159521.0}
    Point{x:4549119.0, y:1159487.0}
    Point{x:4549355.0, y:1159120.0}
    Point{x:4549378.0, y:1159088.0}
    Point{x:4549412.0, y:1159054.0}
    Point{x:4549428.0, y:1159042.0}
    Point{x:4549459.0, y:1159025.0}
    Point{x:4549488.0, y:1159016.0}
    Point{x:4549562.0, y:1159001.0}
    Point{x:4549583.0, y:1158993.0}
    Point{x:4549594.0, y:1158986.0}
    Point{x:4549602.0, y:1158979.0}
    Point{x:4549623.0, y:1158953.0}
    Point{x:4549642.0, y:1158925.0}
    Point{x:4549673.0, y:1158873.0}
    Point{x:4549697.0, y:1158829.0}
    Point{x:4549716.0, y:1158786.0}
    Point{x:4549731.0, y:1158747.0}
    Point{x:4549758.0, y:1158631.0}
    Point{x:4549768.0, y:1158565.0}
    Point{x:4549775.0, y:1158532.0}
    Point{x:4549804.0, y:1158435.0}
    Point{x:4549930.0, y:1158127.0}
    Point{x:4549949.0, y:1158077.0}
    Point{x:4549973.0, y:1158004.0}
    Point{x:4550049.0, y:1157801.0}
    Point{x:4550061.0, y:1157772.0}
    Point{x:4550124.0, y:1157664.0}
    Point{x:4550164.0, y:1157588.0}
    Point{x:4550250.0, y:1157408.0}
    Point{x:4550333.0, y:1157226.0}
    Point{x:4550399.0, y:1157096.0}
    Point{x:4550426.0, y:1157027.0}
    Point{x:4550441.0, y:1156997.0}
    Point{x:4550447.0, y:1156992.0}
    Point{x:4550461.0, y:1156985.0}
    Point{x:4550515.0, y:1156972.0}
    Point{x:4550539.0, y:1156964.0}
    Point{x:4550564.0, y:1156959.0}
    Point{x:4550590.0, y:1156957.0}
    Point{x:4550633.0, y:1156951.0}
    Point{x:4550658.0, y:1156942.0}
    Point{x:4550949.0, y:1156794.0}
    Point{x:4550965.0, y:1156784.0}
    Point{x:4551044.0, y:1156704.0}
    Point{x:4551070.0, y:1156682.0}
    Point{x:4551201.0, y:1156598.0}
    Point{x:4551221.0, y:1156586.0}
    Point{x:4551239.0, y:1156579.0}
    Point{x:4551267.0, y:1156575.0}
    Point{x:4551316.0, y:1156575.0}
    Point{x:4551365.0, y:1156578.0}
    Point{x:4551420.0, y:1156587.0}
    Point{x:4551524.0, y:1156601.0}
    Point{x:4551570.0, y:1156598.0}
    Point{x:4551642.0, y:1156585.0}
    Point{x:4551661.0, y:1156580.0}
    Point{x:4551665.0, y:1156577.0}
    Point{x:4551668.0, y:1156579.0}
    Point{x:4551684.0, y:1156578.0}
    Point{x:4551705.0, y:1156570.0}
    Point{x:4551710.0, y:1156567.0}
    Point{x:4551718.0, y:1156558.0}
    Point{x:4551725.0, y:1156559.0}
    Point{x:4551737.0, y:1156552.0}
    Point{x:4551822.0, y:1156514.0}
    Point{x:4551964.0, y:1156460.0}
    Point{x:4552105.0, y:1156418.0}
    Point{x:4552184.0, y:1156397.0}
    Point{x:4552277.0, y:1156369.0}
    Point{x:4552305.0, y:1156362.0}
    Point{x:4552332.0, y:1156360.0}
    Point{x:4552340.0, y:1156363.0}
    Point{x:4552409.0, y:1156371.0}
    Point{x:4552441.0, y:1156371.0}
    Point{x:4552506.0, y:1156360.0}
    Point{x:4552545.0, y:1156350.0}
    Point{x:4552583.0, y:1156339.0}
    Point{x:4552660.0, y:1156309.0}
    Point{x:4552698.0, y:1156300.0}
    Point{x:4552772.0, y:1156298.0}
    Point{x:4552920.0, y:1156301.0}
    Point{x:4552935.0, y:1156299.0}
    Point{x:4553006.0, y:1156284.0}
    Point{x:4553099.0, y:1156260.0}
    Point{x:4553199.0, y:1156222.0}
    Point{x:4553230.0, y:1156207.0}
    Point{x:4553276.0, y:1156170.0}
    Point{x:4553336.0, y:1156116.0}
    Point{x:4553465.0, y:1155985.0}
    Point{x:4553509.0, y:1155937.0}
    Point{x:4553591.0, y:1155855.0}
    Point{x:4553773.0, y:1155718.0}
    Point{x:4553787.0, y:1155706.0}
    Point{x:4553870.0, y:1155603.0}
    Point{x:4553999.0, y:1155486.0}
    Point{x:4554022.0, y:1155470.0}
    Point{x:4554040.0, y:1155461.0}
    Point{x:4554062.0, y:1155444.0}
    Point{x:4554085.0, y:1155413.0}
    Point{x:4554102.0, y:1155373.0}
    Point{x:4554119.0, y:1155315.0}
    Point{x:4554125.0, y:1155315.0}
    Point{x:4554129.0, y:1155313.0}
    Point{x:4554136.0, y:1155302.0}
    Point{x:4554133.0, y:1155292.0}
    Point{x:4554124.0, y:1155287.0}
    Point{x:4554123.0, y:1155285.0}
    Point{x:4554114.0, y:1155137.0}
    Point{x:4554115.0, y:1155012.0}
    Point{x:4554114.0, y:1154952.0}
    Point{x:4554116.0, y:1154826.0}
    Point{x:4554115.0, y:1154782.0}
    Point{x:4554112.0, y:1154752.0}
    Point{x:4554114.0, y:1154739.0}
    Point{x:4554154.0, y:1154649.0}
    Point{x:4554167.0, y:1154614.0}
    Point{x:4554184.0, y:1154579.0}
    Point{x:4554172.0, y:1154558.0}
    Point{x:4554159.0, y:1154528.0}
    Point{x:4554154.0, y:1154511.0}
    Point{x:4554153.0, y:1154333.0}
    Point{x:4554157.0, y:1154281.0}
    Point{x:4554185.0, y:1154180.0}
    Point{x:4554190.0, y:1154160.0}
    Point{x:4554192.0, y:1154141.0}
    Point{x:4554195.0, y:1154135.0}
    Point{x:4554197.0, y:1154080.0}
    Point{x:4554205.0, y:1154076.0}
    Point{x:4554206.0, y:1154069.0}
    Point{x:4554451.0, y:1154034.0}
    Point{x:4554451.0, y:1154031.0}

    ] on replace{
            println("setto tutti i point in multiplayer");
    }

    /*
    *   Coordinates delle vie
    */
    public var points:track.Point[] = [
        Point{x:4547216.0, y:1160881.0}
        Point{x:4547472.0, y:1160996.0}
        Point{x:4547554.0, y:1160955.0}
        Point{x:4547575.0, y:1161073.0}
        Point{x:4548042.0, y:1160695.0}
        Point{x:4549731.0, y:1158747.0}
        Point{x:4550965.0, y:1156784.0}
        Point{x:4551665.0, y:1156577.0}
        Point{x:4553773.0, y:1155718.0}
        Point{x:4554119.0, y:1155315.0}
        Point{x:4554114.0, y:1154779.0}
        Point{x:4554184.0, y:1154579.0}
        Point{x:4554174.0, y:1154562.0}
        Point{x:4554161.0, y:1154264.0}
        Point{x:4554197.0, y:1154080.0}
        Point{x:4554451.0, y:1154034.0}
    ] on replace{
            println("setto i point delle vie in multiplayer");
            Point.printPoints(points);
    }


public class MenuMultiPlayer extends MenuItem {


    
    /*
    *   Menu items name
    */
    public override var name ="multiplayer";

    /*
    *   Tracke image
    */
    protected var img_track:Image = Image {
        url: "{__DIR__}images/trackDefault.jpg"
    };

    var track_image = ImageView {
        scaleX:0.5
        scaleY:0.5
        image: bind img_track
        translateX:400
        translateY:110
    }

    

    /*
    *   TextBox object
    */
    var tf_nome_server = javafx.scene.control.TextBox {
                    columns: 10,
                    editable: true
                    style:  util.Constants.style
                    text: "MyServer"
                    selectOnFocus:false
                };

    var tf_ip =  javafx.scene.control.TextBox {
                    columns: 10,
                    editable: true
                    style:  util.Constants.style
                    text: "localhost"
                    selectOnFocus:false
                };

    protected var tf_track = SwingComboBox {
        width:120
        items: [
            SwingComboBoxItem {
                text: "Longare - Vicenza"
                selected: true
            }
        ]
    }

    var tf_owner =  javafx.scene.control.TextBox {
                    columns: 10,
                    editable: true
                    style:  util.Constants.style
                    text: "Owner"
                    selectOnFocus:false
                };

    var tf_user_name =  javafx.scene.control.TextBox {
                    columns: 10,
                    editable: true
                    style:  util.Constants.style
                    text: "Your name"
                    selectOnFocus:false
                };

    /*
    *   Running server frame
    */
    var running_server = MenuMultiplayerRunningServer{};

    /*
    *   Search server button
    */
    var button_search = SwingButton {
        text: "Search Server"
        action: function() {
            /*
            *   Search server
            */
            var remoteObject:PhysicsManager;
            try{
                // call client manager for find remote object
                remoteObject = PhysicsManagerClient.getPhysicsManager(this.tf_ip.text);
                this.running_server.updateList.playFromStart();
                // see loading message
                var stage = scene.stage as GameStage;
                stage.mess.content = "loading server...";
            }
            catch(e:Exception){
                // if there isn't server call Exception
                var stage = scene.stage as GameStage;
                stage.mess.content = "Sorry. Don't find server!";
                println(e);
            }

            println(remoteObject);
            if(remoteObject != null){
                // Server ready
                var stage = scene.stage as GameStage;
                stage.mess.content = "Server ready!";
                // hide old running server
                running_server.hide();
                // take name user
                running_server.user = tf_user_name.text;
                running_server.server = remoteObject;
                util.RemoteObject.remoteObject = remoteObject;
                println(remoteObject.getName());
                // show running server frame
                running_server.show();
            }else{
                running_server.hide();
            }
        }
    }

    /*
    *   new track button
    */
    var button_add_track = SwingButton {
        text: "new real track"
        font:javafx.scene.text.Font{
            size:10
        }
        translateX:650
        translateY:185
        action: function() {
            var sceneMenu = scene as GameSceneMenu;
            sceneMenu.select(sceneMenu.menu.menuCreateTrack,this);
        }
    }
    
    /*
    *   Advanced DigLayout
    *   DigLayout is a JDLayout library by Diego Benna
    *   advanced Layout Manager for javafx
    */
    var creaServerForm =  DigLayout{
        columns:["e:400","120","e:20","160"]
        rows:["0","e:3","0","e:3","0","e:3","e:170","0"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX:70
        translateY:100

        margin:0
        fixed:true
        digrows : [
            Row{
                items:[
                    Item{
                        valign:"middle"
                        halign:"right"

                        item:
                            menu.util.MenuLabel{text:"Server name: "}

                    },
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            tf_nome_server
                    }
                    ]
                },
            Row{
                items:[
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            menu.util.MenuLabel{text:"Owner name:"}
                    },
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            tf_owner
                    }
                    ]
                },
            Row{
                items:[
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            menu.util.MenuLabel{text:"Track:"}
                    },
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            tf_track
                    }
                    ]
                },
            Row{
                items:[
                    Item{
                        colspan:4
                        valign:"top"
                        halign:"left"

                        item:
                        SwingButton {
                            text: "Create Server"
                            action: function() {
                                var stage = scene.stage as GameStage;
                                stage.mess.content = "Building server...";
                                try{
                                    util.RemoteObject.server.create(this.tf_nome_server.text,this.tf_track.selectedItem.text);
                                    util.RemoteObject.flag_create = true;
                                }
                                catch ( e: Exception)
                                {
                                    stage.mess.content = "Impossible create server. There are some problem for use 1099 port.";
                                    println(e);
                                }

                                var remoteObject:PhysicsManager;
                                try{
                                    remoteObject = PhysicsManagerClient.getPhysicsManager("localhost");
                                }
                                catch (e : java.rmi.server.ExportException){
                                    stage.mess.content = "Error. I can't create server. Port 1099 already in use.";
                                    println(e);
                                }
                                catch (e : java.rmi.ConnectException){
                                    stage.mess.content = "Error. I can't create server. Port 1099 already in use.";
                                    println(e);
                                }
                                catch ( e: Exception)
                                {
                                    stage.mess.content = "Create server but there are problem to connect it.";
                                    println(e);
                                }

                                if(remoteObject != null){
 
                                    /*
                                    *   Set coordinate in server
                                    */
                                    var index = 0 ;
                                    while(index<allPointsTrack.size()){
                                        remoteObject.addAllPoint(allPointsTrack[index].x,allPointsTrack[index].y);
                                        index++;
                                    }

                                    index = 0 ;
                                    while(index<points.size()){
                                        remoteObject.addSpecialPoint(points[index].x,points[index].y);
                                        index++;
                                    }

                                    index = 0 ;
                                    while(index<menu.MenuCreateTrack.roadNames.size()){
                                        remoteObject.addStreetName(menu.MenuCreateTrack.roadNames[index]);
                                        index++;
                                    }


                                    // Server ready
                                    stage.mess.content = "Server ready!";
                                    // disable search option
                                    button_search.enabled = false;
                                    running_server.hide();
                                    // Set remote object to physic engine
                                    util.RemoteObject.remoteObject = remoteObject;
                                    running_server.server = remoteObject;
                                    remoteObject.setCar(tf_owner.text,0);
                                    println(remoteObject.getName());
                                    running_server.show();
                                    running_server.carsCB[0].selected = true;
                                    running_server.selectedCar = true;
                                    running_server.enabledAllCB(false);
                                    running_server.buttonStart.visible = true;
                                    // disactive search server
                                    blurCercaServer();
                                    // select style car
                                    util.RemoteObject.remoteObject.setCarStyle(0, 0);
                                    // numero
                                    util.MoveEngine.moveEngine.numero = 0;
                                    util.RemoteObject.flag_error = false;
                                    //util.RemoteObject.remoteObject.setRunning(false);
                                    this.running_server.updateList.playFromStart();
                                }
                            }
                        }
                    }
                    ]
                }
            ]
        }

    public function blurCercaServer(){
        blurCercaServerAnimation.playFromStart();
    }

    var radius = 0.0;
    var cercaServerForm =  DigLayout{
        columns:["e:400","120","e:20","160"]
        rows:["0","e:3","0","e:15","0"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX:70
        translateY:420

        effect:
        GaussianBlur {
            radius: bind radius
        }


        margin:0
        fixed:true
        digrows : [
            Row{
                items:[
                    Item{
                        valign:"middle"
                        halign:"right"

                        item:
                            menu.util.MenuLabel{text:"Server IP:"}
                    },
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            tf_ip
                    }
                    ]
                },
            Row{
                items:[
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            menu.util.MenuLabel{text:"Your name:"}
                    },
                    Item{
                        valign:"middle"
                        halign:"right"
                        item:
                            tf_user_name
                    }
                    ]
                },
            Row{
                items:[
                    Item{
                        colspan:4
                        valign:"middle"
                        halign:"right"

                        item:
                            button_search
                    }
                    ]
                }
            ]
        }

    var blurCercaServerAnimation = Timeline {
        repeatCount: 1
            keyFrames: [
                at (0s) {
                    radius => 0.0 tween Interpolator.LINEAR;
                },
                at (0.2s) {
                    radius => 5.0 tween Interpolator.LINEAR;
                }
            ]
    }

    /*
    *   Init menu
    */
    public function initMenu(){
        this.running_server.opacity = 0;
        radius = 0.0;
        this.running_server.initRunning();
    }

    /*
    *   Hide all items
    */
    public override function hide(){
        MenuItem.hide();
        // hide running server frame
        this.running_server.hide();
        // set not visible owner server button start
        this.running_server.buttonStart.visible = false;
        // enable search button
        button_search.enabled = true;
        // no blur effect in search frame
        radius = 0;
        // enable running server machines
        running_server.enabledAllCB(true);
        running_server.carsCB[0].selected = false;
        running_server.selectedCar = false;

        if(util.RemoteObject.flag_create == true){
            try{
            util.RemoteObject.server.stopServer();
            }catch(e:Exception){
                println("gia' fatto unbind");
            }

            util.RemoteObject.remoteObject = null;
            util.RemoteObject.flag_create = false;
        }
    }

    override public function create() : Node {
        group = Group{
            blocksMouse : bind blocksMouse;
            content:[
            RectangleBackGround{
                translateX:450
                translateY:80
                width: 350, height: 315
            },
            RectangleBackGround{
               translateX:450
               translateY:80 + 300 + 20
               width: 350,
               height: 200
            }
            Rectangle {
                x: 480, y: 190
                width: 130, height: 100
                stroke: Color.BLACK
                fill:Color.WHITE
                opacity:0.15
            }

            Text {
                font : Font {
                    size: 16
                }
                x: 505, y: 245
                content: "image map"
                fill:Color.WHITE
            }

            creaServerForm,
            cercaServerForm,
            running_server,
            track_image,
            button_add_track,
            ]
        };
        return group;
    }


}
