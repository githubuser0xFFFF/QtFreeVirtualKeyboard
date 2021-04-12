/****************************************************************************
** Meta object code from reading C++ file 'VirtualKeyboardInputContextPlugin.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "VirtualKeyboardInputContextPlugin.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/qplugin.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'VirtualKeyboardInputContextPlugin.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_VirtualKeyboardInputContextPlugin_t {
    QByteArrayData data[1];
    char stringdata0[34];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_VirtualKeyboardInputContextPlugin_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_VirtualKeyboardInputContextPlugin_t qt_meta_stringdata_VirtualKeyboardInputContextPlugin = {
    {
QT_MOC_LITERAL(0, 0, 33) // "VirtualKeyboardInputContextPl..."

    },
    "VirtualKeyboardInputContextPlugin"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_VirtualKeyboardInputContextPlugin[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

void VirtualKeyboardInputContextPlugin::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject VirtualKeyboardInputContextPlugin::staticMetaObject = { {
    QMetaObject::SuperData::link<QPlatformInputContextPlugin::staticMetaObject>(),
    qt_meta_stringdata_VirtualKeyboardInputContextPlugin.data,
    qt_meta_data_VirtualKeyboardInputContextPlugin,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *VirtualKeyboardInputContextPlugin::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *VirtualKeyboardInputContextPlugin::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_VirtualKeyboardInputContextPlugin.stringdata0))
        return static_cast<void*>(this);
    return QPlatformInputContextPlugin::qt_metacast(_clname);
}

int VirtualKeyboardInputContextPlugin::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QPlatformInputContextPlugin::qt_metacall(_c, _id, _a);
    return _id;
}

QT_PLUGIN_METADATA_SECTION
static constexpr unsigned char qt_pluginMetaData[] = {
    'Q', 'T', 'M', 'E', 'T', 'A', 'D', 'A', 'T', 'A', ' ', '!',
    // metadata version, Qt version, architectural requirements
    0, QT_VERSION_MAJOR, QT_VERSION_MINOR, qPluginArchRequirements(),
    0xbf, 
    // "IID"
    0x02,  0x78,  0x3b,  'o',  'r',  'g',  '.',  'q', 
    't',  '-',  'p',  'r',  'o',  'j',  'e',  'c', 
    't',  '.',  'Q',  't',  '.',  'Q',  'P',  'l', 
    'a',  't',  'f',  'o',  'r',  'm',  'I',  'n', 
    'p',  'u',  't',  'C',  'o',  'n',  't',  'e', 
    'x',  't',  'F',  'a',  'c',  't',  'o',  'r', 
    'y',  'I',  'n',  't',  'e',  'r',  'f',  'a', 
    'c',  'e',  '.',  '5',  '.',  '1', 
    // "className"
    0x03,  0x78,  0x21,  'V',  'i',  'r',  't',  'u', 
    'a',  'l',  'K',  'e',  'y',  'b',  'o',  'a', 
    'r',  'd',  'I',  'n',  'p',  'u',  't',  'C', 
    'o',  'n',  't',  'e',  'x',  't',  'P',  'l', 
    'u',  'g',  'i',  'n', 
    // "MetaData"
    0x04,  0xa1,  0x64,  'K',  'e',  'y',  's',  0x81, 
    0x73,  'f',  'r',  'e',  'e',  'v',  'i',  'r', 
    't',  'u',  'a',  'l',  'k',  'e',  'y',  'b', 
    'o',  'a',  'r',  'd', 
    0xff, 
};
QT_MOC_EXPORT_PLUGIN(VirtualKeyboardInputContextPlugin, VirtualKeyboardInputContextPlugin)

QT_WARNING_POP
QT_END_MOC_NAMESPACE
