TEMPLATE = app
TARGET = virtualkeyboardqmldemo
QT += qml quick
SOURCES += main.cpp
CONFIG += link_pkgconfig
TARGETPATH = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard
target.path = $$TARGETPATH
INSTALLS += target

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
