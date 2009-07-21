/*
 * Menu.fx
 *
 * Created on 3-mag-2009, 09:42:06
 */

package menu;

import javafx.geometry.Rectangle2D;
import javafx.scene.CustomNode;
import javafx.scene.effect.Reflection;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import org.memefx.accordion.ImageItem;
import org.memefx.accordion.ImagesAccordion;

/**
 * @author Diego Benna
 */
public class Menu extends CustomNode {

    function enter(image:ImageItem) {
        println("{image.id} entered");
    }

    function click(image:ImageItem) {
        println("{image.id} pressed");
        menuTutorial.hide();
        menuMultiplayer.hide();
        menuCreateTrack.hide();
        menuInfo.hide();
        menuKeyboard.hide();
    }

    function clickTutorial(image:ImageItem) {
        menuTutorial.show();
        menuMultiplayer.hide();
        menuCreateTrack.hide();
        menuInfo.hide();
        menuKeyboard.hide();
        println("{image.id} pressed");
    }

    function clickMultiplayer(image:ImageItem) {
        menuTutorial.hide();
        menuMultiplayer.show();
        menuCreateTrack.hide();
        menuInfo.hide();
        menuKeyboard.hide();
        println("{image.id} pressed");
    }


    function clickCreateTrack(image:ImageItem) {
        menuTutorial.hide();
        menuMultiplayer.hide();
        menuInfo.hide();
        menuCreateTrack.show();
        menuKeyboard.hide();
        println("{image.id} pressed");
    }

    function clickMenuInfo(image:ImageItem) {
        menuTutorial.hide();
        menuMultiplayer.hide();
        menuInfo.show();
        menuCreateTrack.hide();
        menuKeyboard.hide();
        println("{image.id} pressed");
    }

    function clickKeyboard(image:ImageItem) {
        menuTutorial.hide();
        menuMultiplayer.hide();
        menuInfo.hide();
        menuCreateTrack.hide();
        menuKeyboard.show();
        println("{image.id} pressed");
    }

    /*
    *   Multiplayer tab item
    */
    protected var menuMultiplayer = menu.MenuMultiPlayer{};

    /*
    *   Create map tab item
    */
    protected var menuCreateTrack = menu.MenuCreateTrack{};

    /*
    *   Create menu info tab item
    */
    protected var menuInfo = menu.MenuInfo{};

    /*
    *   Create menu info tab item
    */
    protected var menuTutorial = menu.MenuTutorial{};

    /*
    *   Create menu info tab item
    */
    protected var menuKeyboard = menu.MenuKeyboard{};

    /*
    *   Menu background effect
    */
    public var menu = ImagesAccordion {
            lineColor :Color.BLACK
            width: 950,
            height: 750,
            orientation: ImagesAccordion.HORIZONTAL
            translateX: 20,
            translateY: 20
            selectOnPressed: true,
            hideOnExit: false

            images: [
                ImageItem {
                    id: "game",
                    caption: "Game"
                    image: Image { url: "{__DIR__}images/game.jpg"
                        width: 900,
                        height: 750
                    }
                    message: "REAL TRACK GAME: "
                             "Mash-up, java RMI, math, physics, javafx, computer science, fantasy and passion all in one game. Challenge in your house street, in your city vs your friend. "
                             "Drive in all street in the world! "
                             
                    messageArea: Rectangle2D {
                        minX: 20,
                        minY: 633,
                        width: 360,
                        height: 80
                    }
                    messageFont: Font { size: 12
                    }
                    onMouseEntered: enter
                    onMousePressed: click
                },

                ImageItem {
                    id: "multiplayer",
                    caption: "Multiplayer"
                    image: Image { url: "{__DIR__}images/moais.jpg"
                        width: 900,
                        height: 750
                    }
                    message: "Create a new server for invite your friends to play. Insert IP address for find friend's servers. Select your car and wait server run match."
                    messageArea: Rectangle2D {
                        minX: 30,
                        minY: 653,
                        width: 350,
                        height: 87
                    }
                    onMousePressed: clickMultiplayer
                },
                ImageItem {
                    id: "map",
                    caption: "Create track"
                    image: Image { url: "{__DIR__}images/map.jpg"
                        width: 900,
                        height: 750
                    }
                    message: "CREATE TRACK "
                             "Set a real START address and set a real END address "
                             "click 'Search track' for find track. You can use 4 time this option becous is Yahoo api geocoding restrict it. "
                             "For use 4 more time 'Search track' button, you must restart this software. Use your map for multiplayer race or single player rally. "
                    messageArea: Rectangle2D {
                        minX: 20,
                        minY: 650,
                        width: 720,
                        height: 70
                    }
                    onMousePressed: clickCreateTrack
                }
                ImageItem {
                    id: "tutorial",
                    caption: "Tutorial"
                    image: Image { url: "{__DIR__}images/setting.jpg"
                        width: 900,
                        height: 750
                    }
                    onMousePressed: clickTutorial
                },
                ImageItem {
                    id: "control",
                    caption: "Keyboard control"
                    image: Image { url: "{__DIR__}images/motore.jpg"
                        width: 900,
                        height: 750
                    }
                    onMousePressed: clickKeyboard
                    message: "You did't have a keyboard?? mmmm it's a problem!"

                    messageArea: Rectangle2D {
                        minX: 100,
                        minY: 650,
                        width: 360,
                        height: 40
                    }
                },
                ImageItem {
                    id: "info",
                    caption: "Info"
                    image: Image { url: "{__DIR__}images/info.jpg"
                        width: 770,
                        height: 750
                    }
                    message: "28 May 2009: Thank Alberto Maran for helping me in some ideas and game consultancy. For create this game we use audacity, sympathy, study and more time. Thanks for JDLayout, MemeFX and Phys2D library."
                    messageArea: Rectangle2D {
                        minX: 50,
                        minY: 650,
                        width: 580,
                        height: 50
                    }
                    onMousePressed: clickMenuInfo
                },
                
            ]
            effect: Reflection { fraction: 0.1
            }

        }

    /*
    *   Select a new page in menu. Hide
    */
    public function select(to_menu:MenuItem,from_menu:MenuItem){
        from_menu.hide();
        menu.select(to_menu.name);
        to_menu.show();
    }

    public override function create(): Node {
        menu.select("game");

        return Group {
            content: [
                menu,
                menuTutorial,
                menuKeyboard,
                menuCreateTrack,
                menuMultiplayer,
                menuInfo

            ]
        };
    }
}

