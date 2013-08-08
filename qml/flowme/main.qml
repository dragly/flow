import QtQuick 2.0

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
    width: 1280
    height: 800
    color: "black"
    Loader {
        id: levelLoader
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        focus: true
        source: "levels/TestLevel.qml"
    }

    Keys.onPressed: {
        if(event.key === Qt.Key_R && event.modifiers & Qt.ControlModifier) {
            var prevLevel = levelLoader.source
            levelLoader.source = ""
            levelLoader.source = prevLevel
        }
    }
}
