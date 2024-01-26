import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import RegistrationClass 1.0

Window {
    id: reg_wnd
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900
    visible: false
    title: qsTr("Registration")

    signal regWndClose();

    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }

    Rectangle {
        y: 175
        width: parent.width
        height: 78
        color: "transparent"
        Label {
            id: title_txt
            anchors.centerIn: parent
            text: "     SMART\nGREENHOUSE"
            font.pixelSize: 32
            color: "white"
            styleColor: "black"
            style: Text.Outline
        }
    }

    ColumnLayout {
        id: column_1
        spacing: 25
        x: parent.width - width - 40
        y: 278
        width: parent.width - 80
        height: 360
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 34
            border.color: "black"
            color: "white"
            border.width: 1
            Image {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.rightMargin: 17
                height: 33
                width: 33
                source: "qrc:/images/profile2.png"
            }
            TextArea {
                id: login_register_pole
                placeholderText: "ivanov@mail.ru...."
                font.pixelSize: 18
                font.bold: true
                height: parent.height - 20
                width: parent.width - 17 - 33 - 20
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 15
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 34
            border.color: "black"
            color: "white"
            border.width: 1
            Image {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.rightMargin: 17
                height: 33
                width: 33
                source: "qrc:/images/zamok.png"
            }
            TextArea {
                id: pass_register_pole
                placeholderText: "********"
                font.pixelSize: 18
                font.bold: true
                height: parent.height - 20
                width: parent.width - 17 - 33 - 20
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 15
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            radius: 34
            color: "white"
            border.width: 1
            Image {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 17
                anchors.topMargin: 11
                height: 30
                width: 30
                source: "qrc:/images/email.png"
            }
            TextArea {
                id: email_register_pole
                placeholderText: "ivanov@mail.ru"
                font.pixelSize: 18
                font.bold: true
                height: parent.height - 20
                width: parent.width - 17 - 33 - 20
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 15
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            radius: 34
            color: "white"
            border.width: 1
            Image {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 17
                anchors.topMargin: 11
                height: 30
                width: 30
                source: "qrc:/images/tel.png"
            }
            TextArea {
                id: userNumber_register_pole
                placeholderText: "+79518634824"
                font.pixelSize: 18
                font.bold: true
                height: parent.height - 20
                width: parent.width - 17 - 33 - 20
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 15
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            color: create_but.pressed ? "grey" : "#A0A844"
            radius: 34
            Label {
                anchors.centerIn: parent
                font.pixelSize: 24
                color: "white"
                style: Text.Outline
                styleColor: "black"
                text: qsTr("Создать")
            }
            MouseArea {
                id: create_but
                anchors.fill: parent
                onClicked: {
                    user_reg.setNewUserLogin(login_register_pole.text)
                    user_reg.setNewUserPassword(pass_register_pole.text)
                    user_reg.setNewUserMail(email_register_pole.text)
                    user_reg.setNewUserNumber(userNumber_register_pole.text)
                    user_reg.connectToServer()
                    user_reg.sendMessageToServer()
                    login_register_pole.clear()
                    pass_register_pole.clear()
                    email_register_pole.clear()
                    userNumber_register_pole.clear()
                }
            }
        }
    }

    Rectangle {
        y: column_1.y + column_1.height + 20
        width: parent.width - 80
        x: parent.width - width - 40
        height:  20
        color: "transparent"
        Label {
            text: qsTr("Есть аккаунт?")
            font.pixelSize: 16
            color: "white"
            style: Text.Outline
            styleColor: "black"
            anchors.left: parent.left
            anchors.leftMargin: 15
        }
        Label {
            text: qsTr("Войдите в систему")
            font.pixelSize: 16
            color: haveAcc_but.pressed ? "grey" : "#DFC97C"
            anchors.right: parent.right
            anchors.rightMargin: 10
            font.underline: true
            MouseArea {
                id: haveAcc_but
                anchors.fill: parent
                onClicked: {
                    user_reg.disconnectFromHost()
                    regWndClose()
                }
            }
        }
    }
}
