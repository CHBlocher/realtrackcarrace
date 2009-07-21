/*
 * CheckPoint.fx
 *
 * Created on 7-mag-2009, 09:25:20
 */

package track;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.effect.Glow;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Line;
import javafx.scene.text.Text;
import javafx.scene.transform.Scale;

/**
 * @author Diego Benna
 */


public class CheckPoint extends CustomNode{
    
    public-init var start_x:Number;
    public-init var end_x:Number;
    public-init var start_y:Number;
    public-init var end_y:Number;
    public var color = Color.WHITE;
    public var number:Integer = 10;
    public var special:Boolean = false;

    var border = Line {
        startX: start_x, startY: start_y
        endX: end_x, endY: end_y
        strokeWidth: 30
        stroke: color
        opacity: 0.0
    }

    var circle = Circle {
        transforms:[
            Scale { x : bind bindZoom, y : bind bindZoom, pivotX: end_x ,pivotY:end_y }
        ]
        centerX: end_x, centerY: end_y
        radius: 25
        fill: Color.WHITE
        stroke:Color.BLACK
        strokeWidth:2
        effect: Glow {
            level: 1
        }
        opacity:1//0.7
    }

    public var numero:Text = Text{}



    var bindOpacity=1.0;
    var bindZoom=1.0;

    public var zoom = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.5s
                canSkip : true
                values:[
                    bindOpacity => 0.5
                    bindZoom => 2.0
                ]
            }
            KeyFrame {
                time : 2.0s
                canSkip : true
                values:[
                    bindOpacity => 0.0
                    bindZoom=>0.0
                ]
            }
        ]
    }


    var group = Group{
            opacity : bind bindOpacity

            content:bind [
                border,
                circle,
                numero
            ]
        }

    override public function create() : Node {
        group;
    }
}
