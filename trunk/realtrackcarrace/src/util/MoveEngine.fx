/*
 * MoveEngine.fx
 *
 * Created on 18-apr-2009, 10:29:33
 */

package util;

import java.lang.Exception;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import net.phys2d.math.Vector2f;
import track.PhysicsManager;
import track.Track;
import util.MoveEngine;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;

/**
 * @author Diego
 */
public var moveEngine:MoveEngine = null;

public class MoveEngine extends CustomNode{

    public var numero:Integer =-1;
    var physic:PhysicsManager;

    var force: Vector2f = new Vector2f();
    var par_forza = 2000;

    // lock key in rotation
    var keyLock: Boolean = false;
    // rotation value
    var velocitaRotazione:Number = 0.015;

    var press:Boolean = false;
    var track:Track = null;

    /*
    *   Send to server call for turn right
    */
    protected function sterzoDestro(){
            if(keyLock==false){
                keyLock = true;
                try{
                    physic.setRotation(numero,-velocitaRotazione);
                }catch(e:Exception){
                    println("server no found in move engine");
                }
            }
    }

    /*
    *   Send to server call to turn left
    */
    protected function sterzoSinistro(){
            if(keyLock == false){
                keyLock = true;
                try{
                    physic.setRotation(numero,velocitaRotazione);
                }catch(e:Exception){
                    println("server no found in move engine");
                }
            }
    }

    /*
    *   Send call to server for accellerate
    */
    public function accellera(){
        try{
            physic.accellera(numero,par_forza);
        }catch(e:Exception){
            println("server no found in move engine");
        }
    }

 /*
 *  Command key event
 */
 override public var onKeyPressed = function( e: KeyEvent ):Void {

        if (e.code == KeyCode.VK_ESCAPE) {
            var scene = this.scene as menu.GameSceneTrack;
            println(scene);
            scene.showPopUpExit();
        }

        if (e.code == KeyCode.VK_UP) {
            if(press==false){
                press=true;
                accellera();
                //println("up");
                
                var scene:menu.GameSceneTrack = this.scene as menu.GameSceneTrack;
                track = scene.track;
                track.zoomOut();
            }
            
        }
        else if (e.code == KeyCode.VK_DOWN) {
            physic.brake(15,util.MoveEngine.moveEngine.numero);
        }
        else if (e.code == KeyCode.VK_RIGHT) {
            this.sterzoDestro();
        }
        else if (e.code == KeyCode.VK_LEFT) {
            this.sterzoSinistro();
        }
    }

    protected function ritornaOrigine(){
        physic.setRotationStop(numero);
        keyLock = false;
    }
    
    override public var onKeyReleased = function (e : KeyEvent) : Void
    {
        if (e.code == KeyCode.VK_UP) {
            this.accelleraStop();

                var scene:menu.GameSceneTrack = this.scene as menu.GameSceneTrack;
                track = scene.track;
                track.zoomIn();
        }
        else if (e.code == KeyCode.VK_DOWN) {
            physic.changeDamping(physic.getDamping(util.MoveEngine.moveEngine.numero),util.MoveEngine.moveEngine.numero);
        }
        else if (e.code == KeyCode.VK_LEFT or e.code == KeyCode.VK_RIGHT) {
            ritornaOrigine();
        }

    }

    protected function accelleraStop(){
        //println("accellera stop");
        //accellerazione.stop();
        physic.accelleraStop(numero);
        press = false;
        //forcesToApply = [];
    }

    override public function create():Node{
        Group{};
    }

    public function setUserCar(numCar:Integer){
        moveEngine.numero = numCar;
    }

    public function setGameEngineToMoveEngine(){
        moveEngine.physic = util.RemoteObject.remoteObject;
    }

    public function getNumber():Integer{
        return numero;
    }

    /*
    *   Run updating phyisic engine
    */
    public function startEngine(){
        if (updateServer.running == false){
            updateServer.playFromStart();
        }
    }

    /*
    *   Run updating phyisic engine
    */
    public function stopEngineWithError(){
        updateServer.stop();
        var stage = this.scene.stage as menu.GameStage;
        stage.showMenu();
        println(stage);
        println("show menu");
    }


    /*
    *   Run updating phyisic engine
    */
    public function stopEngine(){
            updateServer.stop();
    }

    /*
    *   Thread for update server
    */
    var updateServer = Timeline {
        repeatCount: Timeline.INDEFINITE
        keyFrames: KeyFrame {
            time: .03s
            action: function() {
                util.RemoteObject.remoteObject.update();
            }
        }
    };
}
