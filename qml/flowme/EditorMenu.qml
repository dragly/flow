import QtQuick 2.0

import "entities"

Rectangle {
    id: editorMenu

    property string source: entityList.currentItem.myModel.source
    property real frictionTreshold: 100

    signal saveClicked
    signal loadClicked

    function toggle() {
        if(state === "active") {
            state = "inactive"
        } else {
            state = "active"
        }
    }

    state: "inactive"
    z: 1000

    width: parent.width * 0.1
    anchors {
        bottom: parent.bottom
        left: parent.left
        top: parent.top
    }

    ListModel {
        id: entityModel
        ListElement {
            source: "FlowSource.qml"
            text: "Source"
        }
        ListElement {
            source: "FlowAttractor.qml"
            text: "Attractor"
        }
        ListElement {
            source: "FlowTarget.qml"
            text: "Target"
        }
    }

    Column {
        anchors.fill: parent

        Rectangle {
            id: saveButton

            width: parent.width
            height: parent.width / 2

            color: "yellow"
            Text {
                anchors.centerIn: parent
                text: "Save"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    saveClicked()
                }
            }
        }
        Text {
            id: titleText
            width: parent.width
            text: qsTr("Entities:")
            font.pixelSize: editorMenu.height * 0.03
            font.weight: Font.Light
        }

        ListView {
            id: entityList
            width: parent.width
            height: width * 0.2 * count
            model: entityModel
            delegate: Text {
                id: delegate
                property var myModel: model
                width: entityList.width
                height: entityList.height / entityList.count
                text: model.text
                verticalAlignment: Text.AlignVCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        entityList.currentIndex = index
                    }
                }
            }
            highlight: Rectangle {
                width: entityList.width
                color: "grey"
            }
        }

        Rectangle {
            id: frictionScale

            width: parent.width
            height: parent.width / 2

            color: "yellow"
            Text {
                anchors.centerIn: parent
                text: editorMenu.frictionTreshold
            }
            MouseArea {
                anchors.fill: parent
                onWheel: {
                    if(wheel.angleDelta.y > 0) {
                        editorMenu.frictionTreshold += 10
                    } else {
                        editorMenu.frictionTreshold -= 10
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "inactive"
            PropertyChanges {
                target: editorMenu
                anchors.leftMargin: -editorMenu.width
            }
        }

    ]

    transitions: [
        Transition {
            NumberAnimation {
                target: editorMenu
                property: "anchors.leftMargin"
                easing.type: Easing.InOutQuad
            }
        }
    ]
}
