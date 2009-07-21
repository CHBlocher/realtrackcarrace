/*
 * MenuInfo.fx
 *
 * Created on 13-mag-2009, 08:52:04
 */

package menu;


import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import menu.MenuItem;
import menu.RectangleBackGround;


/**
 * @author Diego Benna
 */

public class MenuKeyboard extends MenuItem {

    public override var name ="keyboard";



    public var key_img = ImageView {
        x:380
        y:150
        image: Image {
            url: "{__DIR__}images/key.png"
        }
    }



    public override function create(): Node {
        group = Group {
 
             content: [
                RectangleBackGround{
                    translateX:200
                    translateY:40
                    width: 700, height: 600
                },
                key_img

             ]
         };
         return group;
     }
}
