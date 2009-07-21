/*
 * LoadingGame.fx
 *
 * Created on 23-apr-2009, 09:05:49
 */

package menu;
import java.awt.Window;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import javafx.ext.swing.SwingLabel;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import menu.GameStage;
import track.PhysicsManager;
import track.Point;
import Window.JDLayout.DigLayout;
import Window.JDLayout.Item;
import Window.JDLayout.Row;

/**
 * @author Diego Benna
 */

public class LoadingManager extends CustomNode {

 /*
 *  Creo l'array dei punti iniziali
 */
var points:Point[] = [];
var special_points:Point[] = [];


    var background = ImageView {
        image: Image {
            url: "{__DIR__}images/wait.jpg"
            width: 990, height: 850
        }
    }

    var text = SwingLabel {
        text: "Loading ..."
        style:  "font: 18pt Arial-BOLD;"
        foreground:javafx.scene.paint.Color.WHITE
        width: 200
    }

    var layoutBackGround = DigLayout{
					fill: Color.TRANSPARENT
					columns:["100%"]
					rows:["100%"]
					fixed:false
					percentualFlag:true
					margin:0

					digrows:[
                        Row{
                            items:[
                                Item{
                                    valign:"middle"
                                    halign:"center"
                                    item:
                                    Rectangle {
                                        width: 300, height: 70
                                        fill: Color.BLACK
                                        opacity:0.4
                                        arcWidth: 15  arcHeight: 15

                                    }

                                }
                            ]
                        },
                    ]
                }

    var layoutText = DigLayout{
					fill: Color.TRANSPARENT
					columns:["100%"]
					rows:["100%"]
					fixed:false
					percentualFlag:true
					margin:0

					digrows:[
                        Row{
                            items:[
                                Item{
                                    valign:"middle"
                                    halign:"center"
                                    item:
                                        text
                                }
                            ]
                        },
                    ]
                }



    var opacity_bind:Number = 0.0;
    var group = Group{
            content:[
                background,
                layoutBackGround,
                layoutText
            ]
            opacity: bind opacity_bind
        }

    override public function create():Node{
        return group
    }

    var showing = Timeline {
        repeatCount: 1
            keyFrames: [
                at (0s) {
                    this.opacity_bind => 0.0 tween Interpolator.LINEAR
                },
                at (0.2s) {
                    this.opacity_bind => 1.0 tween Interpolator.LINEAR;
                }
            ]
    }

    public function hideLoading(){
        opacity_bind = 0.0;
    }

    public function startLoading(numCar:Integer, server:PhysicsManager){
        showing.playFromStart();

        this.text.text = "Loading track...";

        /*
        *   Set coordinate in server
        */
        var index = 0 ;
        points = [];
        var dim = util.RemoteObject.remoteObject.getCoordinateSize();
        while(index<dim){
            insert Point{
                x:util.RemoteObject.remoteObject.getLat(index)
                y:util.RemoteObject.remoteObject.getLon(index)
            } into points;
            index++;
        }

        index = 0 ;
        special_points = [];
        dim = util.RemoteObject.remoteObject.getSpecialCoordinateSize();
        while(index<dim){
            insert Point{
                x:util.RemoteObject.remoteObject.getSpecialLat(index)
                y:util.RemoteObject.remoteObject.getSpecialLon(index)
            } into special_points;
            index++;
        }

        index = 0 ;
        var streetNames:String[] = [];
        dim = util.RemoteObject.remoteObject.getStreetNameSize();
        while(index<dim){
            insert util.RemoteObject.remoteObject.getStreetName(index) into streetNames;
            println(util.RemoteObject.remoteObject.getStreetName(index));
            index++;
        }
        menu.MenuCreateTrack.roadNames = streetNames;
 

        /*
        * trackManager
        */
        var trackManager: track.CreateTrackManager = track.CreateTrackManager{
            points: points
            specialPoint: special_points
            zoom: 10
            delta:300
        };

        this.text.text = "Setting ready to server ...";
        server.setReady(numCar);
        var stage = this.scene.stage as GameStage;
        util.MoveEngine.moveEngine.setUserCar(numCar);
        util.MoveEngine.moveEngine.setGameEngineToMoveEngine();
        

        this.text.text = "Waiting all ...";

        stage.showTrack(trackManager);
    }



}
