import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import MediaToolBar
// Directly from the Qt website:

Window {
    id: root
    width: 1280 // Set the width of the window.
    height: 720 // Set the height of the window.
    visible: true // Make the window visible.
    title: qsTr("AnyNoise") // Set the title of the window.

    
    RowLayout {
        anchors.fill: parent
        visible: true
        spacing: 8
        
        
        MediaToolBar {
            trackTitle: "Pink Floyd – Comfortably Numb"
            anchors {bottom: parent.bottom}
            playing: false
            volume: 0.8
        }
    }
}

