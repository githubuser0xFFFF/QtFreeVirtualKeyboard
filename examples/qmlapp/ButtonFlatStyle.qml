import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

ButtonStyle {
    id: textfieldstyle
    property font font

    background: Rectangle {
        id: bg
        color: !control.pressed ? "#00FFFFFF" : "#5caa15"
        radius: Style.dp(8)
        border.color: "#5caa15"
        border.width: Style.dp(2)
    }

    label: Text {
        id: textLabel
        renderType: Text.NativeRendering
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: control.pressed ? "white" : "#5caa15"
        text: control.text
        font: textfieldstyle.font
    }

    padding.left: Style.dp(20)
    padding.right: Style.dp(20)
    padding.top: Style.dp(10)
    padding.bottom: Style.dp(10)
}
