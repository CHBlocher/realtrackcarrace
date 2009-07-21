/*
 * CreateTrackTest.fx
 *
 * Created on 16-mag-2009, 09:24:16
 */

package track;

import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.stage.Stage;
import track.Point;
import javafx.scene.shape.Line;
import javafx.scene.shape.Rectangle;


/**
 * @author Diego
 */

 /*
 *  Creo l'array dei punti iniziali
 */
var points:Point[] = [

Point{x:4547128.0, y:1160494.0}
Point{x:4547141.0, y:1160488.0}
Point{x:4547135.0, y:1160465.0}
Point{x:4547119.0, y:1160449.0}
Point{x:4547089.0, y:1160492.0}
Point{x:4547058.0, y:1160549.0}
Point{x:4547053.0, y:1160564.0}
Point{x:4547038.0, y:1160628.0}
Point{x:4547019.0, y:1160711.0}
Point{x:4547012.0, y:1160749.0}
Point{x:4546917.0, y:1161048.0}
Point{x:4546886.0, y:1161150.0}
Point{x:4546896.0, y:1161152.0}
Point{x:4546919.0, y:1161152.0}
Point{x:4546967.0, y:1161149.0}
Point{x:4547163.0, y:1161128.0}
Point{x:4547343.0, y:1161112.0}
Point{x:4547381.0, y:1161110.0}
Point{x:4547396.0, y:1161107.0}
Point{x:4547471.0, y:1161100.0}
Point{x:4547525.0, y:1161089.0}
Point{x:4547612.0, y:1161062.0}
Point{x:4547666.0, y:1161042.0}
Point{x:4547747.0, y:1161002.0}
Point{x:4547829.0, y:1160948.0}
Point{x:4547867.0, y:1160919.0}
Point{x:4547900.0, y:1160889.0}
Point{x:4547959.0, y:1160828.0}
Point{x:4547982.0, y:1160797.0}
Point{x:4548012.0, y:1160751.0}
Point{x:4548079.0, y:1160628.0}
Point{x:4548088.0, y:1160610.0}
Point{x:4548140.0, y:1160474.0}
Point{x:4548167.0, y:1160421.0}
Point{x:4548192.0, y:1160385.0}
Point{x:4548265.0, y:1160296.0}
Point{x:4548293.0, y:1160258.0}
Point{x:4548356.0, y:1160183.0}
Point{x:4548378.0, y:1160153.0}
Point{x:4548392.0, y:1160138.0}
Point{x:4548408.0, y:1160125.0}
Point{x:4548441.0, y:1160111.0}
Point{x:4548591.0, y:1160081.0}
Point{x:4548623.0, y:1160076.0}
Point{x:4548729.0, y:1160053.0}
Point{x:4548758.0, y:1160042.0}
Point{x:4548768.0, y:1160034.0}
Point{x:4548786.0, y:1160006.0}
Point{x:4548794.0, y:1159979.0}
Point{x:4548800.0, y:1159948.0}
Point{x:4548818.0, y:1159881.0}
Point{x:4548839.0, y:1159832.0}
Point{x:4548854.0, y:1159801.0}
Point{x:4548864.0, y:1159784.0}
Point{x:4548875.0, y:1159768.0}
Point{x:4548911.0, y:1159725.0}
Point{x:4548953.0, y:1159679.0}
Point{x:4549030.0, y:1159609.0}
Point{x:4549042.0, y:1159595.0}
Point{x:4549096.0, y:1159521.0}
Point{x:4549119.0, y:1159487.0}
Point{x:4549355.0, y:1159120.0}
Point{x:4549378.0, y:1159088.0}
Point{x:4549412.0, y:1159054.0}
Point{x:4549428.0, y:1159042.0}
Point{x:4549459.0, y:1159025.0}
Point{x:4549488.0, y:1159016.0}
Point{x:4549562.0, y:1159001.0}
Point{x:4549583.0, y:1158993.0}
Point{x:4549594.0, y:1158986.0}
Point{x:4549602.0, y:1158979.0}
Point{x:4549623.0, y:1158953.0}
Point{x:4549642.0, y:1158925.0}
Point{x:4549673.0, y:1158873.0}
Point{x:4549697.0, y:1158829.0}
Point{x:4549716.0, y:1158786.0}
Point{x:4549731.0, y:1158747.0}
Point{x:4549758.0, y:1158631.0}
Point{x:4549768.0, y:1158565.0}
Point{x:4549775.0, y:1158532.0}
Point{x:4549804.0, y:1158435.0}
Point{x:4549930.0, y:1158127.0}
Point{x:4549949.0, y:1158077.0}
Point{x:4549973.0, y:1158004.0}
Point{x:4550056.0, y:1157784.0}
Point{x:4550072.0, y:1157752.0}
Point{x:4550124.0, y:1157664.0}
Point{x:4550164.0, y:1157588.0}
Point{x:4550250.0, y:1157408.0}
Point{x:4550333.0, y:1157226.0}
Point{x:4550399.0, y:1157096.0}
Point{x:4550426.0, y:1157027.0}
Point{x:4550441.0, y:1156997.0}
Point{x:4550451.0, y:1156989.0}
Point{x:4550478.0, y:1156980.0}
Point{x:4550515.0, y:1156972.0}
Point{x:4550539.0, y:1156964.0}
Point{x:4550564.0, y:1156959.0}
Point{x:4550590.0, y:1156957.0}
Point{x:4550633.0, y:1156951.0}
Point{x:4550658.0, y:1156942.0}
Point{x:4550949.0, y:1156794.0}
Point{x:4550965.0, y:1156784.0}
Point{x:4551044.0, y:1156704.0}
Point{x:4551070.0, y:1156682.0}
Point{x:4551201.0, y:1156598.0}
Point{x:4551221.0, y:1156586.0}
Point{x:4551239.0, y:1156579.0}
Point{x:4551267.0, y:1156575.0}
Point{x:4551316.0, y:1156575.0}
Point{x:4551365.0, y:1156578.0}
Point{x:4551420.0, y:1156587.0}
Point{x:4551524.0, y:1156601.0}
Point{x:4551570.0, y:1156598.0}
Point{x:4551642.0, y:1156585.0}
Point{x:4551661.0, y:1156580.0}
Point{x:4551665.0, y:1156577.0}
Point{x:4551668.0, y:1156579.0}
Point{x:4551684.0, y:1156578.0}
Point{x:4551705.0, y:1156570.0}
Point{x:4551710.0, y:1156567.0}
Point{x:4551718.0, y:1156558.0}
Point{x:4551725.0, y:1156559.0}
Point{x:4551737.0, y:1156552.0}
Point{x:4551822.0, y:1156514.0}
Point{x:4551964.0, y:1156460.0}
Point{x:4552105.0, y:1156418.0}
Point{x:4552184.0, y:1156397.0}
Point{x:4552277.0, y:1156369.0}
Point{x:4552305.0, y:1156362.0}
Point{x:4552332.0, y:1156360.0}
Point{x:4552340.0, y:1156363.0}
Point{x:4552409.0, y:1156371.0}
Point{x:4552441.0, y:1156371.0}
Point{x:4552506.0, y:1156360.0}
Point{x:4552545.0, y:1156350.0}
Point{x:4552583.0, y:1156339.0}
Point{x:4552660.0, y:1156309.0}
Point{x:4552698.0, y:1156300.0}
Point{x:4552772.0, y:1156298.0}
Point{x:4552920.0, y:1156301.0}
Point{x:4552935.0, y:1156299.0}
Point{x:4553006.0, y:1156284.0}
Point{x:4553099.0, y:1156260.0}
Point{x:4553199.0, y:1156222.0}
Point{x:4553230.0, y:1156207.0}
Point{x:4553307.0, y:1156143.0}
Point{x:4553336.0, y:1156116.0}
Point{x:4553420.0, y:1156031.0}
Point{x:4553465.0, y:1155985.0}
Point{x:4553509.0, y:1155937.0}
Point{x:4553591.0, y:1155855.0}
Point{x:4553779.0, y:1155713.0}
Point{x:4553787.0, y:1155706.0}
Point{x:4553870.0, y:1155603.0}
Point{x:4553999.0, y:1155486.0}
Point{x:4554022.0, y:1155470.0}
Point{x:4554040.0, y:1155461.0}
Point{x:4554062.0, y:1155444.0}
Point{x:4554085.0, y:1155413.0}
Point{x:4554102.0, y:1155373.0}
Point{x:4554119.0, y:1155315.0}
Point{x:4554125.0, y:1155315.0}
Point{x:4554132.0, y:1155310.0}
Point{x:4554136.0, y:1155302.0}
Point{x:4554135.0, y:1155297.0}
Point{x:4554154.0, y:1155302.0}
Point{x:4554188.0, y:1155303.0}
Point{x:4554225.0, y:1155307.0}
Point{x:4554239.0, y:1155311.0}
Point{x:4554268.0, y:1155315.0}
Point{x:4554334.0, y:1155318.0}
Point{x:4554391.0, y:1155324.0}
Point{x:4554436.0, y:1155325.0}
Point{x:4554468.0, y:1155329.0}
Point{x:4554515.0, y:1155328.0}
Point{x:4554542.0, y:1155332.0}
Point{x:4554566.0, y:1155332.0}
Point{x:4554588.0, y:1155359.0}
Point{x:4554606.0, y:1155404.0}
Point{x:4554621.0, y:1155415.0}
Point{x:4554635.0, y:1155419.0}
Point{x:4554698.0, y:1155388.0}
Point{x:4554701.0, y:1155376.0}
Point{x:4554701.0, y:1155369.0}
Point{x:4554694.0, y:1155348.0}
Point{x:4554689.0, y:1155346.0}
Point{x:4554653.0, y:1155341.0}
Point{x:4554566.0, y:1155332.0}
Point{x:4554542.0, y:1155332.0}
Point{x:4554515.0, y:1155328.0}
Point{x:4554512.0, y:1155320.0}
Point{x:4554512.0, y:1155309.0}
Point{x:4554760.0, y:1155057.0}
Point{x:4554777.0, y:1155046.0}
Point{x:4554826.0, y:1154994.0}
Point{x:4554829.0, y:1154998.0}
Point{x:4554835.0, y:1155000.0}
Point{x:4554841.0, y:1154999.0}
Point{x:4554848.0, y:1154994.0}
Point{x:4554849.0, y:1154984.0}
Point{x:4554848.0, y:1154979.0}
Point{x:4554839.0, y:1154972.0}
Point{x:4554833.0, y:1154963.0}
Point{x:4554809.0, y:1154947.0}
Point{x:4554798.0, y:1154947.0}
Point{x:4554798.0, y:1154943.0}


];


var trackManager = track.CreateTrackManager{
    points: points
    zoom: 0.06
}




var rot = trackManager.getCarRotation();

var rectangle_1 = Rectangle {
    x: 455, y: 400
    width: 50, height: 25
    fill: Color.BLACK
    rotate:rot
}

var rectangle_2 = Rectangle {
    x: 455, y: 400
    width: 50, height: 25
    fill: Color.RED
    rotate:rot
}


Stage {
    title: "Application title"
    width: 990
    height: 850
    scene: Scene {
        fill:Color.GREEN
        content: [

            Line {
                startX: 200, startY: 200
                endX: 500, endY: 500
                strokeWidth: 1
                stroke: Color.BLACK
             }
            rectangle_1
            rectangle_2
            trackManager.getComponents()


        ]
    }
}


