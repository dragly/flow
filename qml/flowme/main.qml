import QtQuick 2.0
import "menus"

/* TODO LIST
  * Main menu
  * Level selector
  x Attractors / rotators
  x Divergers
  x Targets
  x Emitters
  x Particle system
  * Read level from file
  * Save level to file
  * Level editor mode
*/

Rectangle {
    id: mainRoot
    width: 1280
    height: 800
    color: "black"
    state: "main"

    Keys.onPressed: {
        if(event.key === Qt.Key_R && event.modifiers & Qt.ControlModifier) {
            var prevLevel = levelLoader.source
            levelLoader.source = ""
            levelLoader.source = prevLevel
        }
    }

    Loader {
        id: levelLoader
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        opacity: 0
        enabled: false

        focus: true
    }

    MainMenu {
        id: mainMenu
        anchors.fill: parent
        opacity: 0
        enabled: false
        onSelectedLevel: {
//            if(levelLoader.item !== null) {
//                levelLoader.item.pause()
//            }
            levelLoader.source = ""
            levelLoader.source = "levels/" + source + ".qml"
            mainRoot.state = "game"
        }
    }

    states: [
        State {
            name: "main"
            PropertyChanges {
                target: mainMenu
                opacity: 1
                enabled: true
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: levelLoader
                opacity: 1
                enabled: true
            }
        }
    ]
}
