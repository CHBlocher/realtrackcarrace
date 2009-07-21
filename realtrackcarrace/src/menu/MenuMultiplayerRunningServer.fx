/*
 * MenuMultiplayerRunningServer.fx
 *
 * Created on 16-apr-2009, 21:59:48
 */

package menu;


import java.lang.Exception;
import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.ext.swing.SwingButton;
import javafx.ext.swing.SwingLabel;
import javafx.ext.swing.SwingRadioButton;
import javafx.ext.swing.SwingToggleGroup;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import menu.GameSceneMenu;
import menu.RectangleBackGround;
import track.PhysicsManager;
import Window.JDLayout.DigLayout;
import Window.JDLayout.Item;
import Window.JDLayout.Row;

/**
 * @author Diego Benna
 * This is form about remote object running
 */

public var usersName:String[];

public class MenuMultiplayerRunningServer extends CustomNode {
    
    override var opacity = 0.0;
    public var server:PhysicsManager;
    var nome_server:String = "noName";
    var nome_mappa:String = "noName";
    var groupCB = SwingToggleGroup{};
    public var user:String;
    public var selectedCar = false;
    var lanch = false;
    protected var buttonStart = SwingButton {
                            text: "Start race"
                            visible : false;
                            action: function() {
                                println("start race");
                                // Set ready server to run race
                                util.RemoteObject.remoteObject.setRunning(true);
                                // Start move engine
                                util.MoveEngine.moveEngine.startEngine();
                            }
                        }

    public function enabledAllCB(value:Boolean):Void{
        for(i in carsCB){
            i.enabled = value;
        }
    }

    var car0 = SwingRadioButton {
        text: "unused"
        width:300
        toggleGroup: groupCB
        style:  "font: 16pt Arial-BOLD;"
        foreground:javafx.scene.paint.Color.WHITE
        action: function() {
            println("click");
            if (selectedCar == false){
                selectedCar = server.setCar(user,0);
                util.MoveEngine.moveEngine.numero = 0;
                util.RemoteObject.remoteObject.setCarStyle(util.MoveEngine.moveEngine.numero, choice_car.getCounter());
            }
        }

    }

    var car1 = SwingRadioButton {
        text: "unused"
        width:300
        toggleGroup: groupCB
        style:  "font: 16pt Arial-BOLD;"
        foreground:javafx.scene.paint.Color.WHITE
        action: function() {
            println("click {user}");
            if (selectedCar == false){
                selectedCar = server.setCar(user,1);
                util.MoveEngine.moveEngine.numero = 1;
                util.RemoteObject.remoteObject.setCarStyle(util.MoveEngine.moveEngine.numero, choice_car.getCounter());
            }
        }
    }

    var car2 = SwingRadioButton {
        text: "unused"
        width:300
        toggleGroup: groupCB
        style:  "font: 16pt Arial-BOLD;"
        foreground:javafx.scene.paint.Color.WHITE
        action: function() {
            println("click");
            if (selectedCar == false){
                selectedCar = server.setCar(user,2);
                util.MoveEngine.moveEngine.numero = 2;
                util.RemoteObject.remoteObject.setCarStyle(util.MoveEngine.moveEngine.numero, choice_car.getCounter());
            }
        }
    }

    protected var carsCB = [car0,car1,car2];

    /*
    // init radio button array
    init{
        var num_radio_button = 3;
        var cont=0;
        while(cont<num_radio_button){
            // insert radio button
            insert

            SwingRadioButton {
                    text: "unused"
                    width:150
                    toggleGroup: groupCB
                    style:  "font: 16pt Arial-BOLD;"
                    foreground:javafx.scene.paint.Color.WHITE
                    action: function() {
                        println("click");
                        if (selectedCar == false){
                            selectedCar = server.setCar(user,2);
                            numCar = cont;
                        }
                    }
                }

            into carsCB;
            // increment
            cont++;
        }

    }*/

