import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2


Component {
    id: sliderFlatStyle
    SliderStyle {
        groove: Rectangle {
            color: "#c9c9c9"
            radius: 4
            border.color: "#c9c9c9"
            border.width: 1.4
            height: 8

            Rectangle {
                color: "#5caa15"
                radius: 4
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: parent.width * control.value / (control.maximumValue - control.minimumValue)
            }
        }

        handle: Item {
            implicitWidth: 30
            implicitHeight: 30
            Rectangle {
                id: foreground
                color: "white"
                radius: Math.round(height / 2)
                border.color: !control.pressed ? "#999999" : "#328930"
                border.width: 1.4
                anchors.fill: parent
                z: 10
            }

            Rectangle {
                id: shadow
                color: "#1F000000"
                radius: foreground.radius
                border.color: "transparent"
                border.width: 0
                width: foreground.width
                height: foreground.height
                x: 2
                y: 2
                z: 9
            }
        }
    }
}
