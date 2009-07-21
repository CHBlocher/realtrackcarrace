/*
 * positionList.fx
 *
 * Created on 6-mag-2009, 11:12:07
 */

package positionList;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.Node;
import positionList.User;


/**
 * @author Diego Benna
 *  Manage desktop position
 */
 public class PositionList extends CustomNode {

     var users:User[] = [];
     var cont_active = 0;

     init{
         var user_index = 0;
         var users_array = util.RemoteObject.remoteObject.getReadyUserArray();
         cont_active = 0;

         while(user_index<users_array.size()){
             // if is a player active
             if(users_array[user_index]==true){
                // insert in desktop
                 insert User {
                    image_url : "car{util.RemoteObject.remoteObject.getCarStyle(user_index)+1}"
                    user_name : "{util.RemoteObject.remoteObject.getUserName(user_index)}"
                    translateY: 55*cont_active
                 } into users;
                // increment active
                cont_active++;
             }

             // increment in array
             user_index++;
         }
     }


     var group = bind Group {
         };

     public override function create(): Node {
         insert users into group.content;
         group.translateX = 10;
         group.translateY = 10;
         return group;
     }

     /*
     *  Update all position
     */
     public function update(pos:Integer[]){
        println("update!!!");
        // new position array
        var position_array = util.RemoteObject.remoteObject.getPositions();
        var position_index = 0;

        while(position_index<this.cont_active){
            var num =position_array[position_index];
            this.users[position_index].user_name = "{menu.MenuMultiplayerRunningServer.usersName[num]}";
            this.users[position_index].actual_image = Image {
                 url: "{__DIR__}images/car{util.RemoteObject.remoteObject.getCarStyle(position_array[position_index])+1}.jpg"
             }
            position_index++;
        }

     }
 }


