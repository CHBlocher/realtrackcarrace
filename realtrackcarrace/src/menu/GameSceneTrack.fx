/*
 * GameScene.fx
 *
 * Created on 17-apr-2009, 14:54:02
 */

package menu;
import java.lang.Exception;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.ext.swing.SwingLabel;
import javafx.scene.Scene;
import track.Track;
import util.MoveEngine;



/**
 * @author Diego Benna
 */

public class GameSceneTrack extends Scene{


    /*
    *   Move engine
    */
    var moveEngine:MoveEngine = util.MoveEngine.moveEngine;

    /*
    *   Array all cars user layer
    */
    public-read var cars:car.CarLayer[] = [];

    /*
    *
    */
    var popUpExit = PopUpMessage{}

    /*
    *   Show popUpExit
    */
    public function showPopUpExit(){
        popUpExit.show();
    }

    /*
    *   Set focus to moveEngine
    */
    public function setFocus(){
        moveEngine.requestFocus();
    }

    /*
    *   Track object Node
    */
    public var track : Track = null;

    /*
    *   Track manager
    */
    public-init var trackManager:track.CreateTrackManager;

    var position_list = bind positionList.PositionList{};



    /*
    *   Arrive message
    */
    public var arrive = track.countdown.Arrive{}

    /*
    *   Street view
    */
    var street = RectangleBackGroundStreet{};

    init{
        createTrack();
        insert moveEngine into content;
    }

    public function createTrack(){

        
        track = Track{
            numero: util.MoveEngine.moveEngine.getNumber();
            trackManager:trackManager
        }

        /*
        *   Initial car rotations
        */
        var rot = trackManager.getCarRotation();

        var cont = 0;
        while(cont < 10){
            if(util.RemoteObject.remoteObject.getCarState(cont))
            {
                var car = car.CarLayer{
                    numero:cont
                    url: "car{util.RemoteObject.remoteObject.getCarStyle(cont)+1}"
                    physic:util.RemoteObject.remoteObject
                };
                util.RemoteObject.remoteObject.setInitialRotation(cont,rot);
                insert car into cars;
                insert car into track.group.content;
                aggiorna.play();
                //car.start();
            }
            cont++;
        }


        insert track into content;
        insert position_list into content;
        insert arrive into content;
        insert popUpExit into content;
        insert street into content;
        
        /*
        *   Active update position
        */
        updatePosition.play();
    }

    var error = bind util.RemoteObject.flag_error on replace{
        if(error == true){
            updatePosition.stop();
        }
    }

    /*
    *   Update position check point
    */
    var lastUpdatePosition:Integer = -1 on replace{
            try{
                var pos:Integer[] = util.RemoteObject.remoteObject.getPositions();
                /*
                *   Update position list in desktop
                */
                position_list.update(pos);
            }catch(e:Exception){
                println("server not found in timeline update function");
                util.RemoteObject.flag_error = true;
            }
         };

    /*
    *   Control if change update position
    */

    var updatePosition = Timeline {
        repeatCount: Timeline.INDEFINITE
        keyFrames : [
            KeyFrame {
                time : 0.5s
                canSkip : true
                action: function(){
                    try{
                        lastUpdatePosition = util.RemoteObject.remoteObject.getUpdatePosition();
                    }catch(e:Exception){
                        println("server not found in timeline update position");
                        util.RemoteObject.flag_error = true;
                    }

                }

            }
        ]
    }

    /*
    *   Important Thread for update all cars
    */
    public var contCheckSpecialPoint:Integer = 1;
    public var outTrack:Boolean = false on replace {
        if(outTrack){
            println("in");
            util.RemoteObject.remoteObject.changeDamping(1,util.MoveEngine.moveEngine.numero);
        }else{
            println("out");
            util.RemoteObject.remoteObject.changeDamping(8,util.MoveEngine.moveEngine.numero);
        }


    };
    var aggiorna = Timeline {
        repeatCount: Timeline.INDEFINITE
        keyFrames : [
            KeyFrame {
                time : .03s
                canSkip : true
                action:function(){
                    for(i in cars){
                        i.update();
                        // it it is my car!
                        if(i.numero == util.MoveEngine.moveEngine.numero){
                            track.getX(i.curX);
                            track.getY(i.curY);
                            /*
                            *   Control check point collision
                            */
                            var sceneTrack = this;
                            var checkPoint = sceneTrack.track.checkPoint[i.checkPoint_status];
                            if(i.auto.boundsInScene.intersects(checkPoint.boundsInScene)){
                                checkPoint.zoom.play();
                                println("car {i.numero} intersects {i.checkPoint_status}");
                                util.RemoteObject.remoteObject.setChekPoint(i.checkPoint_status,i.numero);
                                i.checkPoint_status++;
                                checkPoint = sceneTrack.track.checkPoint[i.checkPoint_status];
                                if(checkPoint.special){
                                    println("-------------------- INDIRIZZO: {menu.MenuCreateTrack.roadNames[contCheckSpecialPoint]}");
                                    
                                    if(menu.MenuCreateTrack.roadNames[contCheckSpecialPoint]!=""){
                                        street.open();
                                        street.streetName =  menu.MenuCreateTrack.roadNames[contCheckSpecialPoint];
                                    }else{
                                        street.close();
                                    }

                                    contCheckSpecialPoint++;
                                }
                                println("{i.checkPoint_status} {sceneTrack.track.checkPoint.size()}");
                                if(i.checkPoint_status == sceneTrack.track.checkPoint.size()){
                                   sceneTrack.arrive.start(getPosition(util.MoveEngine.moveEngine.numero));
                                }
                            }
                            /*
                            *   Control if there is intersection with track
                            */
                            if(sceneTrack.track.path[2].contains(i.curX,i.curY)){
                                if(outTrack==false){
                                    outTrack=true
                                }
                            }else{
                                if(outTrack==true){
                                    outTrack=false
                                }
                            }

                        }
                    }
                }

            }
        ]
    };


     /*
     *  Update all position
     */
     public function getPosition(i:Integer):Integer{
        // new position array
        var position_array = util.RemoteObject.remoteObject.getPositions();
        var position_index = 0;

        while(position_index < position_array.size()){

            if(position_array[position_index] == util.MoveEngine.moveEngine.numero){
                return position_index+1;
            }

            position_index++;
        }
        0;

     }

}
