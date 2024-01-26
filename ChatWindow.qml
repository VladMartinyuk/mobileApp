import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    id: chat_window
    visible: false
    title: qsTr("Chat")
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900

    signal butBackClicked()

    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }

    Rectangle {
        height: 109
        width: parent.width
        color: "#BFC250"
        border.color: "black"
        Label {
            id: title_txt
            anchors.centerIn: parent
            text: "     SMART\nGREENHOUSE"
            font.pixelSize: 24
            color: "white"
            styleColor: "black"
            style: Text.Outline
        }
        Image {
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 12
            height: 63
            width: 63
            source: "qrc:/images/back.png"
            MouseArea {
                id: backToMain_but
                anchors.fill: parent
                onClicked: butBackClicked()
            }
        }
    }

    Rectangle {
        width: parent.width - 95 - 12
        height:  64
        y: parent.height - height - 19
        x: parent.width - width - 95
        color: "white"
        border.color: "black"
        TextArea {
            id: message_pole
            width: parent.width - 10
            height: parent.height - 20
            x: parent.width - 5 - width
            y: parent.height - 5 - height
            placeholderText: "Введите ваше сообщение..."
            font.pixelSize: 16
        }
    }

    Rectangle {
        width:  74
        height:  64
        x: parent.width - width - 9
        y: parent.height - 20 - height
        radius: 12
        border.color: "black"
        color: sendMessage_button.pressed ? "grey" : "#D1CB90"
        Image {
            anchors.centerIn: parent
            width: 46
            height: 46
            source: "qrc:/images/send.png"
        }
        MouseArea {
            id: sendMessage_button
            anchors.fill: parent

        }
    }
}
