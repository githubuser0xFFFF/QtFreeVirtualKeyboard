#ifndef VIRTUALKEYBOARDINPUTCONTEXTPLUGIN_H
#define VIRTUALKEYBOARDINPUTCONTEXTPLUGIN_H
//============================================================================
/// \file   VirtualKeyboardInputContextPlugin.h
/// \author Uwe Kindler
/// \date   08.01.2015
/// \brief  Declaration of VirtualKeyboardInputContextPlugin
///
/// Copyright 2015 Uwe Kindler
/// Licensed under MIT see LICENSE.MIT in project root
//============================================================================

//============================================================================
//                                 INCLUDES
//============================================================================
#include "virtualkeyboard_global.h"
#include <qpa/qplatforminputcontextplugin_p.h>

/**
 * Implementation of QPlatformInputContextPlugin
 */
class VirtualKeyboardInputContextPlugin : public QPlatformInputContextPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QPlatformInputContextFactoryInterface_iid FILE "freevirtualkeyboard.json")

public:
    QPlatformInputContext *create(const QString&, const QStringList&);
};  // class VirtualKeyboardInputContextPlugin

//------------------------------------------------------------------------------
#endif // VIRTUALKEYBOARDINPUTCONTEXTPLUGIN_H
