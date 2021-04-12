/****************************************************************************
** Meta object code from reading C++ file 'DeclarativeInputEngine.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "DeclarativeInputEngine.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'DeclarativeInputEngine.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_DeclarativeInputEngine_t {
    QByteArrayData data[27];
    char stringdata0[348];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DeclarativeInputEngine_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DeclarativeInputEngine_t qt_meta_stringdata_DeclarativeInputEngine = {
    {
QT_MOC_LITERAL(0, 0, 22), // "DeclarativeInputEngine"
QT_MOC_LITERAL(1, 23, 24), // "keyboardRectangleChanged"
QT_MOC_LITERAL(2, 48, 0), // ""
QT_MOC_LITERAL(3, 49, 16), // "animatingChanged"
QT_MOC_LITERAL(4, 66, 16), // "inputModeChanged"
QT_MOC_LITERAL(5, 83, 17), // "animatingFinished"
QT_MOC_LITERAL(6, 101, 16), // "virtualKeyCancel"
QT_MOC_LITERAL(7, 118, 15), // "virtualKeyClick"
QT_MOC_LITERAL(8, 134, 7), // "Qt::Key"
QT_MOC_LITERAL(9, 142, 3), // "key"
QT_MOC_LITERAL(10, 146, 4), // "text"
QT_MOC_LITERAL(11, 151, 21), // "Qt::KeyboardModifiers"
QT_MOC_LITERAL(12, 173, 9), // "modifiers"
QT_MOC_LITERAL(13, 183, 15), // "virtualKeyPress"
QT_MOC_LITERAL(14, 199, 6), // "repeat"
QT_MOC_LITERAL(15, 206, 17), // "virtualKeyRelease"
QT_MOC_LITERAL(16, 224, 18), // "sendKeyToFocusItem"
QT_MOC_LITERAL(17, 243, 7), // "keyText"
QT_MOC_LITERAL(18, 251, 20), // "setKeyboardRectangle"
QT_MOC_LITERAL(19, 272, 4), // "Rect"
QT_MOC_LITERAL(20, 277, 17), // "keyboardRectangle"
QT_MOC_LITERAL(21, 295, 9), // "animating"
QT_MOC_LITERAL(22, 305, 9), // "inputMode"
QT_MOC_LITERAL(23, 315, 9), // "InputMode"
QT_MOC_LITERAL(24, 325, 5), // "Latin"
QT_MOC_LITERAL(25, 331, 7), // "Numeric"
QT_MOC_LITERAL(26, 339, 8) // "Dialable"

    },
    "DeclarativeInputEngine\0keyboardRectangleChanged\0"
    "\0animatingChanged\0inputModeChanged\0"
    "animatingFinished\0virtualKeyCancel\0"
    "virtualKeyClick\0Qt::Key\0key\0text\0"
    "Qt::KeyboardModifiers\0modifiers\0"
    "virtualKeyPress\0repeat\0virtualKeyRelease\0"
    "sendKeyToFocusItem\0keyText\0"
    "setKeyboardRectangle\0Rect\0keyboardRectangle\0"
    "animating\0inputMode\0InputMode\0Latin\0"
    "Numeric\0Dialable"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DeclarativeInputEngine[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       3,   98, // properties
       1,  110, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   64,    2, 0x06 /* Public */,
       3,    0,   65,    2, 0x06 /* Public */,
       4,    0,   66,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    0,   67,    2, 0x08 /* Private */,
       6,    0,   68,    2, 0x0a /* Public */,
       7,    3,   69,    2, 0x0a /* Public */,
      13,    4,   76,    2, 0x0a /* Public */,
      15,    3,   85,    2, 0x0a /* Public */,
      16,    1,   92,    2, 0x0a /* Public */,
      18,    1,   95,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Bool, 0x80000000 | 8, QMetaType::QString, 0x80000000 | 11,    9,   10,   12,
    QMetaType::Bool, 0x80000000 | 8, QMetaType::QString, 0x80000000 | 11, QMetaType::Bool,    9,   10,   12,   14,
    QMetaType::Bool, 0x80000000 | 8, QMetaType::QString, 0x80000000 | 11,    9,   10,   12,
    QMetaType::Void, QMetaType::QString,   17,
    QMetaType::Void, QMetaType::QRect,   19,

 // properties: name, type, flags
      20, QMetaType::QRect, 0x00495903,
      21, QMetaType::Bool, 0x00495903,
      22, QMetaType::Int, 0x00495903,

 // properties: notify_signal_id
       0,
       1,
       2,

 // enums: name, alias, flags, count, data
      23,   23, 0x0,    3,  115,

 // enum data: key, value
      24, uint(DeclarativeInputEngine::Latin),
      25, uint(DeclarativeInputEngine::Numeric),
      26, uint(DeclarativeInputEngine::Dialable),

       0        // eod
};

void DeclarativeInputEngine::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<DeclarativeInputEngine *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->keyboardRectangleChanged(); break;
        case 1: _t->animatingChanged(); break;
        case 2: _t->inputModeChanged(); break;
        case 3: _t->animatingFinished(); break;
        case 4: _t->virtualKeyCancel(); break;
        case 5: { bool _r = _t->virtualKeyClick((*reinterpret_cast< Qt::Key(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< Qt::KeyboardModifiers(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 6: { bool _r = _t->virtualKeyPress((*reinterpret_cast< Qt::Key(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< Qt::KeyboardModifiers(*)>(_a[3])),(*reinterpret_cast< bool(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 7: { bool _r = _t->virtualKeyRelease((*reinterpret_cast< Qt::Key(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< Qt::KeyboardModifiers(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 8: _t->sendKeyToFocusItem((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 9: _t->setKeyboardRectangle((*reinterpret_cast< const QRect(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (DeclarativeInputEngine::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DeclarativeInputEngine::keyboardRectangleChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (DeclarativeInputEngine::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DeclarativeInputEngine::animatingChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (DeclarativeInputEngine::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&DeclarativeInputEngine::inputModeChanged)) {
                *result = 2;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<DeclarativeInputEngine *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QRect*>(_v) = _t->keyboardRectangle(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->isAnimating(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->inputMode(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<DeclarativeInputEngine *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setKeyboardRectangle(*reinterpret_cast< QRect*>(_v)); break;
        case 1: _t->setAnimating(*reinterpret_cast< bool*>(_v)); break;
        case 2: _t->setInputMode(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject DeclarativeInputEngine::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_DeclarativeInputEngine.data,
    qt_meta_data_DeclarativeInputEngine,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *DeclarativeInputEngine::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DeclarativeInputEngine::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_DeclarativeInputEngine.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int DeclarativeInputEngine::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void DeclarativeInputEngine::keyboardRectangleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void DeclarativeInputEngine::animatingChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void DeclarativeInputEngine::inputModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