    var findServer =  DigLayout{
        columns:["100","150"]
        rows:["0","0","e:15","0","e:5","0","e:25","0"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX:100
        translateY:240

        margin:0
        fixed:true
        digrows : [
            Row{
                items:[
                    Item{
                        valign:"middle"
                        halign:"left"

                        item:
                        menu.util.MenuLabel {text: "Find server: "}

                    },
                    Item{
                        valign:"middle"
                        halign:"left"

                        item:
                        SwingLabel {
                            width:150
                            text: bind nome_server
                            style:  "font: 16pt Arial-BOLD;"
                            foreground:javafx.scene.paint.Color.GRAY
                        }

                    }
                    ]
                },
            Row{
                items:[
                    Item{
                        valign:"middle"
                        halign:"left"

                        item:
                        menu.util.MenuLabel {text: "Map name: "}

                    },
                    Item{
                        valign:"middle"
                        halign:"left"

                        item:
                        SwingLabel {
                            width:150
                            text: bind nome_mappa
                            style:  "font: 16pt Arial-BOLD;"
                            foreground:javafx.scene.paint.Color.GRAY
                        }

                    }
                    ]
                },
            Row{
                items:[
                    Item{
                        colspan:2
                        valign:"middle"
                        halign:"center"
                        item:
                           SwingLabel {
                                text: "connected players:"
                                style:  "font: 12pt Arial-BOLD;"
                                foreground:javafx.scene.paint.Color.LIGHTGRAY
                            }
                        }
                    ]
                },
            Row{
                items:[
                    Item{
                        colspan:2
                        valign:"middle"
                        halign:"left"
                        type:"VBox"
                        item:[
                            carsCB
                        ]

                        }
                    ]
                },
            Row{
                items:[
                    Item{
                        colspan:2
                        valign:"middle"
                        halign:"right"

                        item: buttonStart

                        }
                    ]
                },
            ]
	}

    // choice your car
    var choice_car = choiceCar.ChoiceCar{};

    var opacita = 0.0;
    var appari = Timeline {
        repeatCount: 1
            keyFrames: [
                at (0.0s) {
                    this.opacity => 0.0 tween Interpolator.LINEAR;
                },
                at (0.2s) {
                    this.opacity => 1 tween Interpolator.LINEAR;
                }
            ]
    }

    var scompari = Timeline {
        repeatCount: 1
            keyFrames: [
                at (0s) {
                    this.opacity => 1.0 tween Interpolator.LINEAR;
                },
                at (0.2s) {
                    this.opacity => 0.0 tween Interpolator.LINEAR;
                }
            ]
    }

    public function show(){
        nome_server = server.getName();
        nome_mappa = server.getMapName();
        scompari.stop();
        if(opacity!=1.0){
            blocksMouse = true;
            appari.playFromStart();
        }
    }

    public function hide(){
        appari.stop();
        if(opacity!=0.0){
            scompari.playFromStart();
            blocksMouse = false;
        }
    }

    override public function create():Node{
        Group{
            content:[
                RectangleBackGround {
                    translateX:80
                    translateY: 220
                    width: 320, height: 400
                },
                findServer,
                choice_car
            ];
        }
    }

    /*
    *   Error control
    */
    var error = bind util.RemoteObject.flag_error on replace{
        if(error == true){
            updateList.stop();
            println("no server found in multiplayer running");
            util.MoveEngine.moveEngine.stopEngineWithError();
        }
    }

    /*
    *   Listening server for star race and update players
    */
    public var updateList = Timeline {
        repeatCount: Timeline.INDEFINITE
        keyFrames : [
            KeyFrame {
                time : 1s
                canSkip : true
                action: function() {
                    try{
                    var cont:Integer = 0;
                    
                    for(i in carsCB){
                        var nome = server.getOwnerCar(cont);
                        if(nome!=null){
                            i.text = "{nome} ({choice_car.names[util.RemoteObject.remoteObject.getCarStyle(cont)]})";
                            i.enabled = false;
                        }else{
                            i.text = "unused";
                        }
                        cont++;
                    }

                    if(server.getRunning()){
                        if(lanch == false){
                            lanch = true;
                            usersName = [];
                            insert this.car0.text into usersName;
                            insert this.car1.text into usersName;
                            insert this.car2.text into usersName;
                            var scene = this.scene as GameSceneMenu;
                            scene.startLoading(util.MoveEngine.moveEngine.numero,server);
                        }
                    }
                    }catch(e:Exception){
                        println("server no found in multiplayer running");
                        println(e);
                        util.RemoteObject.flag_error = true;
                    }


                }
            }
        ]
    }

    /*
    *   Init this menu
    */
    public function initRunning(){
        lanch = false;
    }





}
