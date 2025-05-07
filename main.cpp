#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "address_Tool.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    // 注册C++类型
    qmlRegisterType<address_Tool>("AddressTool", 1, 0, "AddressTool");
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("CodeTool", "Main");

    return app.exec();
}
