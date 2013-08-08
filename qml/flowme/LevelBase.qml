import QtQuick 2.0
import QtQuick.Particles 2.0

import "stringifier.js" as Stringifier

Item {
    id: levelRoot
    property int score: 0
    property int frictionTreshold: 150
    property bool editMode: false
    property ParticleSystem system: particleSystem
    width: 100
    height: 62
    focus: true

    function save() {
        var properties = ["frictionTreshold"];
        var data = "LevelBase {\n";
        data += Stringifier.stringifyProperties(levelRoot, properties, 1);
        for(var i in children) {
            var child = children[i];
            if(child.isEntity === true) {
                data += child.stringify();
            }
        }
        data += "}";
        console.log(data);
    }

    ParticleSystem {
        id: particleSystem
        anchors.fill: parent
    }

    ImageParticle {
        id: defaultParticle
        system: particleSystem
        sprites: [
            Sprite {
                name: "testsprite"
                source: "images/particle-small.png"
            }
        ]
        //            entryEffect: ImageParticle.Scale
    }

    Friction {
        id: friction
        system: particleSystem
        factor: 1e18
        threshold: levelRoot.frictionTreshold
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if(mouse.button === Qt.LeftButton) {
                var componentSource = "entities/" + editorMenu.source
                var component = Qt.createComponent(componentSource)
                var properties = {system: levelRoot.system, level: levelRoot}
                var object = component.createObject(levelRoot, properties)
                object.x = mouse.x - object.width / 2
                object.y = mouse.y - object.height / 2
            } else if(mouse.button === Qt.RightButton) {
                if(editMode) {
                    var object = levelRoot.childAt(mouse.x, mouse.y);
                    if(object.isEntity === true) {
                        object.destroy();
                    }
                }
            }
        }
    }

    EditorMenu {
        id: editorMenu
        onFrictionTresholdChanged: {
            levelRoot.frictionTreshold = frictionTreshold
        }
        onSaveClicked: {
            save()
        }
    }

    Text {
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: parent.width * 0.05
        text: "Score: " + parent.score
        color: "white"
    }

    Keys.onPressed: {
        if(event.key === Qt.Key_E) {
            if(editMode) {
                editorMenu.toggle()
            }
        }
        if(event.key === Qt.Key_W) {
            editMode = !editMode
            if(!editMode && editorMenu.state === "active") {
                editorMenu.state = "inactive"
            }
        }
    }
}
