pragma Singleton
import QtQuick 2.3
import QtQuick.Window 2.0

QtObject {
    function dp(value) {
        var px =  Math.round(value * (screenPixelDensity / 160.0));
        if(Qt.platform.os == "windows" || Qt.platform.os == "mac") {
            console.log("dp = " + px + " Screen.pixelDensity " + screenPixelDensity);
            return px * 2;
        }
        else {
            return px;
        }
    }
}
