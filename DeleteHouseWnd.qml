import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: delete_house_wnd
    visible: false
    title: "Внимание!!!"
    maximumHeight: 200
    maximumWidth: 430
    minimumHeight: 200
    minimumWidth: 360
    color: "#74a137"


    property string houseToDelete;
    property string globalLogin;

    Rectangle {
        width: parent.width
        height: 20
        color: "transparent"
        y: 30
        Label {
            anchors.centerIn: parent
            text: "Осторожно!"
            font.pixelSize: 16
            color: "white"
        }
    }

    Rectangle {
        width: parent.width
        height: 20
        y: 55
        color: "transparent"
        Label {
            anchors.centerIn: parent
            text: "Вы собираетесь удалить теплицу:"
            font.pixelSize: 16
            color: "white"
        }
    }

    Rectangle {
        width: parent.width
        height: 20
        y: 91
        color: "transparent"
        Label {
            anchors.centerIn: parent
            text: houseToDelete
            font.pixelSize: 16
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
    }


    Rectangle {
        width: parent.width
        height: 35
        y:  127
        color: "transparent"
        RowLayout
        {
            anchors.centerIn: parent
            width:  32 + 97 + 97
            spacing: 32
            height: 35
            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 11
                border.color: "black"
                color: !delete_but.pressed ? "#CE6C56" : "grey"
                Label {
                    anchors.centerIn: parent
                    text: "Удалить"
                    color: "white"
                    style: Text.Outline
                    styleColor: "black"
                    font.pixelSize: 16
                }
            MouseArea {
                id: delete_but
                anchors.fill: parent
                onClicked:  {
                    green_model.setHouseToDelete(houseToDelete)
                    green_model.delete_house_toServer(globalLogin)
                }
            }
            }
            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                radius: 11
                border.color: "black"
                color: !back_but.pressed ? "#A0A844" : "grey"
                Label {
                    anchors.centerIn: parent
                    text: "Отмена"
                    color: "white"
                    style: Text.Outline
                    styleColor: "black"
                    font.pixelSize: 16
                }
                MouseArea {
                    id: back_but
                    anchors.fill: parent
                    onClicked:  {
                        delete_house_wnd.close()
                    }
                }
            }
        }
    }
}


