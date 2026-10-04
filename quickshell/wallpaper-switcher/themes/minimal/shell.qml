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
    color: "#080808"

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

        folder: Qt.resolvedUrl(Quickshell.shellDir + "/../../../../wallpapers")

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

        onTriggered: Qt.quit()
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
        closeTimer.start()
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
        color: "#080808"
    }

    Image {
        id: mainPreview

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: controls.top
            margins: 55
        }

        source: wallpapers.count > 0
                ? wallpapers.get(
                    root.selectedIndex,
                    "fileUrl"
                  )
                : ""

        fillMode: Image.PreserveAspectFit
        asynchronous: true
        smooth: true
    }

    Text {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 25
        }

        text: "WALLPAPER " +
              (root.selectedIndex + 1) +
              " / " +
              wallpapers.count

        color: "#777777"

        font {
            family: "monospace"
            pixelSize: 11
        }
    }

    Rectangle {
        id: controls

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: 130

        color: "#080808"

        Rectangle {
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }

            height: 1

            color: "#252525"
        }

        Text {
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 45
            }

            width: parent.width * 0.45

            text: wallpapers.count > 0
                  ? wallpaperName(root.selectedIndex)
                  : "NO WALLPAPERS FOUND"

            color: "#eeeeee"

            font {
                family: "sans-serif"
                pixelSize: 16
                bold: true
            }

            elide: Text.ElideRight
        }

        Text {
            anchors {
                left: parent.left
                bottom: parent.bottom
                leftMargin: 45
                bottomMargin: 25
            }

            text: "CLICK TO SELECT   •   DOUBLE CLICK TO APPLY"

            color: "#555555"

            font {
                family: "monospace"
                pixelSize: 10
            }
        }

        Rectangle {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 45
            }

            width: 100
            height: 38

            radius: 5

            color: applyMouse.containsMouse
                   ? "#eeeeee"
                   : "#171717"

            border.width: 1
            border.color: "#333333"

            Text {
                anchors.centerIn: parent

                text: "APPLY"

                color: applyMouse.containsMouse
                       ? "#080808"
                       : "#dddddd"

                font {
                    family: "monospace"
                    pixelSize: 11
                    bold: true
                }
            }

            MouseArea {
                id: applyMouse

                anchors.fill: parent

                hoverEnabled: true

                cursorShape: Qt.PointingHandCursor

                onClicked: root.applyWallpaper()
            }
        }

        Rectangle {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 155
            }

            width: 100
            height: 38

            radius: 5

            color: closeMouse.containsMouse
                   ? "#242424"
                   : "#111111"

            border.width: 1
            border.color: "#2b2b2b"

            Text {
                anchors.centerIn: parent

                text: "CLOSE"

                color: "#aaaaaa"

                font {
                    family: "monospace"
                    pixelSize: 11
                }
            }

            MouseArea {
                id: closeMouse

                anchors.fill: parent

                hoverEnabled: true

                cursorShape: Qt.PointingHandCursor

                onClicked: Qt.quit()
            }
        }
    }

    MouseArea {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: controls.top
        }

        hoverEnabled: false

        onClicked: function(mouse) {
            var direction =
                mouse.x < width / 2 ? -1 : 1

            if (wallpapers.count > 0) {
                root.selectedIndex =
                    (root.selectedIndex + direction + wallpapers.count)
                    % wallpapers.count
            }
        }

        onDoubleClicked: {
            root.applyWallpaper()
        }

        cursorShape: Qt.PointingHandCursor
    }

    FocusScope {
        anchors.fill: parent
        focus: true

        Keys.onPressed: function(event) {

            if (event.key === Qt.Key_Left ||
                event.key === Qt.Key_Up) {

                if (wallpapers.count > 0) {
                    root.selectedIndex =
                        (root.selectedIndex - 1 + wallpapers.count)
                        % wallpapers.count
                }

                event.accepted = true
            }

            else if (
                event.key === Qt.Key_Right ||
                event.key === Qt.Key_Down
            ) {

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
                event.accepted = true
            }

            else if (event.key === Qt.Key_Escape) {

                Qt.quit()
                event.accepted = true
            }
        }
    }
}
