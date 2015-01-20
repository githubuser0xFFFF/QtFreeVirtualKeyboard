#ifndef VIRTUALKEYBOARDINPUTCONTEXT_H
#define VIRTUALKEYBOARDINPUTCONTEXT_H
//============================================================================
/// \file   VirtualKeyboardInputContext.h
/// \author Uwe Kindler
/// \date   08.01.2015
/// \brief  Declaration of VirtualKeyboardInputContext
//============================================================================

//============================================================================
//                                 INCLUDES
//============================================================================
#include <QRectF>
#include <qpa/qplatforminputcontext.h>


//============================================================================
//                             FORWARD DECLARATIONS
//============================================================================
class QQmlEngine;
class QJSEngine;
class VirtualKeyboardInputContextPrivate;


/**
 * Implementation of QPlatformInputContext
 */
class VirtualKeyboardInputContext : public QPlatformInputContext
{
    Q_OBJECT
private:
    /**
     * The input contet creates the InputEngine object and provides it
     * as a singleton to the QML context
     */
    static QObject* inputEngineProvider(QQmlEngine *engine, QJSEngine *scriptEngine);

protected:
    /**
     * Protected constructor - use instance function to get the one and only
     * object
     */
    VirtualKeyboardInputContext();

public:
    /**
     * Virtual destructor
     */
    virtual ~VirtualKeyboardInputContext();

    /**
     * Returns input context validity. Deriving implementations should
     * return true - so we simply return true
     */
    virtual bool isValid() const;

    /**
     * This function can be reimplemented to return virtual keyboard rectangle
     * in currently active window coordinates. Default implementation returns
     * invalid rectangle.
     */
    virtual QRectF keyboardRect() const;

    /**
     * Simply calls the emitInputPanelVisibleChanged() function
     */
    virtual void showInputPanel();

    /**
     * Simply calls the emitInputPanelVisibleChanged() function
     */
    virtual void hideInputPanel();

    /**
     * Returns input panel visibility status.
     * This value will be available in QGuiApplication::inputMethod()->isVisible()
     */
    virtual bool isInputPanelVisible() const;

    /**
     * This function returns true whenever input method is animating
     * shown or hidden.
     */
    virtual bool isAnimating() const;

    /**
     * This virtual method gets called to notify updated focus to object.
     * \warning Input methods must not call this function directly.
     * This function does the main work. It sets the input mode of the
     * InputEngine singleton and it ensures that the focused QML object is
     * visible if it is a child item of a Flickable
     */
    virtual void setFocusObject(QObject *object);

    /**
     * Use this static instance function to access the singleton input context
     * instance
     */
    static VirtualKeyboardInputContext* instance();

private:
    VirtualKeyboardInputContextPrivate *d;

private slots:
    /**
     * This function scrolls the QML item into visible area if the focused
     * QML item is child of a flickable
     */
    void ensureFocusedObjectVisible();
}; // VirtualKeyboardInputContext

//------------------------------------------------------------------------------
#endif // VIRTUALKEYBOARDINPUTCONTEXT_H
