/*
 * CreateTrackManager.fx
 *
 * Created on 19-mag-2009, 14:58:53
 */

package track;import java.lang.Math;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;
import javafx.scene.shape.PathElement;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import track.CheckPoint;
import track.Point;
import track.SegmentLayout;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.transform.Rotate;

/**
 * @author Diego Benna
 */

public class CreateTrackManager {

    public var points:Point[] = [];

    var modifiedPoints:Point[] = [];
    
    public-init var zoom:Number = 1;

    var firstPoint:Point;

    public var specialPoint = menu.MenuMultiPlayer.points;

    /*
    *   Init all points
    */
    public function initPoints(){

        /*
        * Salvo tutti i punti originali (allPointsTrack) dentro l'array originalPoints
        */
        //println("original");
        var i = 0;
        while(i<menu.MenuCreateTrack.allPointsTrack.size()){
            insert menu.MenuMultiPlayer.allPointsTrack[i] into originalPoints;
            i++;
        }

        /*
        *   Inserisco i punti speciali
        *   E inizializzo al centro il punto iniziale
        */
        var index = 0;
        var index_special = 1;
        firstPoint = points[0];
        


        while(index<points.size()-1){
            //println("spx:{specialPoint[index_special].x} spy:{specialPoint[index_special].y}  {points[index].x} {points[index+1].x}");
            if(
                ((specialPoint[index_special].x <= points[index].x) and (specialPoint[index_special].x >= points[index+1].x) and
                    (((specialPoint[index_special].y <= points[index].y) and (specialPoint[index_special].y >= points[index+1].y)) or 
                    ((specialPoint[index_special].y >= points[index].y) and (specialPoint[index_special].y <= points[index+1].y)))
                ) or
                ((specialPoint[index_special].x >= points[index].x) and (specialPoint[index_special].x <= points[index+1].x) and 
                    (((specialPoint[index_special].y <= points[index].y) and (specialPoint[index_special].y >= points[index+1].y)) or 
                    ((specialPoint[index_special].y >= points[index].y) and (specialPoint[index_special].y <= points[index+1].y)))
                ) and  index_special<specialPoint.size()
            )
            {
                //println("compreso tra le x e y");
                if(points[index].x != specialPoint[index_special].x and points[index].y != specialPoint[index_special].y){
                    insert Point{
                        x: (points[index].x - firstPoint.x)*zoom + 495,
                        y: (points[index].y - firstPoint.y)*zoom + 425,
                    } into modifiedPoints;
                }
                insert Point{
                    x: (specialPoint[index_special].x - firstPoint.x)*zoom + 495,
                    y: (specialPoint[index_special].y - firstPoint.y)*zoom + 425,
                    special:true
                } into modifiedPoints;
                index_special++;
            }else{
                insert Point{
                    x: (points[index].x - firstPoint.x)*zoom + 495,
                    y: (points[index].y - firstPoint.y)*zoom + 425,
                } into modifiedPoints;
            }

            index++;
        }

        index = 0;
        while(index < modifiedPoints.size()-1){
            if((Math.abs(modifiedPoints[index].x - modifiedPoints[index+1].x)<140 or Math.abs(modifiedPoints[index].y - modifiedPoints[index+1].y)<140) and modifiedPoints[index+1].special==false){
                delete modifiedPoints[index+1] from modifiedPoints;
                //println("ELIMINATO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            }else{
                index++;
            }
        }
    }

    /*
    *   Print all points
    */
    public function printPoints(){
        var index = 0;
        var firstPoint = points[1];
        while(index<modifiedPoints.size()){
            //println("{modifiedPoints[index].x},{modifiedPoints[index].y}");
            index++;
        }
    }

    /*
    *   Print all points
    */
    public function getModifiedPoints():Point[]{
        return this.modifiedPoints;
    }

