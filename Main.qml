import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Button Panel")
    StackView {
            id: stackView
            anchors.fill: parent
            initialItem: mainPage // 初始页面
        }
    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"

        Column {
            anchors.centerIn: parent
            spacing: 20

            Button {
                id: addressToolButton
                text: qsTr("地址计算工具")
                width: 200
                height: 60
                font.pixelSize: 16
                background: Rectangle {
                    color: "#4a90e2"
                    radius: 5
                }
                contentItem: Text {
                    text: addressToolButton.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    // 跳转到地址计算工具页面
                    stackView.push("qrc:/addressCalculationTool.qml", {message: "Hello"})
                }
            }

            Button {
                width: 200
                height: 60
                background: Rectangle {
                    color: "#50e3c2"
                    radius: 5
                }
            }

            Button {
                width: 200
                height: 60
                background: Rectangle {
                    color: "#e74c3c"
                    radius: 5
                }
            }

            Button {
                width: 200
                height: 60
                background: Rectangle {
                    color: "#f1c40f"
                    radius: 5
                }
            }

            Button {
                width: 200
                height: 60
                background: Rectangle {
                    color: "#9b59b6"
                    radius: 5
                }
            }
        }
    }
}
