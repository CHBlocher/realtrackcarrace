/*
 * Number.fx
 *
 * Created on 6-mag-2009, 18:25:49
 */

package track.countdown;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.transform.Scale;

/**
 * @author Diego Benna
 *  This is number object
 */

public class Num extends CustomNode {
    // text value
    public var text = "";

    // initial size
    var dim = 0.0;
    // max size
    public var size = 400;
    //  position
    public var posX = 990/2-size/4;
    public var posY = 850/2+size/4;
    
    
    var number = Text {
        font : Font {
            size: size
        }
        smooth:true
        strokeDashOffset:4
        fill:Color.WHITE
        stroke:Color.BLACK
        x: posX, y: posY
        transforms:[
            Scale { x : bind dim, y : bind dim,pivotX: 990/2 ,pivotY:850/2  }
        ]
        content: "hello"
    }

    /*
    *   set number to text
    */
    init{
        number.content = text;
    }

    /*
    *   Start zoom and hide
    */
    public function start(){
        zoomIn.play();
    }

    /**
    *   zoom and hide
    */
    var zoomIn = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.6s
                canSkip : true
                values:[
                    dim => 1.0
                ]
            },
            KeyFrame {
                time : 0.4s
                canSkip : true
                values:[
                    opacity => 1.0
                ]
            },
            KeyFrame {
                time : 0.7s
                canSkip : true
                values:[
                    opacity => 0.0
                ]
            }
        ]
    }


    public override function create(): Node {
        return Group {
            content: [
                number
            ]
        };
    }
}
