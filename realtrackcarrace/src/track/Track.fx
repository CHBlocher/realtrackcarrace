/*
 * Track.fx
 *
 * Created on 26-apr-2009, 11:10:30
 */

package track;

import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.transform.Scale;
import javafx.scene.transform.Translate;
import track.CheckPoint;





/**
 * @author Diego Benna
 */

public class Track extends CustomNode {

    public-init var trackManager:track.CreateTrackManager;

    public var width:Number = if(trackManager.getWidth()<0){
        trackManager.getWidth()*(-1);
    }else{
        trackManager.getWidth();
    }
    public var height:Number = if(trackManager.getHeight()<0){
        trackManager.getHeight()*(-1);
    }else{
        trackManager.getHeight();
    }


    var widthWindow:Number = util.Constants.width + 40;
    var heightWindow:Number = util.Constants.height + 100;
    public var numero:Integer = 0;

    public var posX:Number;
    public var posY:Number;

    public var zoom:Number = 0.8;

    var trackScene:menu.GameSceneTrack;


    init{
        trackManager.getWidth();
        trackManager.getHeight();
    }


    /*
    *   CountDown 3, 2, 1.. GO!
    */
    var count_down = track.countdown.CountDown{}

    /*
    *   Check point array
    */
    public var checkPoint : CheckPoint[] = trackManager.getCheckPoints();

    /*
    *   Track components
    */
    public var path = trackManager.getPath();

    public var group:Group = Group{
        transforms: [
            Scale { x : bind zoom, y : bind zoom, pivotX:495 ,pivotY:425 }
            Translate { x : bind posX, y : bind posY },
        ]
        content:[



             // array path (track and lines)
             path

             // other components: borders, flags
             trackManager.getComponents()

             // initial count down
             count_down

             // all check points
             checkPoint
                    
        ]
    }

    public override function create():Node{
        count_down.start();
        return group;
    }

    public function getY(curY:Number){
        var translateY = curY;
        var result = 0.0;
        if( false/*(translateY < heightWindow/2.0)*/){
            result
        }else{
            if(false/*translateY + heightWindow/2.0 > height*/){
                result = height-heightWindow;
            }else{
                result = translateY-heightWindow/2.0;
            }
        }
        posY = -result;
    }

    public function getX(curX:Number){
        var translateX = curX;
        var result = 0.0;
        //println(translateX);
        if( false/*(translateX < widthWindow/2.0)*/){
            result
        }else{
            if(false/*translateX > width - widthWindow/2.0*/){
                result = width-widthWindow;
            }else{
                result = translateX-widthWindow/2.0;
            }
        }
        posX = -result;
    }



    /*
    *   Rate bind for timeline zoom
    */
    var rateBind = 1.0;

    /*
    *   ZoomOut in function
    */
    public function zoomOut(){
        startZoom.pause();
        rateBind = 1.0;
        startZoom.play();
    }

    /*
    *   Zoom in function
    *   Zoom rate bind map
    */
    public function zoomIn(){
        startZoom.pause();
        rateBind = -1.0;
        startZoom.play();
    }

    /*
    *   Timeline zoom
    */
    var startZoom = Timeline {
        repeatCount: 1
        rate: bind rateBind
        keyFrames : [
                at (0s) {
                    zoom => 0.8;
                }
                at (3s) {
                    zoom => 0.4 tween Interpolator.EASEOUT;
                }
        ]
    }



}
