import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    id: add_green_window
    visible: false
    title: qsTr("Add new Greenhouse")
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900

    signal backButtonClicked()

    property string globalLogin;

    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }

    Rectangle {
        anchors.top: parent.top
        width: parent.width
        height: 109
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
    }

    ColumnLayout {
        id: column_1
        height: parent.height - 276 - 209
        width: parent.width - 48
        x: parent.width - width - 24
        y: 209
        Label {
            text: qsTr("Название теплицы:")
            font.pixelSize: 24
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "white"
            radius: 15
            border.color: "black"
            border.width: 1
            TextArea {
                id: newNameHouse_pole
                height: parent.height - 10
                width: parent.width - 20
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                placeholderText: "Теплицa номер 1...."
            }
        }
        Label {
            text: qsTr("Идентификатор:")
            font.pixelSize: 24
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 15
            color: "white"
            border.color: "black"
            border.width: 1
            TextArea {
                id: newHouseIDentif_pole
                height: parent.height - 10
                width: parent.width - 20
                font.bold: true
                anchors.centerIn: parent
                font.pixelSize: 20
                placeholderText: "122222233333...."
            }
        }
        Label {
            text: qsTr("Комментарий:")
            font.pixelSize: 24
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 15
            color: "white"
            border.color: "black"
            border.width: 1
            TextArea {
                id: newHouseComment_pole
                height: parent.height - 10
                width: parent.width - 20
                anchors.centerIn: parent
                font.pixelSize: 20
                font.bold: true
                placeholderText: "Здесь помидоры...."
            }
        }
    }

    RowLayout {
        x: parent.width - width - 24
        width: parent.width - 48
        height:  50
        y: column_1.y + column_1.height + 20
        spacing: 20
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 20
            border.color: "black"
            color: add_newHouse_but.pressed ? "grey" : "#CED12F"
            MouseArea {
                id: add_newHouse_but
                anchors.fill: parent
                onClicked: {
                    green_model.setNewHouseName(newNameHouse_pole.text)
                    green_model.setNewHouseMac(newHouseIDentif_pole.text)
                    green_model.setNewHouseCommend(newHouseComment_pole.text)
                    green_model.sendNewGreenDataToServer(globalLogin)
                    newNameHouse_pole.clear()
                    newHouseIDentif_pole.clear()
                    newHouseComment_pole.clear()
                }
            }
            Label {
                anchors.left: parent.left
                font.pixelSize: 16
                anchors.leftMargin: 23
                anchors.top: parent.top
                anchors.topMargin: 13
                text: qsTr("Добавить")
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            Image {
                anchors.right: parent.right
                anchors.rightMargin: 25
                anchors.top: parent.top
                anchors.topMargin: 14
                width: 21
                height: 21
                source: "qrc:/images/add_button.png"
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 20
            border.color: "black"
            color: backToMain_but.pressed ? "grey" : "#CB8646"
            MouseArea {
                id: backToMain_but
                anchors.fill: parent
                onClicked: backButtonClicked()
            }
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 23
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.topMargin: 13
                text: qsTr("Вернуться")
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            Image {
                anchors.right: parent.right
                anchors.rightMargin: 25
                anchors.top: parent.top
                anchors.topMargin: 14
                width: 21
                height: 21
                source: "qrc:/images/back.png"
            }
        }
    }
}
