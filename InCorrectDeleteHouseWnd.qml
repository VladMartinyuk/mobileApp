import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Window {
    id: err_wnd
    visible: false
    title: "Ошибка!"
    maximumHeight: 200
    maximumWidth: 430
    minimumHeight: 200
    minimumWidth: 360
    color: "#74a137"

    Rectangle {
        width: parent.width
        height: 20
        color: "transparent"
        y: 39
        Label {
            anchors.centerIn: parent
            text: "Ошибка!"
            color: "red"
            style: Text.Outline
            styleColor: "black"
            font.pixelSize: 16
        }
    }

    Rectangle {
        width: parent.width
        height: 20
        color: "transparent"
        y: 75
        Label {
            anchors.centerIn: parent
            text: "Выберите теплицу прежде чем удалить!"
            font.pixelSize: 16
            color: "white"
        }
    }

    Rectangle {
        width: parent.width
        height: 35
        y: 127
        color: "transparent"
        Rectangle {
            anchors.centerIn: parent
            radius: 11
            border.color: "black"
            width: 100
            height: 34
            color: !close_but.pressed ? "#D6FA46" : "grey"
            Label {
                anchors.centerIn: parent
                text: "Ok"
                style: Text.Outline
                styleColor: "black"
                font.pixelSize: 16
                color: "white"
            }
        }
        MouseArea {
            id: close_but
            anchors.fill: parent
            onClicked: err_wnd.close()
        }
    }
}
