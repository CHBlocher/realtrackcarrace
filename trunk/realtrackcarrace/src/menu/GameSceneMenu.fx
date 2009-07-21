/*
 * GameScene.fx
 *
 * Created on 17-apr-2009, 14:54:02
 */

package menu;
import javafx.scene.Scene;
import track.PhysicsManager;


/**
 * @author Diego Benna
 */

public class GameSceneMenu extends Scene{

    // Loading image
    var loading:LoadingManager = LoadingManager{};
    public var menu:Menu;

    init{
        // add my loading object
        insert menu into content;
        insert loading into content;
    }

    public function startLoading(numCar:Integer, server:PhysicsManager){
        loading.startLoading(numCar, server);
    }

    public function select(to_menu:MenuItem,from_menu:MenuItem){
        menu.select(to_menu,from_menu);
    }

    public function reInit(){
        loading.hideLoading();
    }




}