    /*
    *   Creo tutti i segmenti dall'array dei punti
    */
    function createTrack(points:Point[]):Path[]{
        var elements:PathElement[] = [
        ];

        insert MoveTo       {        x:  points[0].x,
                                     y:  points[0].y  } into elements;

        var segments:SegmentLayout[] = [];

        var index_segment:Integer = 1;
        while(index_segment<points.size()-1){
            insert         LineTo       {         x:  points[index_segment].x,
                                                  y:  points[index_segment].y } into elements;
            insert SegmentLayout{start_x:points[index_segment].x,start_y:points[index_segment].y,end_x:points[index_segment+1].x,end_y:points[index_segment+1].y} into segments;
            index_segment++;
        }

        var path = Path {
            elements: elements
            strokeWidth:300
            stroke: Color.rgb(51,51,51)
        }

        var path_bordino = Path {
            elements: elements
            strokeWidth:320
            stroke: Color.GRAY
        }

        var path_3 = Path {
            elements: elements
            strokeWidth:600
            stroke: Color.web("#e8af78")
            smooth:false
        }


        var path_line = Path {
            elements: elements
            strokeWidth:7
            stroke: Color.WHITE
            strokeDashArray: [ 20, 150 ]

        }


        return [path_3,path_bordino,path,path_line];
    }



    ////////////////////////////////////////////////////////////////////////


    public var segment_A:SegmentLayout[] = [];
    public var segment_B:SegmentLayout[] = [];

    // array dei segni degli m di tutti i segmenti
    var m_array:Number[] = [];

    // distanza dal punto iniziale
    public-init var delta:Number = 20;


    function createPoint(delta_0:Number, delta_1:Number, index:Integer):Point{
        // find points in array
        var point_0 = points[index+0];
        var point_1 = points[index+1];
        var point_2 = points[index+2];

        var x_0 = point_0.x;
        var y_0 = point_0.y;
        var x_1 = point_1.x;
        var y_1 = point_1.y;
        var x_2 = point_2.x;
        var y_2 = point_2.y;

        // caso estremo capitasse un Nan
         if(x_0 == x_1){
            x_0 = x_0+1;
        }
        if(x_1 == x_2){
            x_2 = x_2+1;
        }
        if(y_0 == y_1){
            y_1 = y_1+1;
        }
        if(y_1 == y_2){
            y_2 = y_2+1
        }

        // trovo la retta del primo segmento index
        println("punti: {x_0},{y_0} {x_1},{y_1}");
        var m_A = (y_1-y_0)/(x_1-x_0);
        var p_A = (delta_0 * Math.sqrt(1+m_A*m_A)-y_0+m_A*x_0)*(-1);
        //println("y={m_A}x+{p_A}");

        // trovo la retta del segmento segmento index+1
        println("punti: {x_1},{y_1} {x_2},{y_2}");
        var m_B = (y_2-y_1)/(x_2-x_1);
        var p_B = (delta_1 * Math.sqrt(1+m_B*m_B)-y_1+m_B*x_1)*(-1);
        //println("y={m_B}x+{p_B}");

        // trovo i punti di intersezione
        var x_inter = (p_A-p_B)/(m_B-m_A);
        var y_inter = m_A*(p_A-p_B)/(m_B-m_A)+p_A;

        println("{x_inter},{y_inter}");

        // inserisco il punto nel desktop
        var point = Point{x:x_inter,y:y_inter};

        /*
        *   if it is a start of street. it is a special border point
        */
        if(point_1.special==true){
            point.special=true;
        }


        return point;
    }


