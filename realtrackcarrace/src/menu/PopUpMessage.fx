/*
 * NewJavaFXClass.fx
 *
 * Created on 13-mag-2009, 19:17:10
 */

package menu;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.ext.swing.SwingLabel;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import menu.RectangleBackGround;
import Window.JDLayout.DigLayout;
import Window.JDLayout.Item;
import Window.JDLayout.Row;
import javafx.ext.swing.SwingButton;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;

/**
 * @author Diego Benna
 */

public class PopUpMessage extends CustomNode {

    var opa = 0.0;

    public-init var width:Number = 250;
    public-init var height:Number = 150;

    var background = RectangleBackGround{
                    width: width, height: height
                }

    var layoutManager = DigLayout{
        opacity: bind opa
        columns:["990"]
        rows:["850"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        margin:0
        fixed:true
        digrows : [
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                background

                            },
                            ]
                     }
                    ]
                }

    var form = DigLayout{
        columns:["0","0"]
        rows:["0","e:10","70"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        margin:0
        fixed:true
        digrows : [
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                colspan:2
                                item:
                                menu.util.MenuLabel {
                                    style :  "font: 18pt Arial-BOLD;"
                                    text: "Do you want exit?"
                                }
                            },
                            ]
                     },
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                ImageView {
                                    image: Image {
                                        url: "{__DIR__}images/yes.png"
                                    }
                                    onMousePressed: function( e: MouseEvent ):Void {
                                        var scene = this.scene as GameSceneTrack;
                                        var stage = scene.stage as GameStage;
                                        stage.showMenu();
                                        // Set ready server to run race
                                        util.RemoteObject.remoteObject.setRunning(false);
                                        // Start move engine
                                        util.MoveEngine.moveEngine.stopEngine();
                                        // stop server
                                        util.RemoteObject.remoteObject.stopServer()
                                    }
                                }

                            },
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                ImageView {
                                    image: Image {
                                        url: "{__DIR__}images/no.png"
                                    }
                                    onMousePressed: function( e: MouseEvent ):Void {
                                        end.playFromStart();
                                    }
                                }
                            },
                            ]
                     }
                    ]
                }

    var message = DigLayout{
        opacity: bind opa
        columns:["990"]
        rows:["850"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        margin:0
        fixed:true
        digrows : [
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                    form

                            },
                            ]
                     }
                    ]
                }

    public function show(){
        start.playFromStart();
    }

    var group = Group {
            content: [
                layoutManager
                message
            ]
        };

    public override function create(): Node {
        return group;
    }

    var start =  Timeline {
         repeatCount: 1
         keyFrames : [
             KeyFrame {
                 time : 0.4s
                 canSkip : true
                 values:[
                    opa => 1.0
                 ]
             }
         ]
     }

     var end =  Timeline {
         repeatCount: 1
         keyFrames : [
             KeyFrame {
                 time : 0.4s
                 canSkip : true
                 values:[
                    opa => 0.0
                 ]
             }
         ]
     }
}

