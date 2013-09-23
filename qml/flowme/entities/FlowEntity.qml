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

    onRelXChanged: {
        if(level) {
            var maxRelX = 1 - entityRoot.width / level.width
            if(relX > maxRelX) {
                relX = maxRelX
            } else if(relX < 0) {
                relX = 0
            }
        }
    }

    onRelYChanged: {
        if(level) {
            var maxRelY = (level.height - entityRoot.height) / level.width
            if(relY > maxRelY) {
                relY = maxRelY
            } else if(relY < 0) {
                relY = 0
            }
        }
    }

    width: level.width * 0.05
    height: width

    MouseArea {
        property bool isDragging
        property int lastMouseX
        property int lastMouseY

        z: 100

//        drag.minimumX: 0
//        drag.minimumY: 0
//        drag.target: entityRoot._trulyDraggable ? parent : undefined
        anchors.fill: parent

        onPressed: {
            if(entityRoot._trulyDraggable) {
                isDragging = true
                lastMouseX = mouse.x;
                lastMouseY = mouse.y;
            }
        }

        onReleased: {
            isDragging = false
        }

        onPositionChanged: {
            if(isDragging) {
                var xDiff = mouse.x - lastMouseX;
                var yDiff = mouse.y - lastMouseY;
                var relXDiff = xDiff / level.width;
                var relYDiff = yDiff / level.width;

                entityRoot.relX += relXDiff;
                entityRoot.relY += relYDiff;

                lastMouseX = mouse.x - relXDiff * level.width;
                lastMouseY = mouse.y - relYDiff * level.width;
            }
        }

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
