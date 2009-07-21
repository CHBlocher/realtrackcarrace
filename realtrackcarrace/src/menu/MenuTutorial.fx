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

public class MenuTutorial extends MenuItem {

    public override var name ="tutorial";

    public var tutorial_1_img = ImageView {
        x:180
        y:60
        image: Image {
            url: "{__DIR__}images/tutorial_1.jpg"
        }
    }

    var text_1 = Text {
        font: Font { size: 15 }
        translateX:450
        translateY:90
        wrappingWidth: 380
        smooth:false
        fill:Color.WHITE
        textAlignment: TextAlignment.JUSTIFY
        content: "STEP 1 - CREATE TRACK\n"
                "In create track tab, set start address and destination address. Click SEARCH TRACK button. If application show track image than it's ok. Now you can click PLAY IN MULTIPLAYER button for game tab setting."
    }

    public var tutorial_2_img = ImageView {
        x:700
        y:200
        image: Image {
            url: "{__DIR__}images/tutorial_2.jpg"
        }
    }

    var text_2 = Text {
        font: Font { size: 15 }
        translateX:180
        translateY:270
        wrappingWidth: 480
        smooth:false
        fill:Color.WHITE
        textAlignment: TextAlignment.JUSTIFY
        content: "STEP 2 - MULTIPLAYER TAB\n"
                "Now you are in multiplayer tab. You can create a new server with your new track, or search some other created server. Insert setting and click CREATE SERVER button, or SEARCH SERVER button."
    }

    public var tutorial_3_img = ImageView {
        x:180
        y:350
        image: Image {
            url: "{__DIR__}images/tutorial_3.jpg"
        }
    }

    var text_3 = Text {
        font: Font { size: 15 }
        translateX:420
        translateY:380
        wrappingWidth: 400
        smooth:false
        fill:Color.WHITE
        textAlignment: TextAlignment.JUSTIFY
        content: "STEP 3 - RUNNING SERVER TAB\n"
                "Now select your favorite car. If you are server owner you are the first player. Or if you are a client, select one slot (CheckBox). The owner can start the race clicking START button. If you are client the game start when owner lanch game."
    }

    public var tutorial_4_img = ImageView {
        x:700
        y:490
        image: Image {
            url: "{__DIR__}images/tutorial_4.jpg"
        }
    }

    var text_4 = Text {
        font: Font { size: 15 }
        translateX:180
        translateY:520
        wrappingWidth: 400
        smooth:false
        fill:Color.WHITE
        textAlignment: TextAlignment.JUSTIFY
        content: "STEP 4 - GAME\n"
                "Drive with key (see CONTROL KEY tab) vs your friends and see real track streets."
    }

    public override function create(): Node {
        group = Group {
 
             content: [
                RectangleBackGround{
                    translateX:160
                    translateY:40
                    width: 700, height: 600
                },
                tutorial_1_img
                text_1
                tutorial_2_img
                text_2
                tutorial_3_img
                text_3
                tutorial_4_img
                text_4
             ]
         };
         return group;
     }
}