    function createExternalPoint(lato:String, delta:Number):Point[]{
        // trovo tutti i punti di intersezione
        var index = 0;

        var par_delta = delta;
        var segno_delta:Number;
        if(lato=="lato_A"){
            segno_delta = 1.0;
        }else{
            segno_delta = -1.0;
        }


        while(index<points.size()-2){

            // find points in array
            var point_0 = points[index+0];
            var point_1 = points[index+1];
            var point_2 = points[index+2];

            var x_0 = point_0.x;
            var y_0 = point_0.y;
            var x_1 = point_1.x;
            var y_1 = point_1.y;
            var x_2 = point_2.x;
            var y_2 = point_2.y;

        // caso estremo capitasse un Nan
         if(x_0 == x_1){
            x_0 = x_0+1;
        }
        if(x_1 == x_2){
            x_2 = x_2+1;
        }
        if(y_0 == y_1){
            y_1 = y_1+1;
        }
        if(y_1 == y_2){
            y_2 = y_2+1
        }
        
            // status
            var vertical_0:String;
            var horizontal_0:String;
            var vertical_1:String;
            var horizontal_1:String;

            // status
            if(x_0<x_1){
                horizontal_0 = "right";
            }else{
                horizontal_0 = "left";
            }
            if(y_0<y_1){
                vertical_0 = "down";
            }else{
                vertical_0 = "up";
            }
            if(x_1<x_2){
                horizontal_1 = "right";
            }else{
                horizontal_1 = "left";
            }
            if(y_1<y_2){
                vertical_1 = "down";
            }else{
                vertical_1 = "up";
            }

            println("{horizontal_0},{vertical_0} {horizontal_1},{vertical_1}");
            var point:Point;

            if(horizontal_0 == horizontal_1 and vertical_0 == vertical_1){
               if(horizontal_0 == "right" and vertical_0=="down"){
                    point = createPoint(delta*segno_delta, delta*segno_delta, index);
               }
               if(horizontal_0 == "left" and vertical_0=="down"){
                    point = createPoint(-delta*segno_delta, -delta*segno_delta, index);
               }
               if(horizontal_0 == "right" and vertical_0=="up"){
                    point = createPoint(delta*segno_delta, delta*segno_delta, index);
               }
               if(horizontal_0 == "left" and vertical_0=="up"){
                    point = createPoint(-delta*segno_delta, -delta*segno_delta, index);
               }
            }
            if(horizontal_0 != horizontal_1 and vertical_0 == vertical_1){
               if(horizontal_0 == "right" and vertical_0=="down"){
                    point = createPoint(delta*segno_delta, -delta*segno_delta, index);
               }
               if(horizontal_0 == "right" and vertical_0=="up"){
                    point = createPoint(delta*segno_delta, -delta*segno_delta, index);
               }
               if(horizontal_0 == "left" and vertical_0=="up"){
                    point = createPoint(-delta*segno_delta, delta*segno_delta, index);
               }
               if(horizontal_0 == "left" and vertical_0=="down"){
                    point = createPoint(-delta*segno_delta, delta*segno_delta, index);
               }
            }
            if(horizontal_0 != horizontal_1 and vertical_0 != vertical_1){
               if(horizontal_0 == "left" and vertical_0=="down"){
                    point = createPoint(-delta*segno_delta, delta*segno_delta, index);
               }
               if(horizontal_0 == "right" and vertical_0=="up"){
                    point = createPoint(delta*segno_delta, -delta*segno_delta, index);
               }
            }
            if(horizontal_0 == horizontal_1 and vertical_0 != vertical_1){
               if(horizontal_0 == "left" and vertical_0=="up"){
                    point = createPoint(-delta*segno_delta, -delta*segno_delta, index);
               }
               if(horizontal_0 == "right" and vertical_0=="down"){
                    point = createPoint(delta*segno_delta, delta*segno_delta, index);
               }
               if(horizontal_0 == "right" and vertical_0=="up"){
                    point = createPoint(delta*segno_delta, delta*segno_delta, index);
               }
               if(horizontal_0 == "left" and vertical_0=="down"){
                    point = createPoint(-delta*segno_delta, -delta*segno_delta, index);
               }
            }

            if(point.x.toString() != "NaN" or point.y.toString() != "NaN"){
                if(lato=="lato_A"){
                    insert point into points_A;
                }else{
                    insert point into points_B;
                }
            }

            index++;
        }

        if(lato=="lato_A"){
            drawSegment("lato_A");
            return points_A;
        }else{
            drawSegment("lato_B");
            return points_B;
        }
    }


