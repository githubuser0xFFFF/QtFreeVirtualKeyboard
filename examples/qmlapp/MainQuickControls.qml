import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "white"

    Flickable {
        id: flickable
        anchors.fill: parent
        contentWidth: content.width
        contentHeight: content.height
        interactive: contentHeight > height
        flickableDirection: Flickable.VerticalFlick

        Item {
            id: content
            x: 12
            y: 20
            width: flickable.width - 26
            height: syringe.implicitHeight

            Syringe {
                id: syringe
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width * 0.7
            }


            Grid {
                id: grid
                columns: 2
                verticalItemAlignment: Grid.AlignVCenter
                horizontalItemAlignment: Grid.AlignLeft
                columnSpacing: 10
                rowSpacing: 20
                anchors.left: content.left
                anchors.right: content.right
                anchors.top: syringe.bottom
                anchors.topMargin: 20

                // 1st rot ----------------------
                Label {
                    text: "Volume (ml):"
                    font.pixelSize: 20
                }
                TextField {
                    id: volumeTextField
                    style: TextFieldFlatStyle {}
                    width: grid.width - x
                    placeholderText: "Volume (ml)"
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    validator: DoubleValidator {
                        bottom: 0;
                        top: 2000;
                        notation: DoubleValidator.StandardNotation
                        decimals: 3
                    }
                }

                // 2nd row ----------------------
                Label {
                    text: "Flow (ml/s):"
                    font.pixelSize: 20
                }
                TextField {
                    id: flowTextField
                    style: TextFieldFlatStyle {}
                    width: grid.width - x
                    placeholderText: "Flow (ml/s)"
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                }

                // 3rd row ----------------------
                Rectangle {
                    id: dumy
                    width: 10
                    height: 10
                }

                Slider {
                    width: grid.width - x
                    minimumValue: 0
                    maximumValue: 100
                    value: 30
                    style: SliderFlatStyle {}
                }
            }
        }
    }
}
