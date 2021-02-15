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

    property int count: 0
    property point fromPoint: Qt.point(0, 0)
    property point toPoint: Qt.point(0, 0)

    Material.theme: Material.Light
    Material.accent: Material.Blue

    Label {
        id: label
        text: ""
        x: 20
        y: 20
        font.pointSize: 16
    }

    Image {
        id: image
        width: 100
        height: 100
        x: 300
        y: 100
        rotation: 90
        source: "sample.png"
        fillMode: Image.PreserveAspectFit

        ParallelAnimation {
            id: animation
            running: false

            NumberAnimation {
                id: animationX
                target: image
                property: "x"
                running: false
                from: window.fromPoint.x
                to: window.toPoint.x
                duration: 1000
            }

            NumberAnimation {
                id: animationY
                target: image
                property: "y"
                running: false
                from: window.fromPoint.y
                to: window.toPoint.y
                duration: 1000
            }
        }
    }

    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            animation.stop()
            updatePoint(window.count)
            updateLabel(window.count)
            updateRotation(window.count)
            animation.start()
            window.count++
        }
    }

    Component.onCompleted: {
        label.text = "start!"
        timer.start()
    }

    function updatePoint(count) {
        const c = count % 16
        if (0 <= c && c <= 3) {
            window.fromPoint = Qt.point(300 + c * 100, 100)
            window.toPoint = Qt.point(300 + (c + 1) * 100, 100)
        } else if (4 <= c && c <= 7) {
            window.fromPoint = Qt.point(700, 100 + (c - 4) * 100)
            window.toPoint = Qt.point(700, 100 + (c - 3) * 100)
        } else if (8 <= c && c <= 11) {
            window.fromPoint = Qt.point(700 - (c - 8) * 100, 500)
            window.toPoint = Qt.point(700 - (c - 7) * 100, 500)
        } else {
            window.fromPoint = Qt.point(300, 500 - (c - 12) * 100)
            window.toPoint = Qt.point(300, 500 - (c - 11) * 100)
        }
    }

    function updateLabel(count) {
        const c = count % 16
        if (0 <= c && c <= 3) {
            label.text = "→ : " + (c + 1)
        } else if (4 <= c && c <= 7) {
            label.text = "↓ : " + (c - 3)
        } else if (8 <= c && c <= 11) {
            label.text = "← : " + (c - 7)
        } else {
            label.text = "↑ : " + (c - 11)
        }
    }

    function updateRotation(count) {
        const c = count % 16
        if (0 <= c && c <= 3) {
            image.rotation = 90
        } else if (4 <= c && c <= 7) {
            image.rotation = 180
        } else if (8 <= c && c <= 11) {
            image.rotation = 270
        } else {
            image.rotation = 0
        }
    }
}
