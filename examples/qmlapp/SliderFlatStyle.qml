import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."


Component {
    id: sliderFlatStyle
    SliderStyle {
        groove: Rectangle {
            color: "#c9c9c9"
            radius: Math.round(height / 2)
            border.color: "#c9c9c9"
            border.width: Style.dp(2)
            height: Style.dp(8)

            Rectangle {
                color: "#5caa15"
                radius: Math.round(height / 2)
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: parent.width * control.value / (control.maximumValue - control.minimumValue)
            }
        }

        handle: Item {
            implicitWidth: Style.dp(45)
            implicitHeight: Style.dp(45)
            Rectangle {
                id: foreground
                color: "white"
                radius: Math.round(height / 2)
                border.color: !control.pressed ? "#999999" : "#328930"
                border.width: Style.dp(2)
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
                x: foreground.x + 2
                y: foreground.y + 2
                z: 9
            }

            Rectangle {
                id: glow
                width: foreground.width * 1.7
                height: foreground.height * 1.7
                border.color: "#328930"
                border.width: Style.dp(2)
                anchors.centerIn: foreground
                radius: Math.round(height / 2)
                color: "#2F5caa15"
                visible: control.pressed
            }
        }
    }
}
