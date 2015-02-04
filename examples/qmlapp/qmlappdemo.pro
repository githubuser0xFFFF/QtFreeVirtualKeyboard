TEMPLATE = app
TARGET = virtualkeyboardqmldemo
QT += qml quick
SOURCES += main.cpp
CONFIG += link_pkgconfig


linux-buildroot-g++ {
    deployment.files = *.qml *.otf *.ttf *.svg
    target.path = /vktest
    deployment.path = /vktest
    INSTALLS += target deployment
} else {
    target.path = $$[QT_INSTALL_PLUGINS]/virtualkeyboard
    INSTALLS += target
}


RESOURCES += \
    qmlappdemo.qrc

OTHER_FILES += \
    content/ScrollBar.qml \
    content/TextArea.qml \
    content/TextBase.qml \
    content/TextField.qml \
    Main.qml \
    MainContainer.qml

DESTDIR = $$PWD

DISTFILES += \
    StyleHelper.aml \
    Style.qml
