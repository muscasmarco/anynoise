import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: mediaToolbar
    Layout.fillWidth: true
    height: 64
    color: "#1a1a2e"

    // ── Properties bound from C++ ─────────────────────────────────────────────
    property string trackTitle: "No Track Selected"
    property bool   playing:    false
    property real   volume:     0.75

    // ── Layout ────────────────────────────────────────────────────────────────
    RowLayout {
        anchors { fill: parent; leftMargin: 20; rightMargin: 20 }
        spacing: 20

        // 1. Track label ───────────────────────────────────────────────────────
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height
            clip: true

            Text {
                text: mediaToolbar.trackTitle
                anchors.verticalCenter: parent.verticalCenter
                color: "#fffffe"
                font.pixelSize: 14
                font.letterSpacing: 0.4
                elide: Text.ElideRight
                width: parent.width
            }
        }

        // 2. Play / Pause button ───────────────────────────────────────────────
        Rectangle {
            id: playPauseBtn
            width: 36
            height: 36
            radius: 18
            color: playPauseArea.pressed       ? "#5a3fcf"
                 : playPauseArea.containsMouse  ? "#9370f5"
                 : "#7f5af0"

            Behavior on color { ColorAnimation { duration: 150 } }

            scale: playPauseArea.pressed ? 0.93 : 1.0
            Behavior on scale { NumberAnimation { duration: 100; easing.type: Easing.OutQuad } }

            Text {
                anchors.centerIn: parent
                text: mediaToolbar.playing ? "⏸" : "▶"
                color: "#fffffe"
                font.pixelSize: 13
                font.bold: true
                font.letterSpacing: 0.5
            }

            MouseArea {
                id: playPauseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
            }
        }

        // 3. Volume section ────────────────────────────────────────────────────
        RowLayout {
            spacing: 8
            Layout.preferredWidth: 170

            Text {
                text: mediaToolbar.volume === 0 ? "🔇"
                    : mediaToolbar.volume < 0.4  ? "🔈"
                    : mediaToolbar.volume < 0.75 ? "🔉"
                    : "🔊"
                font.pixelSize: 16
                color: "#94a1b2"
            }

            Slider {
                id: volumeSlider
                Layout.fillWidth: false
                from: 0.0
                to: 1.0
                value: mediaToolbar.volume
                stepSize: 0.01

                background: Rectangle {
                    x: volumeSlider.leftPadding
                    y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                    implicitWidth: 120
                    implicitHeight: 4
                    width: volumeSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: "#2d2d44"

                    Rectangle {
                        width: volumeSlider.visualPosition * parent.width
                        height: parent.height
                        radius: 2
                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: "#7f5af0" }
                            GradientStop { position: 1.0; color: "#2cb67d" }
                        }
                    }
                }

                handle: Rectangle {
                    x: volumeSlider.leftPadding + volumeSlider.visualPosition
                       * (volumeSlider.availableWidth - width)
                    y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                    implicitWidth: 16
                    implicitHeight: 16
                    radius: 8
                    color: volumeSlider.pressed ? "#2cb67d" : "#fffffe"
                    border.color: "#7f5af0"
                    border.width: 2

                    Behavior on color { ColorAnimation { duration: 120 } }

                    scale: volumeSlider.pressed ? 1.25 : 1.0
                    Behavior on scale { NumberAnimation { duration: 100 } }
                }
            }

            Text {
                text: Math.round(mediaToolbar.volume * 100) + "%"
                color: "#94a1b2"
                font.pixelSize: 11
                font.family: "Courier, monospace"
                Layout.preferredWidth: 30
            }
        }
    }
}
