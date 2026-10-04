import QtQuick
import QtQuick.Window
import Qt.labs.folderlistmodel
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

PanelWindow {
    id: root

    visible: true
    focusable: true
    color: "#0b0e10"

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    exclusionMode: ExclusionMode.Ignore

    property int selectedIndex: 0

    FolderListModel {
        id: wallpapers

        folder: "Qt.resolvedUrl("../../wallpapers")"

        nameFilters: [
            "*.jpg",
            "*.jpeg",
            "*.png",
            "*.webp"
        ]

        showDirs: false
        showFiles: true
        sortField: FolderListModel.Name
        sortReversed: false
    }

    Process {
        id: wallpaperProcess
    }

    Timer {
        id: closeTimer

        interval: 500
        repeat: false

        onTriggered: {
            Qt.quit()
        }
    }

    function applyWallpaper() {
        if (wallpapers.count === 0)
            return

        var wallpaperPath =
            wallpapers.get(selectedIndex, "filePath")

        wallpaperProcess.command = [
            "awww",
            "img",
            wallpaperPath
        ]

        wallpaperProcess.running = true
    }

    function wallpaperName(index) {
        if (wallpapers.count === 0)
            return ""

        var name = wallpapers.get(index, "fileName")

        var dot = name.lastIndexOf(".")

        if (dot > 0)
            name = name.substring(0, dot)

        return name
    }

    Rectangle {
        anchors.fill: parent
        color: "#0b0e10"

        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                margins: 45
            }

            height: 2
            color: "#8be9fd"
        }

        Text {
            x: 55
            y: 65

            text: "WALLPAPER SWITCHER"
            color: "#8be9fd"

            font {
                family: "monospace"
                pixelSize: 24
                bold: true
            }
        }

        Text {
            x: 55
            y: 100

            text: "SELECT WALLPAPER"
            color: "#62727e"

            font {
                family: "monospace"
                pixelSize: 13
            }
        }

        Rectangle {
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                leftMargin: 55
                topMargin: 145
                bottomMargin: 85
            }

            width: parent.width * 0.43

            color: "transparent"

            Column {
                anchors.fill: parent
                spacing: 7

                Repeater {
                    model: wallpapers

                    delegate: Rectangle {
                        width: parent.width
                        height: 42

                        color: index === root.selectedIndex
                               ? "#16242b"
                               : "transparent"

                        border.width: index === root.selectedIndex ? 1 : 0
                        border.color: "#8be9fd"

                        Text {
                            anchors.verticalCenter: parent.verticalCenter

                            x: 15

                            text: index === root.selectedIndex
                                  ? "> [ " + root.wallpaperName(index) + " ]"
                                  : "  [ " + root.wallpaperName(index) + " ]"

                            color: index === root.selectedIndex
                                   ? "#8be9fd"
                                   : "#c8d0d5"

                            font {
                                family: "monospace"
                                pixelSize: 15
                            }

                            elide: Text.ElideRight
                            width: parent.width - 30
                        }
                    }
                }
            }
        }

        Rectangle {
            anchors {
                right: parent.right
                top: parent.top
                rightMargin: 55
                topMargin: 145
            }

            width: parent.width * 0.43
            height: parent.height - 230

            color: "#10161a"

            border.width: 1
            border.color: "#26343c"

            Image {
                anchors.fill: parent
                anchors.margins: 12

                fillMode: Image.PreserveAspectFit
                smooth: true

                source: wallpapers.count > 0
                        ? wallpapers.get(
                            root.selectedIndex,
                            "fileUrl"
                          )
                        : ""

                asynchronous: true
            }

            Text {
                anchors.centerIn: parent

                visible: wallpapers.count === 0

                text: "NO WALLPAPERS FOUND"

                color: "#62727e"

                font {
                    family: "monospace"
                    pixelSize: 16
                }
            }
        }

        Text {
            anchors {
                left: parent.left
                bottom: parent.bottom
                leftMargin: 55
                bottomMargin: 35
            }

            text: "↑ ↓  SELECT     ENTER  APPLY     ESC  CLOSE"

            color: "#62727e"

            font {
                family: "monospace"
                pixelSize: 13
            }
        }

        FocusScope {
            anchors.fill: parent
            focus: true

            Keys.onPressed: function(event) {

                if (event.key === Qt.Key_Up) {

                    if (wallpapers.count > 0) {
                        root.selectedIndex =
                            (root.selectedIndex - 1 + wallpapers.count)
                            % wallpapers.count
                    }

                    event.accepted = true
                }

                else if (event.key === Qt.Key_Down) {

                    if (wallpapers.count > 0) {
                        root.selectedIndex =
                            (root.selectedIndex + 1)
                            % wallpapers.count
                    }

                    event.accepted = true
                }

                else if (
                    event.key === Qt.Key_Return ||
                    event.key === Qt.Key_Enter
                ) {

                    root.applyWallpaper()

                    closeTimer.start()

                    event.accepted = true
                }

                else if (event.key === Qt.Key_Escape) {

                    Qt.quit()

                    event.accepted = true
                }
            }
        }
    }
}
