import QtQuick 2.0

Item {
    id: mainMenuRoot

    signal selectedLevel(string source)

    LevelSelector {
        anchors.fill: parent
        onSelectedLevel: {
            mainMenuRoot.selectedLevel(source)
        }
    }
}
