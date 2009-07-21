/*
 * CountDown.fx
 *
 * Created on 6-mag-2009, 18:25:21
 */

package track.countdown;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;

/**
 * @author Diego Benna
 */


public class Arrive extends CustomNode {

    /*
    *   Number to see
    */
    var primo = PosArrive{
        text: "Win!"
    }
    var secondo = PosArrive{
        text: "Second"
    }
    var terzo = PosArrive{
        text: "Third"
    }

    var arrive_1 = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.1s
                canSkip : true
                action: function() {
                    println("arrivato");
                    primo.start();
                }
            }

        ]
    }

    var arrive_2 = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.1s
                canSkip : true
                action: function() {
                    println("arrivato");
                    secondo.start();
                }
            }

        ]
    }

    var arrive_3 = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.1s
                canSkip : true
                action: function() {
                    println("arrivato");
                    terzo.start();
                }
            }

        ]
    }

    /*
    *   Start count down
    */
    public function start(num:Integer){
        if(num==1){
            arrive_1.play();
        }
        if(num==2){
            arrive_2.play();
        }
        if(num==3){
            arrive_3.play();
        }
    }

    var group = Group {
            content: [
                primo,secondo,terzo
            ]
        };

    public override function create(): Node {
        return group;
    }
}
