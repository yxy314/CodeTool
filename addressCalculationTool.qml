import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import AddressTool 1.0
ApplicationWindow {
    width: 800
    height: 600
    visible: true
    title: "高级文本转换器"

    ColumnLayout {
        anchors.fill: parent
        spacing: 15
        anchors.margins: 15

        // 顶部控制栏
        RowLayout {
            Layout.fillWidth: true
            spacing: 20

            // 开始地址输入
            LabeledField {
                label: "开始地址："
                fieldWidth: 200
                placeholder: "请输入起始地址..."
            }

            // 转换类型选择
            LabeledComboBox {
                id:typeComboBox
                label: "转换类型："
                model: ["uint8_t", "uint16_t", "uint32_t", "uint64_t"]
                currentIndex: 0
            }
        }

        // 主内容区域
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 15

            // 输入文本区域
            TextArea {
                id: inputArea
                Layout.fillWidth: true
                Layout.fillHeight: true
                placeholderText: "请输入需要转换的文本..."
                font.pixelSize: 14
                wrapMode: Text.Wrap
                background: Rectangle {
                    border.color: "#cccccc"
                    radius: 5
                }
            }

            // 输出文本区域
            TextArea {
                id: outputArea
                Layout.fillWidth: true
                Layout.fillHeight: true
                readOnly: true
                placeholderText: "转换结果..."
                font.pixelSize: 14
                wrapMode: Text.Wrap
                background: Rectangle {
                    border.color: "#cccccc"
                    radius: 5
                }
            }
        }

        // 转换按钮
        Button {
            Layout.alignment: Qt.AlignCenter
            text: "开始转换"
            font {
                pixelSize: 16
                bold: true
            }
            padding: 15
            background: Rectangle {
                color: parent.down ? "#45a049" : "#4CAF50"
                radius: 8
            }
            contentItem: Text {
                text: parent.text
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                // 根据选择的转换类型执行不同操作
                switch(typeComboBox.model[typeComboBox.currentIndex]) {
                case "uint8_t":

                    break
                case "uint16_t":
                    outputArea.text = inputArea.text.toUpperCase()
                    break
                case "uint32_t":

                    break
                case "uint64_t":

                    break
                }
            }
        }
    }

    // 自定义带标签的输入框组件
    component LabeledField: ColumnLayout {
        property alias text: field.text
        property string label: ""
        property string placeholder: ""
        property int fieldWidth: 200

        spacing: 5

        Label {
            text: parent.label
            font.bold: true
        }

        TextField {
            id: field
            Layout.preferredWidth: fieldWidth
            placeholderText: parent.placeholder
            font.pixelSize: 14
        }
    }

    // 自定义带标签的下拉框组件
    component LabeledComboBox: ColumnLayout {
        property alias currentIndex: comboBox.currentIndex
        property alias currentValue: comboBox.currentText
        property string label: ""
        property var model: []

        spacing: 5

        Label {
            text: parent.label
            font.bold: true
        }

        ComboBox {
            id: comboBox
            Layout.preferredWidth: 150
            model: parent.model
            font.pixelSize: 14
        }
    }
}
