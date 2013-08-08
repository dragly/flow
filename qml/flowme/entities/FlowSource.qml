import QtQuick 2.0
import QtQuick.Particles 2.0

import "../stringifier.js" as Stringifier

FlowEntity {
    id: flowSourceRoot
    property alias flowTargetX: flowTarget.x
    property alias flowTargetY: flowTarget.y
    property alias emitRate: emitter.emitRate
    property alias magnitude: emitDirection.magnitude
    width: level.width * 0.05
    height: width

    function stringify() {
        var properties = ["!flowTargetX", "!flowTargetY", "emitRate", "|magnitude"];
        var data = "";
        data += "    FlowSource {\n";
        data += stringifyDefaults();
        data += Stringifier.stringifyProperties(flowSourceRoot, properties, false);
        data += "    }\n";
        return data;
    }

    Rectangle {
        anchors.fill: parent
        radius: width/2
        color: "blue"

        Rectangle {
            visible: level.editMode
            property real ratio: Math.abs(emitDirection.magnitude) / 1000
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -parent.width / 3
            width: ratio * parent.width
            height: ratio * parent.height
            radius: width/2
            color: "red"
        }

        Rectangle {
            visible: level.editMode
            property real ratio: Math.abs(emitter.emitRate) / 200
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: parent.width / 3
            width: ratio * parent.width
            height: ratio * parent.height
            radius: width/2
            color: "green"
        }
    }

    Emitter {
        id: emitter
        system: parent.system
        anchors.centerIn: parent
        lifeSpan: 12000
        lifeSpanVariation: 5000
        emitRate: 30
        size: level.width * 0.02
        sizeVariation: size / 10
        endSize: level.width * 0.01
        velocity: TargetDirection {
            id: emitDirection
            //            angleVariation: 180
            targetItem: flowTarget
    //                proportionalMagnitude: true
            magnitude: 250
            magnitudeVariation: 0
            targetVariation: 20
        }
    }

    Rectangle {
        id: flowTarget
        enabled: level.editMode
        visible: level.editMode
        x: parent.width * 6
        y: parent.height / 2 - height / 2
        color: "lightgreen"
        width: 20
        height: 20
        MouseArea {
            drag.target: flowTarget
            anchors.fill: flowTarget

            propagateComposedEvents: false

            onPositionChanged: {

            }
        }
    }

    MouseArea {
        anchors.fill: parent
        enabled: level.editMode
        onWheel: {
            if(wheel.modifiers & Qt.ShiftModifier) {
                if(wheel.angleDelta.y > 0) {
                    emitter.emitRate += 2
                } else {
                    emitter.emitRate -= 2
                }
                emitter.emitRate = Math.abs(emitter.emitRate)
            } else {
                if(wheel.angleDelta.y > 0) {
                    emitDirection.magnitude += 10
                } else {
                    emitDirection.magnitude -= 10
                }
                emitDirection.magnitude = Math.abs(emitDirection.magnitude)
            }
        }
    }
}
