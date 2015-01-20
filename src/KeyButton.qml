import QtQuick 2.0

/**
 * This is the type implements one single key button in the InputPanel
 * The code has been copied from
 * http://tolszak-dev.blogspot.de/2013/04/qplatforminputcontext-and-virtual.html
 */
Item {
    id:root
    /**
     * The background color of this button
     */
    property color color: "#35322f"

    /**
     * The text to show in this button
     */
    property alias text: txt.text

    /**
     * The font for rendering of text
     */
    property alias font: txt.font

    /**
     * The color of the text in this button
     */
    property alias textColor: txt.color

    /**
     * This property holds the pressed status of the key.
     */
    property alias isPressed: buttonMouseArea.pressed

    /**
     * This property holds a refernce to the input panel.
     * A key can only show the charcter preview popup if this property contains
     * a valid refernce to the input panel
     */
    property var inputPanel

    /**
     * Sets the show preview attribute for the charcter preview key popup
     */
    property bool showPreview: true
    signal clicked()
    signal pressed()
    signal released()

    Rectangle {
        anchors.fill: parent
        radius: height / 30
        color: buttonMouseArea.pressed ? Qt.tint(root.color, "#801e6fa7") : root.color
        Text {
            id: txt
            color: "white"
            anchors.margins: parent.height / 6
            anchors.fill: parent
            fontSizeMode: Text.Fit
            font.pixelSize: height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
            onClicked: root.clicked()
            onPressed: root.pressed()
            onReleased: root.released()
        }
    }

    onInputPanelChanged: {
        console.log("onInputPanelChanged: " + inputPanel.objectName);
    }

    /**
     * If the InputPanel property has a valid InputPanel reference and if
     * showPreview is true, then this function calls showKeyPopup() to
     * show the character preview popup.
     */
    onPressed: {
        if (inputPanel != null && showPreview)
        {
            inputPanel.showKeyPopup(root);
        }
    }
}
