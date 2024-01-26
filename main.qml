import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import AuthorizationClass 1.0
import GreenHousesModel 1.0
import RegistrationClass

Window {
    id: auth_wnd
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900
    visible: true
    title: qsTr("Authorization")

    property string globalLogin;

    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }


    RegistrarionWindow {
        id: reg_wnd
        onRegWndClose:
        {
            auth_wnd.show()
            reg_wnd.close()
        }
    }

    ErrorAuthorizationWindow
    {
        id: err_auth_wnd
        onCloseSignal:
        {
            user_auth.disconnectHost()
            err_auth_wnd.close()
        }
    }

    MainWindow {
        id: main_wnd
        onAkkLogOut:
        {
            main_wnd.tempPokaz = ""
            main_wnd.waterPokaz = ""
            main_wnd.tempPokaz = ""
            main_wnd.nameOfHouse = ""
            auth_wnd.show()
            main_wnd.close()
        }
    }

    AuthotizationClass {
        id: user_auth
        onUserVoshel: {
            main_wnd.show()
            green_model.getCurrentHousesNames(globalLogin)
            main_wnd.globalLogin = globalLogin
            auth_wnd.hide()
        }
        onUserNeVochel: {
            err_auth_wnd.show()
        }
    }

    RegistrationClass {
        id: user_reg
        onRegisterSuccess:
        {
            sucess_reg_window.show()
        }
        onRegisterUnsuccess:
        {
            err_window.show()
        }
    }

    ErrorWindow {
        id: err_window
    }

    SuccessRegWindow
    {
        id: sucess_reg_window
    }

    GreenHousesModel {
        id: green_model
        onNewGreenHouseAdded: {
            main_wnd.newGreenHouse()
        }
        onGivenCurrentSensors:
        {
            main_wnd.waterPokaz = water
            main_wnd.tempPokaz = temp
            main_wnd.sunPokaz = svet
        }
        onNewSensorGood: {
            main_wnd.sunPokaz = new_svet
            main_wnd.waterPokaz = new_water
            main_wnd.tempPokaz = new_temp
            main_wnd.newSensors()
        }
        onNewGreenHouseDontAdded: err_window.show()
        onNewModelHouses: {
            main_wnd.newModel(newModel);
        }
        onModelChanged: {
            main_wnd.modelAfterCansel()
        }
        onDeleteSuccess:
        {
            main_wnd.deleteHouseSignal()
        }
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
        height: 205
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 34
            border.color: "black"
            color: "white"
            border.width:  1
            TextArea {
                id: login_pole
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
            Image {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.rightMargin: 17
                height: 33
                width: 33
                source: "qrc:/images/profile2.png"
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
                id: pass_pole
                placeholderText: "********"
                font.bold: true
                font.pixelSize: 18
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
            color: vhod_but.pressed ? "grey" : "#A0A844"
            radius: 34
            Label {
                anchors.centerIn: parent
                font.pixelSize: 24
                color: "white"
                style: Text.Outline
                styleColor: "black"
                text: qsTr("Войти")
            }
            MouseArea {
                id: vhod_but
                anchors.fill: parent
                onClicked: {
                    globalLogin = login_pole.text
                    user_auth.setUserLogin(globalLogin)
                    user_auth.setUserPassword(pass_pole.text)
                    user_auth.connectToServer()
                    user_auth.sendMessageToServer()
                    login_pole.clear()
                    pass_pole.clear()
                }
            }
        }
    }

    Rectangle {
        y: column_1.y + column_1.height + 20
        width: parent.width - 80
        x: parent.width - width - 40
        height: 30
        color: "transparent"
        Label {
            anchors.left: parent.left
            anchors.leftMargin: 15
            text: qsTr("Нет аккаунта?")
            font.pixelSize: 16
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        Label {
            anchors.right: parent.right
            anchors.rightMargin: 15
            text: qsTr("Cоздайте новый")
            font.pixelSize: 16
            color: register_but.pressed ? "grey" : "#DFC97C"
            font.underline: true
            MouseArea {
                id: register_but
                anchors.fill: parent
                onClicked: {
                    auth_wnd.hide()
                    reg_wnd.show()
                }
            }
        }
    }
}
