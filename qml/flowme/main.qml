import QtQuick 2.0

/* TODO LIST
  * Main menu
  * Level selector
  * Attractors / rotators
  * Divergers
  * Targets
  * Emitters
  * Particle system
  * Read level from file
  * Level editor mode
*/

Rectangle {
    width: 1280
    height: 800

    GameView {
        anchors.fill: parent
    }
}
