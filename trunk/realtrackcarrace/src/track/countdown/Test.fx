/*
 * Test.fx
 *
 * Created on 6-mag-2009, 18:39:17
 */

package track.countdown;

import javafx.stage.Stage;
import javafx.scene.Scene;


/**
 * @author Diego
 */
var count_down = CountDown{}
Stage {
    title: "Application title"
    width: 990
    height: 850
    scene: Scene {
        content: [
          count_down
        ]
    }
}

count_down.start();