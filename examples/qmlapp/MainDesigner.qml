import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0

Rectangle {
    width: 800
    height: 480

    Flickable {
        id: flickable1
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick
    }
}
