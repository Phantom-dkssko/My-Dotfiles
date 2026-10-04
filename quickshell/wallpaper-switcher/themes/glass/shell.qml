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
    color: "transparent"

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
        color: "#080b0f"
        opacity: 0.72
    }

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            margins: 70
        }

        radius: 28
        color: "#172027"
        opacity: 0.84

        border.width: 1
        border.color: "#5c7480"

        Text {
            x: 40
            y: 32

            text: "WALLPAPER"

            color: "#d8f3f7"

            font {
                family: "sans-serif"
                pixelSize: 25
                bold: true
            }
        }

        Text {
            x: 42
            y: 66

            text: "GLASS THEME  •  MOUSE MODE"

            color: "#7fabb7"

            font {
                family: "sans-serif"
                pixelSize: 12
                bold: true
                letterSpacing: 1
            }
        }

        Rectangle {
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                leftMargin: 35
                topMargin: 110
                bottomMargin: 75
            }

            width: parent.width * 0.38

            color: "#10171c"
            opacity: 0.78
            radius: 18

            border.width: 1
            border.color: "#30434c"

            Flickable {
                anchors.fill: parent
                anchors.margins: 10

                contentHeight: wallpaperColumn.height
                clip: true

                Column {
                    id: wallpaperColumn

                    width: parent.width
                    spacing: 6

                    Repeater {
                        model: wallpapers

                        delegate: Rectangle {
                            id: wallpaperItem

                            width: wallpaperColumn.width
                            height: 54

                            radius: 12

                            color: index === root.selectedIndex
                                   ? "#29414a"
                                   : mouseArea.containsMouse
                                     ? "#1c2a30"
                                     : "transparent"

                            border.width:
                                index === root.selectedIndex ? 1 : 0

                            border.color: "#8bd8e8"

                            Behavior on color {
                                ColorAnimation {
                                    duration: 120
                                }
                            }

                            Image {
                                x: 7
                                y: 7

                                width: 40
                                height: 40

                                source: wallpapers.get(
                                    index,
                                    "fileUrl"
                                )

                                fillMode: Image.PreserveAspectCrop
                                asynchronous: true
                                smooth: true
                            }

                            Text {
                                anchors.verticalCenter: parent.verticalCenter

                                x: 58

                                width: parent.width - 70

                                text: root.wallpaperName(index)

                                color:
                                    index === root.selectedIndex
                                    ? "#e8fbff"
                                    : "#b8c7cc"

                                font {
                                    family: "sans-serif"
                                    pixelSize: 13
                                }

                                elide: Text.ElideRight
                            }

                            MouseArea {
                                id: mouseArea

                                anchors.fill: parent

                                hoverEnabled: true

                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    root.selectedIndex = index
                                }

                                onDoubleClicked: {
                                    root.selectedIndex = index
                                    root.applyWallpaper()
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            anchors {
                right: parent.right
                top: parent.top
                rightMargin: 35
                topMargin: 110
            }

            width: parent.width * 0.49
            height: parent.height - 185

            radius: 18

            color: "#0d1419"
            opacity: 0.9

            border.width: 1
            border.color: "#30434c"

            Image {
                anchors.fill: parent
                anchors.margins: 12

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
                anchors.centerIn: parent

                visible: wallpapers.count === 0

                text: "NO WALLPAPERS FOUND"

                color: "#78949d"

                font {
                    family: "monospace"
                    pixelSize: 15
                }
            }

            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }

                height: 72

                radius: 18

                color: "#080d11"
                opacity: 0.86

                Text {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                        leftMargin: 22
                    }

                    width: parent.width - 44

                    text: wallpapers.count > 0
                          ? root.wallpaperName(root.selectedIndex)
                          : "NO WALLPAPERS FOUND"

                    color: "#e5f8fb"

                    font {
                        family: "sans-serif"
                        pixelSize: 14
                        bold: true
                    }

                    elide: Text.ElideRight
                }
            }
        }

        Rectangle {
            anchors {
                left: parent.left
                bottom: parent.bottom
                leftMargin: 38
                bottomMargin: 20
            }

            width: 125
            height: 38

            radius: 19

            color: applyMouse.containsMouse
                   ? "#8bd8e8"
                   : "#29414a"

            border.width: 1
            border.color: "#8bd8e8"

            Text {
                anchors.centerIn: parent

                text: "APPLY"

                color: applyMouse.containsMouse
                       ? "#10171c"
                       : "#d8f3f7"

                font {
                    family: "sans-serif"
                    pixelSize: 12
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
                left: parent.left
                bottom: parent.bottom
                leftMargin: 173
                bottomMargin: 20
            }

            width: 125
            height: 38

            radius: 19

            color: closeMouse.containsMouse
                   ? "#38484f"
                   : "#202d33"

            border.width: 1
            border.color: "#40545d"

            Text {
                anchors.centerIn: parent

                text: "CLOSE"

                color: "#b8c7cc"

                font {
                    family: "sans-serif"
                    pixelSize: 12
                    bold: true
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

        Text {
            anchors {
                right: parent.right
                bottom: parent.bottom
                rightMargin: 38
                bottomMargin: 33
            }

            text: "CLICK  SELECT   •   DOUBLE CLICK  APPLY   •   " +
                  wallpapers.count + " WALLPAPERS"

            color: "#607981"

            font {
                family: "monospace"
                pixelSize: 10
            }
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
                event.accepted = true
            }

            else if (event.key === Qt.Key_Escape) {

                Qt.quit()
                event.accepted = true
            }
        }
    }
}
