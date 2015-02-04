import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

Item {
    id: root
    implicitHeight: syringeImage.height
    property alias maximumLevel: progressBar.maximumValue
    property alias minimumLevel: progressBar.minimumValue
    property alias level: progressBar.value

    Image {
        id: syringeImage
        source: "syringe2.svg"
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        z: 100
    }

    ProgressBar {
        id: progressBar
        anchors.left: parent.left
        anchors.leftMargin: Math.round(
            (syringeImage.width - syringeImage.paintedWidth) / 2 + syringeImage.paintedWidth * 0.125)
        anchors.right: parent.right
        anchors.rightMargin: Math.round(
            (syringeImage.width - syringeImage.paintedWidth) / 2 + syringeImage.paintedWidth * 0.13)
        anchors.verticalCenter: parent.verticalCenter
        height: syringeImage.height * 0.65
        style: syringeProgressBarStyle
        z: 0
    }

    Component {
        id: syringeProgressBarStyle
        ProgressBarStyle {
            background: Rectangle {
                color: "#00FFFFFF"
                border.color: "transparent"
                border.width: 0
                implicitWidth: 200
                implicitHeight: 24
            }
            progress: Rectangle {
                color: "#5caa15"
            }
        }
    }
}
