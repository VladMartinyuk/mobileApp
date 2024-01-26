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

    Label {
        font.pixelSize: 16
        anchors.centerIn: parent
        text: "Ошибка в данных!"
        color: "red"
        style:Text.Outline
        styleColor: "black"
    }

    Rectangle {
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 40
        width: 100
        height: 34
        radius: 11
        border.color: "black"
        color: but_ok.pressed ? "grey" : "#d6e33a"
        Label {
            anchors.centerIn: parent
            text: "Ok"
            font.pixelSize: 16
            color: "white"
            style: Text.Outline
            styleColor: "black"
        }
        MouseArea {
            id: but_ok
            anchors.fill: parent
            onClicked: err_wnd.close()
        }
    }
}
