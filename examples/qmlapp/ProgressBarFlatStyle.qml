import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2


Component {
    id: progressBarFlatStyle
    ProgressBarStyle {
        background: Rectangle {
            radius: 6
            color: "#00FFFFFF"
            border.color: "#c9c9c9"
            border.width: 1.4
            implicitWidth: 200
            implicitHeight: 24
        }
        progress: Rectangle {
            color: "#5caa15"
            radius: 6
        }
    }
}

