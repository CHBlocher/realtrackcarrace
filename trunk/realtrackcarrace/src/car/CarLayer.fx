
package car;import java.lang.Exception;
import java.lang.Math;
import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.effect.Shadow;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import track.PhysicsManager;


/**
 * @author Diego Benna
 */

public class CarLayer extends CustomNode {

    public-init var numero:Integer;
    public-init var physic:PhysicsManager;

    // url image
    public-init var url:String;

    var width:Number = 32;
    var height:Number = 57;

    public var curX:Number;
    public var curY:Number;

    public var posX:Number;
    public var posY:Number;
    public var rot:Number;

    var theta : Number;

    /**
    *   Check Point status
    */
    public var checkPoint_status:Integer = 0;
    

    public var auto = ImageView {
        image: Image {
            url: "{__DIR__}images/{url}.png"
        }
    }

    var ombra = ImageView {
        image: Image {
            url: "{__DIR__}images/{url}.png"
        }
        effect: Shadow {
            color: Color.BLACK
            radius: 5
        }
    }

    var contenitore : Group = Group{
        translateX : bind posX - width / 2;
        translateY : bind posY - height / 2;
        rotate : bind rot;
        content:[
            ombra,
            auto,
        ]
    }



    /*
    *   Create CustomNode
    */
    override public function create() : Node {
        contenitore;
    }

    public function update() : Void {
        try{
            curX = physic.getX(numero).floatValue();
            posX=curX;
            curY = physic.getY(numero).floatValue();
            posY=curY;
            theta = Math.toDegrees(physic.getRotation(numero));
            rot=theta;
        }catch(e:Exception){
            println("server no found");
            util.RemoteObject.flag_error = true;
            curX = 0;
            curY = 0;
            theta = 0
        }

    }
}
