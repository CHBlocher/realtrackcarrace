/*
 * ChoiceCar.fx
 *
 * Created on 12-mag-2009, 10:23:05
 */

package choiceCar;

import javafx.scene.Cursor;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import java.rmi.server.RemoteObject;

/**
 * @author Diego
 */

public class ChoiceCar extends CustomNode {

    // choice your car text
    var title = Text {
        fill:Color.WHITE
        font : Font {
            size: 18
        }
        x: 10+34
        content: "Select your car"
    }

    // choice your car text
    var carName = Text {
        fill:Color.WHITE
        font : Font {
            size: 16
        }
        y:117
        x:34
        content: bind names[counter]
    }


    // car array
    var images : Image[] = [
        Image {
            url: "{__DIR__}images/car1.jpg"
        },
        Image {
            url: "{__DIR__}images/car2.jpg"
        }
    ];

    // car array
    public var names : String[] = [
        "Diegona 100Style",
        "Albertona FX"
    ];

    // counter car index
    var counter = 0;

    // arrow left
    var arrow_left = ImageView {
        onMouseEntered: function( e: MouseEvent ):Void {
            cursor = Cursor.HAND
        }
        onMouseExited: function( e: MouseEvent ):Void {
            cursor = Cursor.DEFAULT
        }    
        translateX:0
        translateY:27+4
        image: Image {
            url: "{__DIR__}images/arrow_left.png"
        }
        onMousePressed: function( e: MouseEvent ):Void {
            counter--;
            if(counter<0){
                counter=images.size()-1;
            }
            var num_car = util.MoveEngine.moveEngine.numero;
            if(num_car!=-1)
                util.RemoteObject.remoteObject.setCarStyle(num_car, counter);
        }
    }

    // arrow right
    var arrow_right = ImageView {
        onMouseEntered: function( e: MouseEvent ):Void {
            cursor = Cursor.HAND
        }
        onMouseExited: function( e: MouseEvent ):Void {
            cursor = Cursor.DEFAULT
        }
        translateX:160+34
        translateY:27+4
        image: Image {
            url: "{__DIR__}images/arrow_right.png"
        }
        onMousePressed: function( e: MouseEvent ):Void {
            counter++;
            if(counter==images.size()){
                counter=0;
            }
            var num_car = util.MoveEngine.moveEngine.numero;
            if(num_car!=-1)
                util.RemoteObject.remoteObject.setCarStyle(num_car, counter);
        }

    }

    // actual image
    var actual_image = bind images[counter];

    // image view
    var car = ImageView {
        translateY:4
        translateX:34
        image: bind actual_image
    };
    
    public override function create(): Node {
        return Group {
            translateX:130
            translateY:460
            content: [
                car,
                arrow_right,
                arrow_left,
                title,
                carName
            ]
        };
    }

    /*
    *   return counter
    */
    public function getCounter():Integer{
        return counter;
    }

}
