import QtQuick 2.0
import QtQuick.Particles 2.0

import "../stringifier.js" as Stringifier

FlowEntity {
    id: flowTargetRoot

    property int strength: 2e8

    width: level.width * 0.05
    height: width

    function stringify() {
        var properties = ["!strength"];
        var data = "";
        data += "    FlowTarget {\n";
        data += stringifyDefaults();
        data += Stringifier.stringifyProperties(flowTargetRoot, properties, false);
        data += "    }\n";
        return data;
    }

    Rectangle {
        anchors.fill: parent

        radius: width / 2
        color: "red"
    }

    Attractor {
        id: attractor
        anchors.centerIn: parent
        width: parent.width * 4
        height: parent.height * 4
        pointX: width / 2
        pointY: height / 2
        system: parent.system

        strength: flowTargetRoot.strength

        affectedParameter: Attractor.Acceleration
        proportionalToDistance: Attractor.InverseQuadratic
    }

    Age {
        anchors.fill: parent
        system: parent.system

        onAffected: {
            level.score += 9
        }
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
