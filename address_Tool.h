// address_tool.h
#ifndef ADDRESS_TOOL_H
#define ADDRESS_TOOL_H

#include <QObject>
#include <QStringList>

class address_Tool : public QObject
{
    Q_OBJECT
public:
    explicit address_Tool(QObject *parent = nullptr);

signals:
    void conversionCompleted(const QString &result); // 转换完成信号

public slots:
    void processConversion(const QString &startAddress,
                           const QString &inputText,
                           const QString &conversionType);
};

#endif // ADDRESS_TOOL_H