    function drawSegment(lato:String){
        var index = 0;
        var color:Integer;

        var points:Point[];
        if(lato=="lato_A"){
            points = points_A;
            color=1;
        }else{
            points = points_B;
            color=0;
        }


        while(index < points.size()-1){

            var segment = SegmentLayout{
                        strokeWidth:20
                        start_x: points[index].x,
                        start_y: points[index].y,
                        end_x: points[index+1].x,
                        end_y: points[index+1].y,
                        stroke:if(color mod 2 == 0)Color.RED else Color.WHITESMOKE
                    }

                    color++;



            util.RemoteObject.remoteObject.addStaticBox(points[index].x, points[index].y, points[index+1].x, points[index+1].y);

            if(lato=="lato_A")insert segment into segment_A;
            if(lato=="lato_B")insert segment into segment_B;
            index++;
        }
    }


    public var originalPoints:Point[]=[];
    init{
     this.initPoints();
     points = this.getModifiedPoints();
     segments = createTrack(points);
     points_B = createExternalPoint("lato_B",delta);
     points_A = createExternalPoint("lato_A",delta);

    }

    public var segments:Path[];
    public var points_B:Point[];
    public var points_A:Point[];

    var punti = [];//ParserCoordinates.getData();
    //var parsePoint = bind punti;


    public function getFlags():ImageView[]{
        var firstPoint = points_A[0];
        var secondPoint = points_B[0];
        var m = (secondPoint.y - firstPoint.y)/(secondPoint.x - firstPoint.x);
        var rotate = Math.toDegrees(Math.atan(m));

        println(rotate);

        var lastPoint_A = points_A[points_A.size()-2];
        var lastPoint_B = points_B[points_B.size()-2];
        var m_2 = (lastPoint_B.y - lastPoint_A.y)/(lastPoint_B.x - lastPoint_A.x);
        var rotate_2 = Math.toDegrees(Math.atan(m_2));

        println(rotate_2);
        
        var dim = points_B.size()-2;

        var x:Number;
        var y:Number;
        var x_2:Number;
        var y_2:Number;
        if(rotate>0){
            if(points_A[0].x<points_B[0].x){
               x = points_A[0].x;
            }else{
                x = points_B[0].x;
            }
            if(points_A[0].y<points_B[0].y){
               y = points_A[0].y;
            }else{
                y = points_B[0].y;
            }
        }else{
            if(points_A[dim].x<points_B[0].x){
               x = points_A[0].x;
            }else{
                x = points_B[0].x;
            }
            if(points_A[dim].y>points_B[0].y){
               y = points_A[0].y;
            }else{
                y = points_B[0].y;
            }
        }

        if(rotate_2>0){
            if(points_A[dim].x<points_B[dim].x){
               x_2 = points_A[dim].x;
            }else{
                x_2 = points_B[dim].x;
            }
            if(points_A[dim].y<points_B[dim].y){
               y_2 = points_A[dim].y;
            }else{
                y_2 = points_B[dim].y;
            }
        }else{
            if(points_A[dim].x<points_B[dim].x){
               x_2 = points_A[dim].x;
            }else{
                x_2 = points_B[dim].x;
            }
            if(points_A[dim].y>points_B[dim].y){
               y_2 = points_A[dim].y;
            }else{
                y_2 = points_B[dim].y;
            }
        }



        return [ImageView {
                    x:x
                    y:y
                    transforms:[
                        Rotate {    pivotX : x
                                    pivotY : y
                                    angle: rotate
                                }
                    ]
                    image: Image {
                        url: "{__DIR__}images/blackWhite.jpg"
                        width: Math.sqrt(Math.abs(points_A[0].x - points_B[0].x)*Math.abs(points_A[0].x - points_B[0].x)+Math.abs(points_A[0].y - points_B[0].y)*Math.abs(points_A[0].y - points_B[0].y))
                    }
                }
                ImageView {
                    x:x_2
                    y:y_2
                    transforms:[
                        Rotate {
                                pivotX : x_2,
                                pivotY : y_2,
                                angle: rotate_2
                        }
                    ]
                    image: Image {
                        url: "{__DIR__}images/blackWhite.jpg"
                        width: Math.sqrt(Math.abs(points_A[points_B.size()-2].x - points_B[points_B.size()-2].x)*Math.abs(points_A[points_B.size()-2].x - points_B[points_B.size()-2].x)+Math.abs(points_A[points_B.size()-2].y - points_B[points_B.size()-2].y)*Math.abs(points_A[points_B.size()-2].y - points_B[points_B.size()-2].y))
                    }
                }
            ]
    }


