/*
 * MenuItem.fx
 *
 * Created on 5-mag-2009, 09:48:33
 */

package menu;import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.animation.KeyFrame;

/**
 * @author Diego Benna
 * This is an interface for all menu item page
 */

public abstract class MenuItem extends CustomNode{

    // item menu name
    public var name:String;
    // opacity for showing
    override var opacity = 0.0;
    // all item group
    public var group:Group;

    // block mouse
    override var blocksMouse = false;

    /*
    *   Timeline for showing
    */
    var appari = Timeline {
        repeatCount: 1
            keyFrames: [
                KeyFrame {
                    time: 0.2s
                    values:[
                         this.opacity => 0.0 tween Interpolator.LINEAR
                    ]
                }
                KeyFrame {
                    time: 0.4s
                    values:[
                        this.opacity => 1 tween Interpolator.LINEAR
                    ]
                }                
            ]
    }

    /*
    *   Timeline for hiding
    */
    var scompari = Timeline {
        repeatCount: 1
            keyFrames: [
                at (0s) {
                    this.opacity => 1.0 tween Interpolator.LINEAR;
                },
                at (0.2s) {
                    this.opacity => 0.0 tween Interpolator.LINEAR;
                }
            ]
    }

    /*
    *   Show public function for all menu item
    */
    public function show(){
        scompari.stop();
        group.visible=true;
        if(opacity!=1.0){
            appari.playFromStart();
        }
    }

    /*
    *   Hide public function for all menu item
    */
    public function hide(){
        appari.stop();
        group.visible=false;
        if(opacity!=0.0){
            scompari.playFromStart();
        }
    }

}
