#include "VirtualKeyboardInputContextPlugin.h"
#include "VirtualKeyboardInputContext.h"
//============================================================================
/// \file   VirtualKeyboardInputContextPlugin.cpp
/// \author Uwe Kindler
/// \date   08.01.2015
/// \brief  Implementation of VirtualKeyboardInputContextPlugin
//============================================================================

//============================================================================
//                                 INCLUDES
//============================================================================
#include <QDebug>


//============================================================================
QPlatformInputContext* VirtualKeyboardInputContextPlugin::create(const QString& system, const QStringList& paramList)
{
    Q_UNUSED(paramList);

    qDebug() << "VirtualKeyboardInputContextPlugin::create: " << system;
    if (system.compare(system, QStringLiteral("qtvirtualkeyboard"), Qt::CaseInsensitive) == 0)
    {
        return VirtualKeyboardInputContext::instance();
    }
    return 0;
}


//------------------------------------------------------------------------------
// EOF VirtualInputContextPlugin.cpp
