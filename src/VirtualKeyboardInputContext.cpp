//============================================================================
/// \file   VirtualKeyboardInputContext.cpp
/// \author Uwe Kindler
/// \date   08.01.2015
/// \brief  Implementation of VirtualKeyboardInputContext
///
/// Copyright 2015 Uwe Kindler
/// Licensed under MIT see LICENSE.MIT in project root
//============================================================================

//============================================================================
//                                 INCLUDES
//============================================================================
#include "VirtualKeyboardInputContext.h"

#include <QDebug>
#include <QEvent>
#include <QGuiApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QVariant>
#include <QQmlEngine>
#include <QJSEngine>
#include <QPropertyAnimation>

#include <private/qquickflickable_p.h>
#include "DeclarativeInputEngine.h"


/**
 * Private data class for VirtualKeyboardInputContext
 */
class VirtualKeyboardInputContextPrivate
{
public:
    VirtualKeyboardInputContextPrivate();
    QQuickFlickable* Flickable;
    QQuickItem* FocusItem;
    bool Visible;
    DeclarativeInputEngine* InputEngine;
    QPropertyAnimation* FlickableContentScrollAnimation;//< for smooth scrolling of flickable content item
};


//==============================================================================
VirtualKeyboardInputContextPrivate::VirtualKeyboardInputContextPrivate()
    : Flickable(0),
      FocusItem(0),
      Visible(false),
      InputEngine(new DeclarativeInputEngine())
{

}


//==============================================================================
VirtualKeyboardInputContext::VirtualKeyboardInputContext() :
    QPlatformInputContext(), d(new VirtualKeyboardInputContextPrivate)
{
    d->FlickableContentScrollAnimation = new QPropertyAnimation(this);
    d->FlickableContentScrollAnimation->setPropertyName("contentY");
    d->FlickableContentScrollAnimation->setDuration(400);
    d->FlickableContentScrollAnimation->setEasingCurve(QEasingCurve(QEasingCurve::OutBack));
    qmlRegisterSingletonType<DeclarativeInputEngine>("FreeVirtualKeyboard", 1, 0,
        "InputEngine", inputEngineProvider);
    connect(d->InputEngine, SIGNAL(animatingChanged()), this, SLOT(ensureFocusedObjectVisible()));
}


//==============================================================================
VirtualKeyboardInputContext::~VirtualKeyboardInputContext()
{

}


//==============================================================================
VirtualKeyboardInputContext* VirtualKeyboardInputContext::instance()
{
    static VirtualKeyboardInputContext* InputContextInstance = new VirtualKeyboardInputContext;
    return InputContextInstance;
}



//==============================================================================
bool VirtualKeyboardInputContext::isValid() const
{
    return true;
}


//==============================================================================
QRectF VirtualKeyboardInputContext::keyboardRect() const
{
    return QRectF();
}


//==============================================================================
void VirtualKeyboardInputContext::showInputPanel()
{
    d->Visible = true;
    QPlatformInputContext::showInputPanel();
    emitInputPanelVisibleChanged();
}


//==============================================================================
void VirtualKeyboardInputContext::hideInputPanel()
{
    d->Visible = false;
    QPlatformInputContext::hideInputPanel();
    emitInputPanelVisibleChanged();
}


//==============================================================================
bool VirtualKeyboardInputContext::isInputPanelVisible() const
{
    return d->Visible;
}


//==============================================================================
bool VirtualKeyboardInputContext::isAnimating() const
{
    return false;
}


//==============================================================================
void VirtualKeyboardInputContext::setFocusObject(QObject *object)
{
    static const int NumericInputHints = Qt::ImhPreferNumbers | Qt::ImhDate
        | Qt::ImhTime | Qt::ImhDigitsOnly | Qt::ImhFormattedNumbersOnly;
    static const int DialableInputHints = Qt::ImhDialableCharactersOnly;


    qDebug() << "VirtualKeyboardInputContext::setFocusObject";
    if (!object)
    {
        return;
    }

    // we only support QML at the moment - so if this is not a QML item, then
    // we leave immediatelly
    d->FocusItem = dynamic_cast<QQuickItem*>(object);
    if (!d->FocusItem)
    {
        return;
    }

    // Check if an input control has focus that accepts text input - if not,
    // then we can leave immediatelly
    bool AcceptsInput = d->FocusItem->inputMethodQuery(Qt::ImEnabled).toBool();
    if (!AcceptsInput)
    {
        return;
    }

    // Set input mode depending on input method hints queried from focused
    // object / item
    Qt::InputMethodHints InputMethodHints(d->FocusItem->inputMethodQuery(Qt::ImHints).toInt());
    qDebug() << QString("InputMethodHints: %1").arg(InputMethodHints, 0, 16);
    if (InputMethodHints & DialableInputHints)
    {
        d->InputEngine->setInputMode(DeclarativeInputEngine::Dialable);
    }
    else if (InputMethodHints & NumericInputHints)
    {
        d->InputEngine->setInputMode(DeclarativeInputEngine::Numeric);
    }
    else
    {
        d->InputEngine->setInputMode(DeclarativeInputEngine::Latin);
    }

    // Search for the top most flickable so that we can scroll the control
    // into the visible area, if the keyboard hides the control
    QQuickItem* i = d->FocusItem;
    d->Flickable = 0;
    while (i)
    {
        QQuickFlickable* Flickable = dynamic_cast<QQuickFlickable*>(i);
        if (Flickable)
        {
            d->Flickable = Flickable;
            qDebug() << "is QQuickFlickable";
        }
        i = i->parentItem();
    }

    ensureFocusedObjectVisible();
}


//==============================================================================
void VirtualKeyboardInputContext::ensureFocusedObjectVisible()
{
    // If the keyboard is hidden, no scrollable element exists or the keyboard
    // is just animating, then we leave here
    if (!d->Visible || !d->Flickable || d->InputEngine->isAnimating())
    {
        return;
    }

    qDebug() << "VirtualKeyboardInputContext::ensureFocusedObjectVisible";
    QRectF FocusItemRect(0, 0, d->FocusItem->width(), d->FocusItem->height());
    FocusItemRect = d->Flickable->mapRectFromItem(d->FocusItem, FocusItemRect);
    qDebug() << "FocusItemRect: " << FocusItemRect;
    qDebug() << "Content origin: " << QPointF(d->Flickable->contentX(),
        d->Flickable->contentY());
    qDebug() << "Flickable size: " << QSize(d->Flickable->width(), d->Flickable->height());
    d->FlickableContentScrollAnimation->setTargetObject(d->Flickable);
    qreal ContentY = d->Flickable->contentY();
    if (FocusItemRect.bottom() >= d->Flickable->height())
    {
        qDebug() << "Item outside!!!  FocusItemRect.bottom() >= d->Flickable->height()";
        ContentY = d->Flickable->contentY() + (FocusItemRect.bottom() - d->Flickable->height()) + 20;
        d->FlickableContentScrollAnimation->setEndValue(ContentY);
        d->FlickableContentScrollAnimation->start();
    }
    else if (FocusItemRect.top() < 0)
    {
        qDebug() << "Item outside!!!  d->FocusItem->position().x < 0";
        ContentY = d->Flickable->contentY() + FocusItemRect.top() - 20;
        d->FlickableContentScrollAnimation->setEndValue(ContentY);
        d->FlickableContentScrollAnimation->start();
    }
}


//==============================================================================
QObject* VirtualKeyboardInputContext::inputEngineProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)
    return VirtualKeyboardInputContext::instance()->d->InputEngine;
}

//------------------------------------------------------------------------------
// EOF VirtualKeyboardInpitContext.cpp

