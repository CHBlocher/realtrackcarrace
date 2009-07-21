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

public class PosArrive extends CustomNode {
    // text value
    public-init var text = "";

    // initial size
    var dim = 0.0;
    // max size
    public var size = 200;

    var number:Text = Text {
        font : Font {
            size: size
        }
        smooth:true
        strokeDashOffset:4
        fill:Color.WHITE
        stroke:Color.BLACK
        x: bind posX, y: bind posY
        transforms:[
            Scale { x : bind dim, y : bind dim,pivotX:100 ,pivotY:850/2  }
        ]
        content: text
    }


    //  position
    public var posX = 100;
    public var posY = 850/2+size/4;
    
    




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
                time : 0.6s
                canSkip : true
                values:[
                    opacity => 1.0
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
