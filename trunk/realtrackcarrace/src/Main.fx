//  -Djava.security.policy=java.policy 

/**
* This is the Main project
* External jar:
* - Include memex library for Menu background effect
* - Include JDLibrary for DigLayout.
*   DigLayout is an advanced layout manager for javafx by Diego Benna
* - phys2d library for physics engine
*/

import javafx.scene.paint.Color;
import track.PhysicsManagerImpl;

/*
*   static var for remote object
*/
util.RemoteObject.server = new PhysicsManagerImpl();

/*
*   static var for move game engine
*/
util.MoveEngine.moveEngine = util.MoveEngine{};


/*
*   game menu
*/
var  menu = menu.Menu{};

/*
*   menu Scene
*/
var sceneMenu = menu.GameSceneMenu{
        fill:Color.BLACK
        menu: menu,
    };

/*
*   menu Stage
*/
var stage = menu.GameStage {
    width: 990
    height: 850
    menu: sceneMenu
}

