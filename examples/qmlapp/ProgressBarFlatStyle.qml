import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."



Component {
    id: progressBarFlatStyle
    ProgressBarStyle {
        background: Rectangle {
            radius: Style.dp(8)
            color: "#00FFFFFF"
            border.color: "#c9c9c9"
            border.width: Style.dp(w)
            implicitWidth: Style.dp(200)
            implicitHeight: Style.dp(24)
        }
        progress: Rectangle {
            color: "#5caa15"
            radius: Style.dp(8)
        }
    }
}

