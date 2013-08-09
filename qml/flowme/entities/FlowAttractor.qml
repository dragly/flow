import QtQuick 2.0
import QtQuick.Particles 2.0

import "../stringifier.js" as Stringifier

FlowEntity {
    id: flowAttractorRoot

    property real strength: 2e6

    width: level.width * 0.05
    height: width

    function stringify() {
        var properties = ["|strength"];
        var data = "";
        data += "    FlowAttractor {\n";
        data += stringifyDefaults();
        data += Stringifier.stringifyProperties(flowAttractorRoot, properties, false);
        data += "    }\n";
        return data;
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        radius: width/2
        color: draggable ? "yellow" : "grey"
        Rectangle {
            property real ratio: Math.abs(flowAttractorRoot.strength) / 10
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

        strength: flowAttractorRoot.strength * flowAttractorRoot.level.width * flowAttractorRoot.level.width

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
                flowAttractorRoot.strength += 1
            } else {
                flowAttractorRoot.strength -= 1
            }
        }
    }
}
