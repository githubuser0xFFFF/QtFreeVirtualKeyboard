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

FocusScope {
    id: textBase

    property var editor
    property bool previewTextActive: !editor.activeFocus && text.length === 0
    property int fontPixelSize: 32
    property string previewText
    //property int enterKeyAction: EnterKeyAction.None
    property int enterKeyAction
    property string enterKeyText
    //property bool enterKeyEnabled: enterKeyAction === EnterKeyAction.None || editor.text.length > 0 || editor.inputMethodComposing
    property bool enterKeyEnabled
    property alias mouseParent: mouseArea.parent

    implicitHeight: editor.height + 12

    signal enterKeyClicked

    Keys.onReleased: {
        if (event.key === Qt.Key_Return)
            enterKeyClicked()
    }

    Rectangle {
        // background
        radius: 5.0
        anchors.fill: parent
        color: Qt.rgba(1.0, 1.0, 1.0, 0.2)
        border { width: editor.activeFocus ? 2 : 0; color: "#CCCCCC" }
    }
    Text {
        id: previewText

        y: 8
        color: "#CCCCCC"
        visible: previewTextActive
        text: textBase.previewText
        font.pixelSize: 28
        anchors { left: parent.left; right: parent.right; margins: 12 }

    }
    MouseArea {
        id: mouseArea

        z: 1
        parent: textBase
        anchors.fill: parent
        onClicked: {
            if (editor.inputMethodComposing) {
                if (!Qt.inputMethod.visible) {
                    Qt.inputMethod.show()
                    return
                }
                Qt.inputMethod.commit()
            }
            var positionInEditor = mapToItem(editor, mouseX, mouseY)
            var cursorPosition = editor.positionAt(positionInEditor.x, positionInEditor.y)
            editor.cursorPosition = cursorPosition
            editor.forceActiveFocus()
            Qt.inputMethod.show()
        }
    }
}
