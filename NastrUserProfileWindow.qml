import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import NewUserProfileData 1.0

Window {
    id: tune_userProfile_window
    visible: false
    title: qsTr("Tune you prifile")
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900

    signal buttonBackClicked()
    signal newCorrectProfileData(var loGin, var pasSword, var mAil , var numBer)
    signal newLogin(var newLog)

    property string login;
    property string password;
    property string mail;
    property string number;

    property string globalLogin;


    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }

    NewUserProfileData
    {
        id: new_user_profData_1
        onCurrentNewProfileData:
        {
          //  tune_userProfile_window.newLogin(new_login)
            newCorrectProfileData(new_login,new_password,new_mail, new_number)
        }
        onNewUserDataBad:
        {
            err_window.show()
        }
    }

    Rectangle {
        anchors.top: parent.top
        color: "#BFC250"
        border.color: "black"
        width: parent.width
        height: 109
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

    Rectangle {
        width: parent.width
        height: 30
        y: 158
        color: "transparent"
        Label {
            anchors.centerIn: parent
            text: qsTr("Настройка профиля")
            font.pixelSize: 24
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
    }

    ColumnLayout {
        id: column_1
        width: parent.width - 50
        x: parent.width - width - 25
        height:  parent.height - 267 - 140
        y: parent.height - height - 207
        spacing: 10
        Label {
            text: qsTr("Имя:")
            font.pixelSize: 20
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            radius: 17
            color: "white"
            border.width: 1
            TextArea {
                id: newUser_login_pole
                height: parent.height - 15
                width: parent.width - 20
                anchors.centerIn: parent
                font.bold: true
                placeholderText: "Ivanov...."
                font.pixelSize: 20
            }
        }
        Label {
            text: qsTr("Пароль:")
            font.pixelSize: 20
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            radius: 17
            color: "white"
            border.width: 1
            TextArea {
                id: newUser_password_pole
                height: parent.height - 15
                width: parent.width - 20
                anchors.centerIn: parent
                font.bold: true
                placeholderText: "12345678...."
                font.pixelSize: 20
            }
        }
        Label {
            text: qsTr("Почта:")
            font.pixelSize: 20
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            radius: 17
            color: "white"
            border.width: 1
            TextArea {
                id: newUser_mail_pole
                height: parent.height - 15
                font.bold: true
                width: parent.width - 20
                anchors.centerIn: parent
                placeholderText: "Ivanov@mail.ru...."
                font.pixelSize: 20
            }
        }
        Label {
            text: qsTr("Телефон:")
            font.pixelSize: 20
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            radius: 17
            color: "white"
            border.width: 1
            TextArea {
                id: newUser_number_pole
                height: parent.height - 15
                width: parent.width - 20
                font.bold: true
                anchors.centerIn: parent
                placeholderText: "+79518634824...."
                font.pixelSize: 20
            }
        }
    }

    RowLayout {
        id: row_1
        width: parent.width - 60
        height: 55
        x: parent.width - width - 30
        y: column_1.y + column_1.height + 20
        spacing: 29
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 31
            border.color: "black"
            color: saveNewProfilData_button.pressed ? "grey" : "#CED12F"
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 38
                anchors.top: parent.top
                anchors.topMargin: 15
                text: qsTr("Сохр")
                font.pixelSize: 16
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.top: parent.top
                anchors.topMargin: 17
                height: 21
                width: 21
                source: "qrc:/images/save_button.png"
            }
            MouseArea {
                id: saveNewProfilData_button
                anchors.fill: parent
                onClicked:
                {
                    if(newUser_login_pole.text !== "")
                    {
                        new_user_profData_1.setNewUserLogin(newUser_login_pole.text)
                    }
                    else {
                        new_user_profData_1.setNewUserLogin(login)
                    }
                    if(newUser_password_pole.text !== "")
                    {
                        new_user_profData_1.setNewUserPass(newUser_password_pole.text)
                    }
                    else {
                        new_user_profData_1.setNewUserPass(password)
                    }
                    if(newUser_mail_pole.text !== "")
                    {
                        new_user_profData_1.setNewUserMail(newUser_mail_pole.text)
                    }
                    else {
                        new_user_profData_1.setNewUserMail(mail)
                    }
                    if(newUser_number_pole.text !== "")
                    {
                        new_user_profData_1.setNewUserNumber(newUser_number_pole.text)
                    }
                    else
                    {
                        new_user_profData_1.setNewUserNumber(number)
                    }
                    new_user_profData_1.sendNewProfileData(globalLogin)
                    newUser_login_pole.clear()
                    newUser_password_pole.clear()
                    newUser_mail_pole.clear()
                    newUser_number_pole.clear()
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 31
            border.color: "black"
            color: back_button.pressed ? "grey" : "#CB8646"
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 34
                anchors.top: parent.top
                anchors.topMargin: 15
                text: qsTr("Назад")
                font.pixelSize: 16
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 84
                anchors.top: parent.top
                anchors.topMargin: 17
                height: 21
                width: 21
                source: "qrc:/images/back.png"
            }
            MouseArea {
                id: back_button
                anchors.fill: parent
                onClicked: {
                    buttonBackClicked()
                    newUser_login_pole.clear()
                    newUser_password_pole.clear()
                    newUser_mail_pole.clear()
                }
            }
        }
    }
}
