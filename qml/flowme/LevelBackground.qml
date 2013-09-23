import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    width: 100
    height: 62

    Item {
        id: backgroundImage
        anchors.fill: parent
        smooth: true
        Image {
            anchors.fill: parent
            source: "images/background/space.jpg"
        }
        Image {
            anchors.fill: parent
            sourceSize: Qt.size(50,50)
            fillMode: Image.Tile
            source: "images/background/grid.png"
        }
    }

    Rectangle {
        id: displacement
        anchors.fill: backgroundImage
        color: "grey"
        smooth: true
        Item {
            width: 400
            height: 400

//            Image {
//                anchors.fill: parent
//                source: "images/background/NormalMap.jpg"
//                smooth: true
//            }

            ConicalGradient {
                anchors.fill: parent
                angle: 0.0
                gradient: Gradient {
                    GradientStop { position: 0.0; color: Qt.rgba(0.5,1.0,0.5,1) }
                    GradientStop { position: 0.25; color: Qt.rgba(1.0,0.5,0.5,1) }
                    GradientStop { position: 0.5; color: Qt.rgba(0.5,-1.0,0.5,1) }
                    GradientStop { position: 0.75; color: Qt.rgba(-1.0,0.5,0.5,1) }
                    GradientStop { position: 1.0; color: Qt.rgba(0.5,1.0,0.5,1) }
                }
            }

            RadialGradient {
                anchors.fill: parent
                smooth: true
                gradient: Gradient {
                    GradientStop {
                        position: 0.45
                        color: Qt.rgba(0.5,0.5,0.5,1)
                    }
                    GradientStop {
                        position: 0
                        color: Qt.rgba(0.5,0.5,0.5,0)
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                drag.target: parent
            }

        }
    }

    Displace {
        anchors.fill: backgroundImage
        source: backgroundImage
        displacementSource: displacement
        displacement: 0.1
        smooth: true
    }
}
