import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

ButtonStyle {
    id: textfieldstyle
    property font font

    background: Rectangle {
        id: bg
        color: !control.pressed ? "#00FFFFFF" : "#5caa15"
        radius: 6
        border.color: "#5caa15"
        border.width: 1.4
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

    padding.left: 20
    padding.right: 20
    padding.top: 10
    padding.bottom: 10
}
