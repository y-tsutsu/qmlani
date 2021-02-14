import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("cappuccino")

    Material.theme: Material.Light
    Material.accent: Material.Blue

    Image {
        id: image
        width: 100
        height: 100
        x: 300
        y: 100
        source: "sample.png"
        fillMode: Image.PreserveAspectFit
    }

    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            console.log("!!!")
        }
    }

    Component.onCompleted: {
        timer.start()
    }
}
