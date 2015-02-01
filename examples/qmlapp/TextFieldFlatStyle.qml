import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Component {
    id: textfieldFlatStyle

    TextFieldStyle {
        id: textfieldstyle
        textColor: "#333333"
        placeholderTextColor: "#c9c9c9"
        font.pixelSize: 20
        background: Rectangle {
            color: "#00FFFFFF"
            radius: 6
            border.color: "#c9c9c9"
            border.width: 1.4
            implicitHeight: textfieldstyle.font.pixelSize * 2.6
        }
        padding.left: 20
        padding.right: 20
    }
}

