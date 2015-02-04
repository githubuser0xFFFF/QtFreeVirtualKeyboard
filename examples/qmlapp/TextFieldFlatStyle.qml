import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

Component {
    id: textfieldFlatStyle

    TextFieldStyle {
        id: textfieldstyle
        textColor: "#333333"
        placeholderTextColor: "#c9c9c9"
        font.pixelSize: Style.dp(30)
        background: Rectangle {
            color: "#00FFFFFF"
            radius: Style.dp(8)
            border.color: "#c9c9c9"
            border.width: Style.dp(2)
            implicitHeight: textfieldstyle.font.pixelSize * 2.6
        }
        padding.left: Style.dp(30)
        padding.right: Style.dp(30)
    }
}

