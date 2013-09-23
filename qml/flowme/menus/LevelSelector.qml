import QtQuick 2.0

Item {
    id: levelSelectorRoot

    width: 100
    height: 62

    signal selectedLevel(string source)

    Rectangle {
        anchors.fill: parent
    }

    VisualItemModel {
        id: worldsModel
        Rectangle {
            width: levelSelectorRoot.width
            height: levelSelectorRoot.height
            color: "blue"

            ListModel {
                id: levelModel
                ListElement {
                    name: "1"
                    source: "TestLevel"
                }
                ListElement {
                    name: "2"
                    source: "TestLevel2"
                }
            }

            GridView {
                model: levelModel
                anchors {
                    fill: parent
                    leftMargin: parent.width * 0.2
                    rightMargin: parent.width * 0.2
                    bottomMargin: parent.width * 0.1
                    topMargin: parent.width * 0.1
                }

                delegate: Rectangle {
                    width: 100
                    height: 100
                    color: "white"
                    Text {
                        text: model.name
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            levelSelectorRoot.selectedLevel(model.source)
                        }
                    }
                }
            }
        }
        Rectangle {
            width: levelSelectorRoot.width
            height: levelSelectorRoot.height
            color: "green"
        }
        Rectangle {
            width: levelSelectorRoot.width
            height: levelSelectorRoot.height
            color: "yellow"
        }
    }

    ListView {
        id: worldsView
        model: worldsModel
        orientation: ListView.Horizontal
        anchors.fill: parent
        snapMode: ListView.SnapOneItem
    }

//    Rectangle {
//        color: "yellow"
//        width: 100
//        height: width
//        x: point1.x
//        y: point1.y
//    }

//    MouseArea {
//        property bool isDragging

//    }
}
