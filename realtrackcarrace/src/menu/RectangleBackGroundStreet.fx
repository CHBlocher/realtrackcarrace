/*
 * RectangleBackGround.fx
 *
 * Created on 3-mag-2009, 14:33:38
 */

package menu;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.effect.DropShadow;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import javafx.scene.transform.Scale;

/**
 * @author Diego
 */
 public class RectangleBackGroundStreet extends CustomNode {
     public var width:Number;
     public var height:Number;

     public var radius:Number = 10;
     public var scaleWidth:Number = 0;
     public var opy:Number = 0.0;

     var rectangle =
            Rectangle {
                opacity:0.7
                translateX:990/2-500/2
                translateY:850-110
                width: 500, height: 60
                fill: Color.BLACK
                arcWidth: 15  arcHeight: 15
                effect: DropShadow {
                    offsetX: 0
                    offsetY: 0
                    color: Color.WHITE
                    radius: bind radius
                }
                transforms:[
                    Scale { x : bind scaleWidth, y : 1}
                ]
            }

     public var streetName = "Via Ragazzi del 99";

     var text = Text {
         font : Font {
             size: 24
         }
         x: 990/2-500/2+50, y: 850-(110+60-24)/2
         content: bind streetName
         fill:Color.WHITE
         opacity: bind opy
     }

     public override function create(): Node {
         return Group {
             content: [
                rectangle
                text
             ]
         };
     }

    var openWin = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.5s
                canSkip : true
                values:[
                    opy => 1.0
                ]
            }
            KeyFrame {
                time : 1s
                canSkip : true
                values:[
                    scaleWidth => 1
                ]
            }
        ]
    }
    
    var closeWin = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.5s
                canSkip : true
                values:[
                    opy => 0.0
                ]
            }   
            KeyFrame {
                time : 1s
                canSkip : true
                values:[
                    scaleWidth => 0
                ]
            }
        ]
    }

    public function open(){
        openWin.playFromStart();
    }

    public function close(){
        closeWin.playFromStart();
    }



 }

