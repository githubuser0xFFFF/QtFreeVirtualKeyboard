import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."

Rectangle {
    id: root
    width: parent.width
    height: parent.height
    color: "white"

    FontLoader {
        source: "FontAwesome.otf"
    }

    // this is a standalone animation, it's not running by default
    PropertyAnimation { id: syringeLevelAnimation; target: syringe; property: "level"}

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
            height: syringeRow.implicitHeight

            Row {
                id: syringeRow
                anchors.left: content.left
                anchors.right: content.right
                Button {
                    id: emptyButton
                    text: "\uf049"
                    width: content.width * 0.1
                    height: parent.height
                    style: ButtonFlatStyle {
                        font.family: "FontAwesome"
                        font.pixelSize: 40
                    }

                    onPressedChanged: {
                        syringeLevelAnimation.to = syringe.minimumLevel;
                        syringeLevelAnimation.duration = syringe.level / syringe.maximumLevel * 5000 * flowSlider.maximumValue / flowSlider.value
                        syringeLevelAnimation.running = pressed;
                    }
                }

                Syringe {
                    id: syringe
                    width: content.width * 0.8
                    minimumLevel: 0
                    maximumLevel: 10
                    level: maximumLevel / 2
                }


                Button {
                    id: refillButton
                    text: "\uf050"
                    width: content.width * 0.1
                    height: parent.height
                    style: ButtonFlatStyle {
                        font.family: "FontAwesome"
                        font.pixelSize: 40
                    }

                    onPressedChanged: {
                        syringeLevelAnimation.to = syringe.maximumLevel
                        syringeLevelAnimation.duration = (syringe.maximumLevel - syringe.level) / syringe.maximumLevel * 5000 * flowSlider.maximumValue / flowSlider.value
                        syringeLevelAnimation.running = pressed;
                    }
                }
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
                anchors.top: syringeRow.bottom
                anchors.topMargin: 20

                // 1st rot ----------------------
                Label {
                    text: "Level (ml):"
                    font.pixelSize: 20
                }
                TextField {
                    id: levelTextField
                    style: TextFieldFlatStyle {}
                    width: grid.width - x
                    placeholderText: "Level (ml)"
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                    text: syringe.level
                    validator: DoubleValidator {
                        bottom: syringe.minimumLevel;
                        top: syringe.maximumLevel;
                        notation: DoubleValidator.StandardNotation
                        decimals: 3
                    }
                }

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
                    text: "0"
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
                    validator: DoubleValidator {
                        bottom: 0;
                        top: 2000;
                        notation: DoubleValidator.StandardNotation
                        decimals: 3
                    }
                }

                // 3rd row ----------------------
                Rectangle {
                    id: dumy
                    width: 10
                    height: 10
                }

                Slider {
                    id: flowSlider
                    width: grid.width - x
                    minimumValue: 0
                    maximumValue: 100
                    value: 30
                    style: SliderFlatStyle {}
                    onValueChanged: {
                        flowTextField.text = value
                    }
                }
            }
        }
    }
}
