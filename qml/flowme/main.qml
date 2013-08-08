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
        anchors.fill: parent
        focus: true
        source: "levels/TestLevel.qml"
    }
}