    /*
    *   Return all components
    */
    public function getComponents():Group{

        //println(segments);
        Group{
            content:[
                    //segments,
                    segment_A,
                    segment_B,
                    this.getFlags()
            ]
        }
    }

    /*
    *   Return all components
    */
    public function getPath():Path[]{
        segments
    }

    public function getWidth():Number{
        //println("width track: {this.points[points.size()-1].x}");
        return this.points[points.size()-1].x
    }

    public function getHeight():Number{
        //println("height track: {this.points[points.size()-1].y}");
        return this.points[points.size()-1].y
    }

    /*
    *   Return all check points
    */
    public function getCheckPoints():CheckPoint[]{
        var checkPoints:CheckPoint[] = [];
        var index = 0;
        var cont = 2;
        var cpdelta = 100;
        while (index<segment_A.size()){
// or ((Math.abs(menu.MenuCreateTrack.points[cont].x-originalPoints[index].x))<cpdelta or (Math.abs(menu.MenuCreateTrack.points[cont].y-originalPoints[index].y))<cpdelta)
            if((Math.abs(segment_A[index].start_x-segment_A[index+1].start_x)>100 and Math.abs(segment_A[index].start_y-segment_A[index+1].start_y)>100)){

                //println("NUMERO {menu.MenuCreateTrack.points[cont].x} {originalPoints[index].x}");

                if(points[index].special==true)

                {
                    //println("TRAOVATOOOOOOOOOOOOOOOOOOOOOOOOOO");
                    cont++;
                    insert
                    CheckPoint{
                        start_x:segment_A[index].start_x,
                        start_y:segment_A[index].start_y,
                        end_x:segment_B[index].start_x,
                        end_y:segment_B[index].start_y
                        color:Color.GREEN
                        special:true
                    }
                    into checkPoints;
                }else{
                    insert
                    CheckPoint{
                        start_x:segment_A[index].start_x,
                        start_y:segment_A[index].start_y,
                        end_x:segment_B[index].start_x,
                        end_y:segment_B[index].start_y
                    }
                    into checkPoints;
                }

                
            }
            index++;
        }

        index = 0;
        var decrease = checkPoints.size()-1;
        while (index<checkPoints.size()){
            checkPoints[index].number = decrease;
            if (decrease > 10){
                checkPoints[index].numero = Text {
                        font : Font {
                            size: 40
                        }
                        smooth:true
                        fill:Color.BLACK
                        x: checkPoints[index].end_x-20,
                        y: checkPoints[index].end_y+15
                        content: decrease.toString()
                    }
                    }else{
                        checkPoints[index].numero = Text {
                        font : Font {
                            size: 40
                        }
                        smooth:true
                        fill:Color.web("#c00000")
                        x: checkPoints[index].end_x-10,
                        y: checkPoints[index].end_y+15

                        content: decrease.toString()
                    }
                    }
            decrease--;
            index++;
        }

        return checkPoints;

    }

    /*
    *   Get car rotation
    */
    public function getCarRotation():Number{
        var firstPoint = points[0];
        var secondPoint = points[1];
        var m = (secondPoint.y - firstPoint.y)/(secondPoint.x - firstPoint.x);
        var rotate = Math.toDegrees(Math.atan(m));
        //println(rotate);
        rotate;
    }




}
