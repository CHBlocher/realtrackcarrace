/*
 * GameStage.fx
 *
 * Created on 17-apr-2009, 14:59:11
 */

package menu;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import menu.GameSceneMenu;


/**
 * @author Diego Benna
 */

public class GameStage extends Stage{

    /*
    *   Menu scene
    */
    public var menu:GameSceneMenu;

    /*
    *   Scene bind with default menu
    */
    var bindScene:Scene =  menu;

    /*
    *   binding to bindScene -> for change scene
    */
    public override var scene = bind bindScene;
    
    /*
    *   Messagge error
    */
    public var mess = Text {
        font : Font {
            size: 18
        }
        fill:Color.WHITE
        x: 20, y: 18
        content: "JavaFX challenge 2009 - REAL TRACK CAR RACE"
    }

    /*
    *   Insert message error in menu scene
    */
    init{
        insert mess into scene.content;
    }

    /*
    *   Show track
    */
    public function showTrack(trackManager:track.CreateTrackManager){
        // create scene track with trackManager
        var sceneTrack = GameSceneTrack{trackManager:trackManager
                                        fill : Color.web("#02a101")};
        bindScene = sceneTrack;
        // set focus to move engine
        sceneTrack.setFocus();
    }

    /*
    *   Show menu
    */
    public function showMenu(){
        menu.reInit();
        menu.menu.menuMultiplayer.initMenu();
        bindScene = menu;
    }


}
