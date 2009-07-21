/*
 * MenuInfo.fx
 *
 * Created on 13-mag-2009, 08:52:04
 */

package menu;

import javafx.ext.swing.SwingLabel;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import menu.MenuItem;
import Window.JDLayout.DigLayout;
import Window.JDLayout.Item;
import Window.JDLayout.Row;

/**
 * @author Diego Benna
 */

public class MenuInfo extends MenuItem {

    public override var name ="info";

    // diego diglayout
    var diegoInfo = DigLayout{
        columns:["0"]
        rows:["0","0","0","0","e:15","0","0"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX: 400
        translateY: 90

        margin:0
        fixed:true
        digrows : [
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "Diego Benna"
                                    style :  "font: 19pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }

                            },
                            ]
                     }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "24 years old"
                                    style :  "font: 14pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "Computer science student"
                                    style :  "font: 14pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "(Padua University ITALY)"
                                    style :  "font: 14pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "Leaving in Longare (VI)"
                                    style :  "font: 14pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "diego.benna@gmail.com"
                                    style :  "font: 14pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                    ]
                }

    // diego photo
    var diegoImg = ImageView {
        translateX:270
        translateY:90
        image: Image {
            url: "{__DIR__}images/diego.jpg"
        }
    }

    // alberto diglayout
    var albertoInfo = DigLayout{
        columns:["0"]
        rows:["0","0","0","0","e:15","0","0"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX: 745
        translateY: 90

        margin:0
        fixed:true
        digrows : [
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "Alberto Maran"
                                    style :  "font: 18pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }

                            },
                            ]
                     }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "25 years old"
                                    style :  "font: 13pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "Computer science student"
                                    style :  "font: 13pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "(Padua University ITALY)"
                                    style :  "font: 13pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "Leaving in Bolzano (VI)"
                                    style :  "font: 13pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                     Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"center"
                                item:
                                SwingLabel {
                                    text: "albimara@gmail.com"
                                    style :  "font: 13pt Arial-BOLD;";
                                    foreground : javafx.scene.paint.Color.WHITE;
                                }
                            }
                          ]
                        }
                    ]
                }

    // alberto photo
    var albertoImg = ImageView {
        translateX:615
        translateY:90
        image: Image {
            url: "{__DIR__}images/alberto.jpg"
        }
    }

    // external jar diglayout
    var thanks = DigLayout{
        columns:["e:190", "0"]
        rows:["0","0","e:20","0","0","e:20","0","0"]
        fill:Color.TRANSPARENT
        stroke:Color.TRANSPARENT

        translateX: 270
        translateY: 290

        margin:0
        fixed:true
        digrows : [
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"left"
                                item:
                                Text {
                                    font : Font {
                                        size :  14
                                        name: "Arial"
                                        embolden:true
                                    }
                                    smooth:false
                                    y:14
                                    fill:Color.WHITE
                                    wrappingWidth: 450
                                    textAlignment: TextAlignment.JUSTIFY
                                    content: "DigLayout v2.2.1 for create all form. This object is more user friendly and simple to use for advanced form and layout. DigLayout is a class in JDLayout library by Diego Benna." 
                                }
 
                            },
                        ]
                     }
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"left"
                                item:
                                Text {
                                    font : Font {
                                        size :  14
                                        name: "Arial"
                                        embolden:true
                                    }
                                    smooth:false
                                    y:16
                                    fill:Color.WHITE
                                    wrappingWidth: 450
                                    textAlignment: TextAlignment.JUSTIFY
                                    content: "For more information and download source see official web site:\nhttp://code.google.com/p/diglayout"
                                }

                            },
                        ]
                     }
                   Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"left"
                                item:
                                Text {
                                    font : Font {
                                        size :  14
                                        name: "Arial"
                                        embolden:true
                                    }
                                    smooth:false
                                    y:14
                                    fill:Color.WHITE
                                    wrappingWidth: 450
                                    textAlignment: TextAlignment.JUSTIFY
                                    content: "Phys2D is a 2D physics engine written in Java (1.4). It is essentially a port and rework of the GDC 2006 presentation from Erin Catto plus some extensions listed below. We use this library for physic game engine."
                                }

                            },
                        ]
                     }
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"left"
                                item:
                                Text {
                                    font : Font {
                                        size :  14
                                        name: "Arial"
                                        embolden:true
                                    }
                                    smooth:false
                                    y:16
                                    fill:Color.WHITE
                                    wrappingWidth: 450
                                    textAlignment: TextAlignment.JUSTIFY
                                    content: "For more information and download source see official web site:\nhttp://www.cokeandcode.com/phys2d"
                                }

                            },
                        ]
                     }
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"left"
                                item:
                                Text {
                                    font : Font {
                                        size :  14
                                        name: "Arial"
                                        embolden:true
                                    }
                                    smooth:false
                                    y:14
                                    fill:Color.WHITE
                                    wrappingWidth: 450
                                    textAlignment: TextAlignment.JUSTIFY
                                    content: "MemeFX is an open source library includes a few but powerful components. Check out the new ImageAccordion control and the Gauge control. We use Memefx library for create background effect in menu'."
                                }

                            },
                        ]
                     }
                    Row{
                        items:[
                            Item{
                                valign:"middle"
                                halign:"left"
                                item:
                                Text {
                                    font : Font {
                                        size :  14
                                        name: "Arial"
                                        embolden:true
                                    }
                                    smooth:false
                                    y:16
                                    fill:Color.WHITE
                                    wrappingWidth: 450
                                    textAlignment: TextAlignment.JUSTIFY
                                    content: "For more information and download source see official web site:\nhttp://code.google.com/p/memefx"
                                }

                            },
                        ]
                     }
                    ]
                }

    // diglayout photo
    var digLayoutImg = ImageView {
        translateX:270
        translateY:296
        image: Image {
            url: "{__DIR__}images/diglayout.jpg"
        }
    }

    // diglayout photo
    var phys2dImg = ImageView {
        translateX:270
        translateY:402
        image: Image {
            url: "{__DIR__}images/phys2d.jpg"
        }
    }

    public override function create(): Node {
        group = Group {
 
             content: [
                RectangleBackGround{
                    translateX:260
                    translateY:70
                    width: 335, height: 200
                },
                RectangleBackGround{
                    translateX:605
                    translateY:70
                    width: 335, height: 200
                },
                RectangleBackGround{
                    translateX:260
                    translateY:280
                    width: 680, height: 360
                },
                diegoInfo
                diegoImg
                albertoInfo
                albertoImg
                thanks
                digLayoutImg
                phys2dImg
             ]
         };
         return group;
     }
}
