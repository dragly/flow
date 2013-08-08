import QtQuick 2.0

Rectangle {
    width: 100
    height: 62
    color: "black"
    Loader {
        id: levelLoader
        anchors.fill: parent
        source: "levels/TestLevel.qml"
    }
}
