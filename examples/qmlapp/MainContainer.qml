/****************************************************************************
**
** Copyright (C) 2014 Digia Plc
** All rights reserved.
** For any questions to Digia, please use contact form at http://www.qt.io
**
** This file is part of the Qt Virtual Keyboard add-on for Qt Enterprise.
**
** Licensees holding valid Qt Enterprise licenses may use this file in
** accordance with the Qt Enterprise License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.
**
** If you have questions regarding the use of this file, please use
** contact form at http://www.qt.io
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.FreeVirtualKeyboard 1.0
import QtQuick.Window 2.0


Rectangle {
    id: root
    color: "black"
    implicitWidth: mainQml.implicitWidth
    implicitHeight: mainQml.implicitHeight
    //onWidthChanged: console.log("3 Root item size: " + height + " " + width)
    //onHeightChanged: console.log("3 Root item size: " + height + " " + width)
    Item {
        clip: true
        id: appContainer
        width: parent.width - 100
        height: parent.height - 100
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: 5
        MainQuickControls {
            id: mainQml
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: inputPanel.top
        }
        InputPanel {
            id: inputPanel
            z: 99
            y: appContainer.height
            anchors.left: parent.left
            anchors.right: parent.right
            states: State {
                name: "visible"
                when: Qt.inputMethod.visible
                PropertyChanges {
                    target: inputPanel
                    y: appContainer.height - inputPanel.height
                }
            }
            transitions: Transition {
                from: ""
                to: "visible"
                reversible: true
                ParallelAnimation {
                    NumberAnimation {
                        properties: "y"
                        duration: 150
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
}
