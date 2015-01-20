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

TextBase {
    id: textArea

    property alias color: textEdit.color
    property alias text: textEdit.text
    property alias textWidth: textEdit.width
    property alias readOnly: textEdit.readOnly
    property alias inputMethodHints: textEdit.inputMethodHints

    editor: textEdit

    Repeater {
        model: Math.floor((parent.height - 30) / editor.cursorRectangle.height)
        Rectangle {
            x: 8
            y: (index+1)*editor.cursorRectangle.height+6
            height: 1; width: textArea.width-24
            color: Qt.rgba(1.0, 1.0, 1.0, 0.5)
        }
    }
    TextEdit {
        id: textEdit

        /*EnterKeyAction.actionId: textArea.enterKeyAction
        EnterKeyAction.label: textArea.enterKeyText
        EnterKeyAction.enabled: textArea.enterKeyEnabled*/

        y: 6
        focus: true
        color: "#EEEEEE"
        wrapMode: TextEdit.Wrap
        cursorVisible: activeFocus
        height: Math.max(implicitHeight, 60)
        font.pixelSize: textArea.fontPixelSize
        selectionColor: Qt.rgba(1.0, 1.0, 1.0, 0.5)
        selectedTextColor: Qt.rgba(0.0, 0.0, 0.0, 0.8)
        anchors { left: parent.left; right: parent.right; margins: 12 }
        onActiveFocusChanged: if (!activeFocus) deselect()
    }
}
