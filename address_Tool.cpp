// address_tool.cpp
#include "address_Tool.h"
#include <QRegularExpression>

address_Tool::address_Tool(QObject *parent)
    : QObject(parent)
{
}

void address_Tool::processConversion(const QString &startAddress,
                                     const QString &inputText,
                                     const QString &conversionType)
{
    QStringList outputLines;
    bool ok;

    // 解析起始地址（支持十六进制和十进制）
    QString tempStartAddress = startAddress;//创建副本
    const uint baseAddress = tempStartAddress.replace("0x", "").toUInt(&ok, 16);

    if(!ok) {
        emit conversionCompleted("错误：无效的起始地址格式");
        return;
    }

    // 分割输入文本为行
    QStringList inputLines = inputText.split("\n", Qt::SkipEmptyParts);

    // 地址计数器
    uint currentAddress = baseAddress;

    // 处理每一行
    for(const QString &line : inputLines) {
        QString trimmedLine = line.trimmed();

        if(trimmedLine.isEmpty()) continue;

        // 生成带地址的行
        QString newLine = QString("%1 // 0x%2")
                              .arg(trimmedLine)
                              .arg(currentAddress, 0, 16)
                              .toUpper();

        outputLines << newLine;

        // 根据变量类型计算地址增量（这里假设uint16_t占2字节）
        if(trimmedLine.contains("uint16_t")) {
            currentAddress += 2;
        } else if(trimmedLine.contains("uint32_t")) {
            currentAddress += 4;
        } else {
            currentAddress += 1; // 默认1字节
        }
    }

    emit conversionCompleted(outputLines.join("\n"));
}
