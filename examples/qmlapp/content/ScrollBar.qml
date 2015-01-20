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

Item {
    property var scrollArea: parent

    width: 6
    opacity: scrollArea && scrollArea.movingVertically ? 1.0 : 0.0
    visible: scrollArea && scrollArea.contentHeight >= scrollArea.height
    anchors { right: parent.right; top: parent.top; bottom: parent.bottom; margins: 2 }

    Behavior on opacity { NumberAnimation { properties: "opacity"; duration: 600 } }

    function size() {
        var nh = scrollArea.visibleArea.heightRatio * height
        var ny = scrollArea.visibleArea.yPosition * height
        return ny > 3 ? Math.min(nh, Math.ceil(height - 3 - ny)) : nh + ny
    }
    Rectangle {
        x: 1
        y: scrollArea ? Math.max(2, scrollArea.visibleArea.yPosition * parent.height) : 0
        height: scrollArea ? size() : 0
        width: parent.width - 2
        color: Qt.rgba(1.0, 1.0, 1.0, 0.5)
        radius: 1
    }
}