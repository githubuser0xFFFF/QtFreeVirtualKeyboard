//============================================================================
/// \file   main.cpp
/// \author Uwe Kindler
/// \date   08.01.2015
/// \brief  main of virtual keyboard example application
//============================================================================

//============================================================================
//                                   INCLUDES
//============================================================================
#include <QQuickView>
#include <QGuiApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QFont>
#include <QFontDatabase>
#include <QDebug>
#include <QScreen>


/**
 * main entry point for application
 */
int main(int argc, char *argv[])
{
    // Load virtualkeyboard input context plugin
    qputenv("QT_IM_MODULE", QByteArray("freevirtualkeyboard"));

    QGuiApplication app(argc, argv);

    // Set standard font so that application looks equal on all platforms
    QFontDatabase FontDatabase;
    FontDatabase.addApplicationFont(":/DejaVuSans.ttf");
    app.setFont(QFont("DejaVu Sans"));
    app.setObjectName("QGuiApplication");

    QQuickView view;
    //view.setSource(QString("qrc:/MainContainer.qml"));
    view.engine()->rootContext()->setContextProperty("screenPixelDensity",
        QGuiApplication::primaryScreen()->physicalDotsPerInch());
    view.setSource(QString("MainContainer.qml"));
    view.setObjectName("QQuickView");
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.engine()->setObjectName("QQuickEngine");
    view.engine()->addImportPath(qApp->applicationDirPath());

    // Set size to 800 x 480 WXGA - this is the size of the upcoming Manga
    // screen.
    view.setWidth(1280);
    view.setHeight(800);

    view.show();

    return app.exec();
}
