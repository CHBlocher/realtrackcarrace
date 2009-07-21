/*
 * Point.fx
 *
 * Created on 18-mag-2009, 15:32:59
 */

package track;

/**
 * @author Diego Benna
 */

/*
*   Class for point
*/

public function printPoints(points:Point[]){
    var index = 0;
    while(index < points.size()){
        println("Point\{x:{points[index].x}, y:{points[index].y}\}");
        index++;
    }

}

public class Point{
    public var x:Number;
    public var y:Number;
    public var special:Boolean=false;
}