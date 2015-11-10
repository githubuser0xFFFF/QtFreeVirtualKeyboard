import QtQuick 2.0

/**
 * This is quick and dirty model for the keys of the InputPanel *
 * The code has been derived from
 * http://tolszak-dev.blogspot.de/2013/04/qplatforminputcontext-and-virtual.html
 * Copyright 2015 Uwe Kindler
 * Licensed under MIT see LICENSE.MIT in project root
 */
Item {
    property QtObject firstRowModel: first
    property QtObject secondRowModel: second
    property QtObject thirdRowModel: third


    ListModel {
        id:first
        ListElement { letter: "q"; firstSymbol: "1"; keycode: Qt.Key_Q}
        ListElement { letter: "w"; firstSymbol: "2"; keycode: Qt.Key_W}
        ListElement { letter: "e"; firstSymbol: "3"; keycode: Qt.Key_E}
        ListElement { letter: "r"; firstSymbol: "4"; keycode: Qt.Key_R}
        ListElement { letter: "t"; firstSymbol: "5"; keycode: Qt.Key_T}
        ListElement { letter: "y"; firstSymbol: "6"; keycode: Qt.Key_Y}
        ListElement { letter: "u"; firstSymbol: "7"; keycode: Qt.Key_U}
        ListElement { letter: "i"; firstSymbol: "8"; keycode: Qt.Key_I}
        ListElement { letter: "o"; firstSymbol: "9"; keycode: Qt.Key_O}
        ListElement { letter: "p"; firstSymbol: "0"; keycode: Qt.Key_E}
    }
    ListModel {
        id:second
        ListElement { letter: "a"; firstSymbol: "!"}
        ListElement { letter: "s"; firstSymbol: "@"}
        ListElement { letter: "d"; firstSymbol: "#"}
        ListElement { letter: "f"; firstSymbol: "$"}
        ListElement { letter: "g"; firstSymbol: "%"}
        ListElement { letter: "h"; firstSymbol: "&"}
        ListElement { letter: "j"; firstSymbol: "*"}
        ListElement { letter: "k"; firstSymbol: "?"}
        ListElement { letter: "l"; firstSymbol: "/"}
    }
    ListModel {
        id:third
        ListElement { letter: "z"; firstSymbol: "_"}
        ListElement { letter: "x"; firstSymbol: "\""}
        ListElement { letter: "c"; firstSymbol: "'"}
        ListElement { letter: "v"; firstSymbol: "("}
        ListElement { letter: "b"; firstSymbol: ")"}
        ListElement { letter: "n"; firstSymbol: "-"}
        ListElement { letter: "m"; firstSymbol: "+"}
    }
}
