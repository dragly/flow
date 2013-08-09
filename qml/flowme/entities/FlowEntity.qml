import QtQuick 2.0
import QtQuick.Particles 2.0

import ".."
import "../stringifier.js" as Stringifier

Item {
    id: entityRoot
    property real relX: 0
    property real relY: 0

    property bool isEntity: true
    property ParticleSystem system: level.system
    property LevelBase level: parent
    property bool draggable: false
    property bool _trulyDraggable: draggable || level.editMode

    function stringify() {
        return "/* This entity has no save method! */\n"
    }

    function stringifyDefaults() {
        var properties = ["relX", "relY", "draggable"];
        var data = Stringifier.stringifyProperties(entityRoot, properties, false);
        return data;
    }

    x: relX * level.width
    y: relY * level.width

    width: level.width * 0.05
    height: width

    MouseArea {
        z: 100

        drag.minimumX: 0
        drag.minimumY: 0
        drag.target: entityRoot._trulyDraggable ? parent : undefined
        anchors.fill: parent

        onClicked: {
            if(mouse.modifiers & Qt.ShiftModifier) {
                if(level.editMode) {
                    draggable = !draggable
                }
            }
        }
    }

    Rectangle {
        visible: level.editMode && draggable
        width: 2
        height: 2
        anchors {
            top: parent.top
        }
        color: "red"
    }
}
