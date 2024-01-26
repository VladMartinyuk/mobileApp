import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import NewUserProfileData 1.0

Window {
    id: userProfile_window
    visible: false
    title: qsTr("Profile")
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900

    property string userLogin;
    property string userPassword;
    property string userMail;
    property string userNumber;

    signal buttonLogOutClicked()
    signal buttonOkClicked()

    property string globalLogin;


    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }

    NastrUserProfileWindow {
        id: tune_userProfile_wnd
        onButtonBackClicked:
        {
            tune_userProfile_wnd.close()
            userProfile_window.show()
        }
        onNewCorrectProfileData:
        {
            console.log(loGin,pasSword,mAil)
            userLogin = loGin
            userPassword = pasSword
            userMail = mAil
            userNumber = numBer
            tune_userProfile_wnd.close()
            userProfile_window.show()
        }
    }

    Rectangle {
        width: 40
        height: 40
        radius: 14
        x: parent.width - width - 33
        y: 138
        border.color: "black"
        color: nastr_profile_button.pressed ? "grey" : "#D7B53E"
        Image {
            height: 26
            width: 26
            anchors.centerIn: parent
            source: "qrc:/images/nastr.png"
        }
        MouseArea {
            id: nastr_profile_button
            anchors.fill: parent
            onClicked:
            {
                tune_userProfile_wnd.login = userLogin
                tune_userProfile_wnd.password = userPassword
                tune_userProfile_wnd.mail = userMail
                tune_userProfile_wnd.number = userNumber
                tune_userProfile_wnd.globalLogin = globalLogin
                userProfile_window.hide()
                tune_userProfile_wnd.show()
            }
        }
    }

    Rectangle {
        color: "#BFC250"
        width: parent.width
        height: 109
        border.color: "black"
        border.width: 1
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
        color: "transparent"
        width: parent.width
        height: 110
        y: 138
        Image {
            anchors.centerIn: parent
            width: 120
            height: 120
            source: "qrc:/images/profile_image.png"
        }
    }

    Rectangle {
        color: "transparent"
        width: parent.width
        height: 30
        y: 261
        Label {
            anchors.centerIn: parent
            text: qsTr("Профиль")
            color: "white"
            style: Text.Outline
            styleColor: "black"
            font.pixelSize: 24
        }
    }

    ColumnLayout {
        id: column_1
        width:  parent.width - 60
        x: parent.width - width - 30
        height: parent.height - 180 - 312
        y: parent.height - height - 180
        spacing: 27
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 17
            color: "#C9D0BE"
            border.color: "black"
            border.width: 1
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 17
                anchors.top: parent.top
                anchors.topMargin: 15
                text: qsTr("Имя:")
                font.pixelSize: 20
                color: "black"
            }
            Rectangle {
                width: parent.width - 25 - 46
                x: parent.width - 10 - width
                y: parent.height - height - 12
                height: parent.height - 25
                color: "transparent"
                Label {
                    id: user_login_profile
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "black"
                    text: userLogin
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 17
            color: "#C9D0BE"
            border.color: "black"
            border.width: 1
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 17
                anchors.top: parent.top
                anchors.topMargin: 13
                text: qsTr("Пароль:")
                font.pixelSize: 20
                color: "black"
            }
            Rectangle {
                width: parent.width - 25 - 46
                x: parent.width - 10 - width
                y: parent.height - height - 12
                height: parent.height - 25
                color: "transparent"
                Label {
                    id: user_password_profile
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "black"
                    text: userPassword
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 17
            color: "#C9D0BE"
            border.color: "black"
            border.width: 1
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 17
                anchors.top: parent.top
                anchors.topMargin: 15
                text: qsTr("Почта:")
                font.pixelSize: 20
                color: "black"
            }
            Rectangle {
                width: parent.width - 25 - 46
                x: parent.width - 10 - width
                y: parent.height - height - 12
                height: parent.height - 25
                color: "transparent"
                Label {
                    id: user_email_profile
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "black"
                    text: userMail
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 17
            color: "#C9D0BE"
            border.color: "black"
            border.width: 1
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 17
                anchors.top: parent.top
                anchors.topMargin: 13
                text: qsTr("Телефон:")
                font.pixelSize: 20
                color: "black"
            }
            Rectangle {
                width: parent.width - 25 - 46
                x: parent.width - 10 - width
                y: parent.height - height - 12
                height: parent.height - 25
                color: "transparent"
                Label {
                    id: user_number_profile
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "black"
                    text: userNumber
                }
            }
        }
    }

    RowLayout {
        id: row_1
        height: 55
        width: parent.width - 62
        x: parent.width - width - 31
        y: column_1.y + column_1.height + 20
        spacing: 29
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 31
            border.color: "black"
            color: ok_button.pressed ? "grey" : "#CED12F"
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 52
                anchors.top: parent.top
                anchors.topMargin: 15
                text: qsTr("Ок")
                font.pixelSize: 16
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 79
                anchors.top: parent.top
                anchors.topMargin: 13
                height: 30
                width: 23
                source: "qrc:/images/ok_button.png"
            }
            MouseArea {
                id: ok_button
                anchors.fill: parent
                onClicked: buttonOkClicked()
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 31
            border.color: "black"
            color: logOut_button.pressed ? "grey" : "#CB8646"
            Label {
                anchors.left: parent.left
                anchors.leftMargin: 36
                anchors.top: parent.top
                anchors.topMargin: 15
                text: qsTr("Выйти")
                font.pixelSize: 16
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 85
                anchors.top: parent.top
                anchors.topMargin: 17
                height: 21
                width: 21
                source: "qrc:/images/logOut_button.png"
            }
            MouseArea {
                id: logOut_button
                anchors.fill: parent
                onClicked: {
                    user_reg.disconnectFromHost()
                    buttonLogOutClicked()
                }
            }
        }
    }
}
