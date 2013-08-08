import QtQuick 2.0
import QtQuick.Particles 2.0

import "../stringifier.js" as Stringifier

FlowEntity {
    id: flowAttractorRoot

    property int strength: 2e6

    width: 50
    height: 50

    function stringify() {
        var properties = ["x", "y", "strength"];
        var data = "";
        data += "    FlowAttractor {\n";
        data += stringifyDefaults();
        data += Stringifier.stringifyProperties(flowAttractorRoot, properties, 2);
        data += "    }\n";
        return data;
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        radius: width/2
        color: draggable ? "yellow" : "grey"
        Rectangle {
            property real ratio: Math.abs(flowAttractorRoot.strength) / 1e7
//            visible: level.editMode
            anchors.centerIn: parent
            width: ratio * parent.width
            height: ratio * parent.height
            radius: width/2
            color: flowAttractorRoot.strength > 0 ? "red" : "blue"
        }
    }

    Attractor {
        id: attractor
        anchors.centerIn: parent
        width: parent.width * 6
        height: parent.height * 6
        pointX: width / 2
        pointY: height / 2
        system: parent.system

        strength: flowAttractorRoot.strength

        affectedParameter: Attractor.Acceleration
        proportionalToDistance: Attractor.InverseQuadratic
    }

    Age {
        anchors.fill: parent
        system: parent.system
    }

    MouseArea {
        anchors.fill: parent
        enabled: level.editMode
        onWheel: {
            if(wheel.angleDelta.y > 0) {
                flowAttractorRoot.strength += 1e6
            } else {
                flowAttractorRoot.strength -= 1e6
            }
        }
    }
}
