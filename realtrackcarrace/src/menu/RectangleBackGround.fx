/*
 * RectangleBackGround.fx
 *
 * Created on 3-mag-2009, 14:33:38
 */

package menu;

import javafx.scene.CustomNode;
import javafx.scene.effect.DropShadow;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.scene.input.MouseEvent;

/**
 * @author Diego
 */
 public class RectangleBackGround extends CustomNode {
     public var width:Number;
     public var height:Number;

     public var radius:Number = 10;

     var rectangle =
            Rectangle {
                opacity:0.7
                width: width, height: height
                fill: Color.BLACK
                arcWidth: 15  arcHeight: 15
                effect: DropShadow {
                    offsetX: 0
                    offsetY: 0
                    color: Color.WHITE
                    radius: bind radius
                }
                onMouseEntered: function( e: MouseEvent ):Void {
                    entered.playFromStart();
                }
                onMouseExited: function( e: MouseEvent ):Void {
                    exited.playFromStart();
                }

            }

     public override function create(): Node {
         return Group {
             content: [rectangle]
         };
     }

     var entered =  Timeline {
         repeatCount: 1
         keyFrames : [
             KeyFrame {
                 time : 0.4s
                 canSkip : true
                 values:[
                    radius => 60
                 ]
             }
         ]
     }

     var exited =  Timeline {
         repeatCount: 1
         keyFrames : [
             KeyFrame {
                 time : 0.4s
                 canSkip : true
                 values:[
                    radius => 10
                 ]
             }
         ]
     }

 }

