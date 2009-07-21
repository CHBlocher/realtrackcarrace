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


public class CountDown extends CustomNode {

    /*
    *   Number to see
    */
    var number_4 = Num{
        text:"4"
    }

    var number_3 = Num{
        text:"3"
    }

    var number_2 = Num{
        text:"2"
    }

    var number_1 = Num{
        text:"1"
    }

    var go = Num{
        text:"GO!"
        posX : 990/2-350;
    }

    var count_down = Timeline {
        repeatCount: 1
        keyFrames : [
            KeyFrame {
                time : 0.1s
                canSkip : true
                action: function() {
                    println("start 4");
                    number_4.start();
                }
            }
            KeyFrame {
                time : 0.8s
                canSkip : true
                action: function() {
                    println("start 3");
                    number_3.start();
                }
            }
            KeyFrame {
                time : 1.5s
                canSkip : true
                action: function() {
                    println("start 2");
                    number_2.start();
                }
            }
           KeyFrame {
                time : 2.2s
                canSkip : true
                action: function() {
                    println("start 1");
                    number_1.start();
                }
            }
           KeyFrame {
                time : 2.9s
                canSkip : true
                action: function() {
                    println("GO!");
                    go.start();
                }
            }
           KeyFrame {
                time : 3.7s
                canSkip : true
                action: function() {
                    this.visible = false;
                    group.visible = false;
                }
            }
           KeyFrame {
                time : 3.2s
                canSkip : true
                action: function() {
                    util.RemoteObject.remoteObject.setFlagGo(true);
                }
            }
        ]
    }

    /*
    *   Start count down
    */
    public function start(){
        count_down.play();
    }

    var group = Group {
            content: [
                number_4
                number_3
                number_2
                number_1
                go
            ]
        };

    public override function create(): Node {
        return group;
    }
}
