import QtQuick 2.0

/**
 * This is quick and dirty model for the keys of the InputPanel *
 * The code has been copied from
 * http://tolszak-dev.blogspot.de/2013/04/qplatforminputcontext-and-virtual.html
 */
Item {
    property QtObject firstRowModel: first
    property QtObject secondRowModel: second
    property QtObject thirdRowModel: third


    ListModel {
        id:first
        ListElement { letter: "q"; firstSymbol: "1"}
        ListElement { letter: "w"; firstSymbol: "2"}
        ListElement { letter: "e"; firstSymbol: "3"}
        ListElement { letter: "r"; firstSymbol: "4"}
        ListElement { letter: "t"; firstSymbol: "5"}
        ListElement { letter: "y"; firstSymbol: "6"}
        ListElement { letter: "u"; firstSymbol: "7"}
        ListElement { letter: "i"; firstSymbol: "8"}
        ListElement { letter: "o"; firstSymbol: "9"}
        ListElement { letter: "p"; firstSymbol: "0"}
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
