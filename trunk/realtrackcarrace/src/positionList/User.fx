/*
 * User.fx
 *
 * Created on 6-mag-2009, 11:40:42
 */

package positionList;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.shape.Rectangle;

/**
 * @author Diego Benna
 */

public class User extends CustomNode {

    public var image_url:String;
    public var user_name:String;
    
    var text_user_name = Text {
        font : Font {
            size: 17
        }
        fill:Color.WHITE
        x: 70, y: 30
        content: bind user_name
    }
    
    public var actual_image = Image {
                 url: "{__DIR__}images/{image_url}.jpg"
             }

     var image = ImageView {
             x:10
             y:8
             image: bind actual_image
         };

     var group = Group {
     content:[
            Rectangle {
                 width: 300, height: 45
                 fill: Color.BLACK
                 opacity:0.3
                 stroke:Color.GRAY
                 arcWidth: 15  arcHeight: 15
             }
         ]
    };

     public override function create(): Node {
         insert image into group.content;
         insert text_user_name into group.content;
         return group;
     }
}
