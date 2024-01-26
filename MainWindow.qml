import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import UserProfileData 1.0

Window {
    id: main_window
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900
    visible: false
    title: qsTr("Main Window")


    property string globalLogin;

    property string nameOfHouse;
    property string tempPokaz;
    property string sunPokaz;
    property string waterPokaz;
    property bool kolOfClicks : true;

    signal akkLogOut();
    signal newModel(var newModelHouses);
    signal newGreenHouse();
    signal newSensors();
    signal modelAfterCansel();
    signal deleteHouseSignal();

    onNewModel: {
        lstView.model = newModelHouses
    }

    onDeleteHouseSignal:
    {
        nameOfHouse = ""
        tempPokaz = ""
        sunPokaz = ""
        waterPokaz = ""
        deleteHouse_wnd.close()
        main_window.show()
    }

    onModelAfterCansel: {
        lstView.model = green_model.greenHousesModel
    }

    onNewGreenHouse: {
        newGreen_window.close()
        main_window.show()
    }

    onNewSensors: {
        tune_greenHouse_wnd.close()
        main_window.show()
    }

    DeleteHouseWnd {
        id: deleteHouse_wnd
    }


    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }

    UserProfileData
    {
        id: user_prof
        onProfileDataGet:
        {
            console.log(login,password,mail)
            profile_wnd.userLogin = login
            profile_wnd.userPassword = password
            profile_wnd.userMail = mail
            profile_wnd.userNumber = tel
        }
    }

    AddNewGreenHouseWindow {
        id: newGreen_window
        onBackButtonClicked: {
            newGreen_window.close()
            main_window.show()
        }
    }

    ChatWindow {
        id: chat_wnd
        onButBackClicked: {
            chat_wnd.close()
            main_window.show()
        }
    }

    ProfileWindow {
        id: profile_wnd
        onButtonLogOutClicked:
        {
            profile_wnd.close()
            main_window.akkLogOut()
            menu_panel.visible = false
            vspomog.visible = false
            kolOfClicks = true
        }
        onButtonOkClicked:
        {
            profile_wnd.close()
            main_window.show()
        }
    }

    AboutAppWindow{
        id: aboutApp_wnd
        onButtonBackClicked: {
            aboutApp_wnd.close()
            main_window.show()
        }
    }

    NastrGreenHouseWindow {
        id: tune_greenHouse_wnd
        onButBackToMainClicked: {
            tune_greenHouse_wnd.close()
            main_window.show()
        }
    }

    Rectangle {
        width: parent.width
        height: 109
        color: "#BFC250"
        border.color: "black"
        border.width: 1
        Image {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 28
            anchors.leftMargin: 25
            height: 53
            width: 53
            source: "qrc:/images/menu.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("menu button")
                   if(kolOfClicks) {
                       menu_panel.visible = true
                       vspomog.visible = true
                       kolOfClicks = false
                   }
                   else
                   {
                       menu_panel.visible = false
                       vspomog.visible = false
                       kolOfClicks = true
                   }
                }
            }
        }
        Label {
            anchors.centerIn: parent
            text: "     SMART\nGREENHOUSE"
            font.pixelSize: 24
            color: "white"
            styleColor: "black"
            style: Text.Outline
        }
    }

    Label {
        y: 177
        x: 25
        font.pixelSize: 24
        color: "white"
        style:Text.Outline
        styleColor: "black"
        text: nameOfHouse
    }

    Rectangle {
        y: 175
        x: parent.width - width - 30
        radius: 32
        width: 35
        height: 35
        color: nastrGreenHouse_but.pressed ? "grey":"#D7B53E"
        border.color: "black"
        Image {
            anchors.centerIn: parent
            height: 25
            width: 25
            source: "qrc:/images/nastr.png"
        }
        MouseArea {
            id: nastrGreenHouse_but
            anchors.fill: parent
            onClicked: {
                main_window.hide()
                tune_greenHouse_wnd.show()
                tune_greenHouse_wnd.getPokaz(tempPokaz,waterPokaz,sunPokaz)
                console.log(tempPokaz,waterPokaz,sunPokaz)
                tune_greenHouse_wnd.nameOfHouse = nameOfHouse
                tune_greenHouse_wnd.globalLogin = globalLogin
            }
        }
    }

    RowLayout {
        id: row_1
        height: 100
        width: parent.width - 26
        x: parent.width - width - 13
        y: 232
        spacing: 17
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 29
            border.color: "black"
            color: "#D6BF6F"
            border.width: 1
            Image {
                anchors.centerIn: parent
                height: 82
                width: 58
                source: "qrc:/images/water.png"
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 29
            border.color: "black"
            color: "#D6BF6F"
            border.width: 1
            Image {
                anchors.centerIn: parent
                height: 87
                width: 90
                source: "qrc:/images/temp.png"
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 29
            border.color: "black"
            color: "#D6BF6F"
            border.width: 1
            Image {
                anchors.centerIn: parent
                height: 74
                width: 70
                source: "qrc:/images/svet.png"
            }
        }
    }

    RowLayout {
        id: row_2
        width: parent.width - 26
        height: 28
        y: 343
        spacing: 17
        x: parent.width - width - 13
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            Label {
                anchors.centerIn: parent
                font.pixelSize: 24
                color: "white"
                style: Text.Outline
                styleColor: "black"
                text: waterPokaz
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            Label {
                anchors.centerIn: parent
                font.pixelSize: 24
                color: "white"
                style: Text.Outline
                styleColor: "black"
                text: tempPokaz
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            Label {
                anchors.centerIn: parent
                font.pixelSize: 24
                color: "white"
                style:Text.Outline
                styleColor: "black"
                text: sunPokaz
            }
        }
    }

    Rectangle {
        id: greenHouse_image
        x: parent.width - 33 - width
        width: parent.width - 33 - 33
        height:  parent.height - 244 - 363
        y: 373
        color: "transparent"
        Image {
            anchors.fill: parent
            source: "qrc:/images/greenhouse.png"
        }
    }


    Rectangle {
        width: parent.width - 162 - 5
        height:  41
        x: parent.width - width - 162
        y: rect_new_house.y + rect_new_house.height + 25
        color: "white"
        radius: 50
        border.color: "black"
        Image {
            id: lupa_img
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 8
            width: 32
            height: 23
            source: "qrc:/images/lupa_search.png"
        }
        TextArea {
            id: search_pole
            placeholderText: "Название теплицы..."
            font.pixelSize: 14
            width: parent.width - lupa_img.width - 18
            height: parent.height - 10
            x: 8
            y: 8
            background: Rectangle {
                anchors.fill: parent
                color: "transparent"
            }
        }
    }

    RowLayout {
        width: 75 + 75
        height: 41
        spacing: 4
        x: parent.width - width - 8
        y: rect_new_house.y + rect_new_house.height + 25
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 50
            border.color: "black"
            color: !search_button.pressed ? "#C6C869" : "grey"
            Label {
                anchors.centerIn: parent
                text: "Найти"
                font.pixelSize: 14
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: search_button
                anchors.fill: parent
                onClicked: {
                    green_model.button_search_clicked(search_pole.text)
                    search_pole.clear()
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 50
            border.color: "black"
            color: !cancel_serch_button.pressed ? "#FFA06B" : "grey"
            Label {
                text: "Отмена"
                anchors.centerIn: parent
                font.pixelSize: 14
                color: "white"
                style: Text.Outline
                styleColor: "black"
            }
            MouseArea {
                id: cancel_serch_button
                anchors.fill: parent
                onClicked:
                {
                    green_model.button_cancel_search_clicked();
                }
            }
        }
    }

    Rectangle {
        id: rect_new_house
        x: parent.width - width - 50
        width:  230
        height:  40
        y: greenHouse_image.y + greenHouse_image.height + 10
        color: "transparent"
        Label {
            anchors.top: parent.top
            anchors.left: parent.left
            font.pixelSize: 24
            color: "white"
            style: Text.Outline
            styleColor: "black"
            text: qsTr("Новая теплица")
        }
        Image {
            anchors.right: parent.right
            anchors.rightMargin: 10
            height: 36
            width: 36
            source: "qrc:/images/plus.png"
            MouseArea {
                id: newGreenHouse_but
                anchors.fill: parent
                onClicked:  {
                    newGreen_window.globalLogin = globalLogin
                    main_window.hide()
                    newGreen_window.show()
                }
            }
        }
    }
    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 100
        color: "#728C48"
        border.color: "black"
        border.width: 1
        Rectangle {
            width: parent.width - 62 - 20
            anchors.left: parent.left
            anchors.leftMargin: 17
            anchors.top: parent.top
            anchors.topMargin: 18
            height: 70
            color: "transparent"
            ListView {
                id: lstView
                anchors.fill: parent
                spacing: 5
                clip: true
                orientation: ListView.Horizontal
                model: green_model.greenHousesModel
                delegate: Rectangle {
                    width: 115
                    height: 65
                    radius: 15
                    clip: true
                    color: "#ECD69C"
                    border.color: "black"
                    Text {
                        id: name_house_list
                        anchors.fill: parent
                   //     anchors.centerIn: parent
                        wrapMode: Text.WordWrap
                        width: parent.width - 2
                        font.pixelSize: 16
                        color: "white"
                        styleColor: "black"
                        style: Text.Outline
                        text: edit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            green_model.getCurrentHouseSensors(globalLogin,name_house_list.text)
                            nameOfHouse = name_house_list.text
                        }
                    }
                }
            }
        }
        Image {
            width: 57
            height: 57
            source: "qrc:/images/del.png"
            x: parent.width - width - 3
            y: 18
            MouseArea {
                id: but_delete
                anchors.fill: parent
                onClicked: {
                    if(nameOfHouse !== "")
                    {
                        deleteHouse_wnd.globalLogin = globalLogin
                        deleteHouse_wnd.houseToDelete = nameOfHouse
                        deleteHouse_wnd.show();
                    }
                    else
                    {
                        incorrect_wnd.show()
                    }
                }
            }
        }
    }

    InCorrectDeleteHouseWnd
    {
        id: incorrect_wnd
    }

    Rectangle {
        id: vspomog
        height: parent.height - 109
        width: 127
        x: parent.width - width
        y: parent.height - height
        visible: false
        color: "black"
        opacity: 0.6
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(kolOfClicks)
                {
                    menu_panel.visible = true
                    vspomog.visible = true
                    kolOfClicks = false
                }
                else
                {
                    menu_panel.visible = false
                    vspomog.visible = false
                    kolOfClicks = true
                }
            }
        }
    }

        Rectangle {
            id: menu_panel
            width: parent.width - 127
            height: parent.height - 109
            y: parent.height - height
            visible: false
            color: "#728C48"
            Rectangle {
                anchors.top: parent.top
                anchors.topMargin: 66
                width:  parent.width
                color: "transparent"
                height: 65
                Image {
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    width: 63
                    height: 63
                    source: "qrc:/images/profile2.png"
                }
                Label {
                    text: qsTr("Профиль")
                    font.pixelSize: 18
                    color: profile_menu_but.pressed ? "grey" : "white"
                    style: Text.Outline
                    styleColor: "black"
                    font.underline: true
                    anchors.left: parent.left
                    anchors.leftMargin: 86
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    MouseArea {
                        id: profile_menu_but
                        anchors.fill: parent
                        onClicked: {
                            profile_wnd.globalLogin = globalLogin
                            user_prof.getCurrentProfileData(globalLogin)
                            main_window.hide()
                            profile_wnd.show()
                        }
                    }
                }
            }
            Rectangle {
                anchors.top: parent.top
                anchors.topMargin: 171
                width: parent.width
                height: 65
                color: "transparent"
                Image {
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    width: 65
                    height: 63
                    source: "qrc:/images/chat.png"
                }
                Label {
                    text: qsTr("Чат")
                    font.pixelSize: 18
                    color: chat_menu_but.pressed ? "grey" : "white"
                    style: Text.Outline
                    styleColor: "black"
                    font.underline: true
                    anchors.left: parent.left
                    anchors.leftMargin: 98
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    MouseArea {
                        id: chat_menu_but
                        anchors.fill: parent
                        onClicked: {
                            main_window.hide()
                            chat_wnd.show()
                        }
                    }
                }
            }
            Rectangle {
                anchors.top: parent.top
                anchors.topMargin:  276
                width: parent.width
                height: 65
                color: "transparent"
                Image {
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    width: 63
                    height: 63
                    source: "qrc:/images/abut.png"
                }
                Label {
                    text: qsTr("О приложении")
                    font.pixelSize: 18
                    color: about_menu_but.pressed ? "grey" : "white"
                    style: Text.Outline
                    styleColor: "black"
                    font.underline: true
                    anchors.left: parent.left
                    anchors.leftMargin: 92
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    MouseArea {
                        id: about_menu_but
                        anchors.fill: parent
                        onClicked: {
                            main_window.hide()
                            aboutApp_wnd.show()
                        }
                    }
                }
            }
        }
}
