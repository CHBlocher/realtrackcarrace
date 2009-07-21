/*
 * CarLayout.fx
 *
 * Created on 15-apr-2009, 16:10:08
 */

package track;
import java.lang.Math;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import track.SegmentLayout;


/**
 * @author Diego Benna
 */

public class SegmentLayout extends CustomNode {
    
    public-init var start_x:Number;
    public-init var end_x:Number;
    public-init var start_y:Number;
    public-init var end_y:Number;
    public-init var stroke = Color.BLACK; // colore linea
    public var strokeWidth = 300;

    init{
        
    }




    var border = Line {
        startX: start_x, startY: start_y
        endX: end_x, endY: end_y
        strokeWidth: strokeWidth
        stroke: stroke
        cache:true
        //smooth:false
    }

    var group = Group{
        content:[
            border,
        ]
    }


    override public function create() : Node {
        group;
    }

//<Modifica Alberto>
    //Returns an array of SegmentLayout that represent the border of the track
    public function getColouredBorder(): SegmentLayout[]{
        var color = stroke;
        var borders: SegmentLayout[];
        var m;
        if(end_x - start_x != 0){
            m = (end_y - start_y)/(end_x - start_x);}
        else{
            m = 0;
            }
        var q = end_y - m * end_x;
        var first_x = start_x;
        var first_y = start_y;
        var second_x = end_x;
        var second_y = end_y;
        var n = Math.rint(Math.sqrt((end_x - start_x)*(end_x - start_x) + (end_y -
        start_y)*(end_y - start_y))/800); //diminuendo il numero aumenta la frequenza del cambio di colore, il mio
        //pc sopporta al massimo 600, il tuo forse arriva piÃ¹ in basso, prova un po' ;-)
        print("inizio del segmento: " );
        print(first_x);
        print(" ");
        print(first_y);

        print("fine del segmento: " );
        print(second_x);
        print(" ");
        println(second_y);
        var i = 0;
        if(end_x - start_x !=0){
            while(i < n){
                second_x = (second_x + first_x)/2;
                i++;
            }
            var delta_x = second_x - first_x;
            second_y = m * second_x + q;
            insert SegmentLayout{
                        strokeWidth:6
                        start_x: first_x,
                        start_y: first_y,
                        end_x: second_x,
                        end_y: second_y,
                        stroke:color
                    } into borders;

            i = 1;
            while(second_x != end_x){
                first_x = second_x;
                first_y = second_y;
                if(second_x + delta_x >= end_x){
                    second_x = end_x;
                    second_y = end_y;
                }
                else{
                    second_x = second_x + delta_x;
                    second_y = m * second_x + q;
                }
                //depending on the initial color, the new segment assumes the opposite color of the previous one

                if(color.equals(Color.RED)){
                    color = Color.WHITESMOKE;
                }
                else{
                    color = Color.RED;
                }



           insert SegmentLayout{
                strokeWidth:6
                start_x: first_x,
                start_y: first_y,
                end_x: second_x,
                end_y: second_y,
                stroke:color
                } into borders;
            i++;
            }
        }
        else{
            while(i < n){
                second_y = (second_y + first_y)/2;
                i++;
            }
            var delta_y = second_y - first_y;
            second_y = m * second_x + q;
            insert SegmentLayout{
                        strokeWidth:6
                        start_x: first_x,
                        start_y: first_y,
                        end_x: second_x,
                        end_y: second_y,
                        stroke:Color.RED
                    } into borders;
            i = 1;
            while(second_y != end_y){
                first_y = second_y;
                if(second_y + delta_y >= end_y){
                    second_y = end_y;
                }
                else{
                second_y = second_y + delta_y;
                }

                //depending on the initial color, the new segment assumes the opposite color of the previous one
                if(color.equals(Color.RED)){
                    color = Color.WHITESMOKE;
                }
                else{
                    color = Color.RED;
                }


           insert SegmentLayout{
                strokeWidth:6
                start_x: first_x,
                start_y: first_y,
                end_x: second_x,
                end_y: second_y,
                stroke:color
                } into borders;
            i++;
            }
        }
        return borders;
    }
//</Modifica Alberto>





}


