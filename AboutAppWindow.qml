import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    id: abut_app_window
    visible: false
    title: qsTr("About application")
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900

    signal buttonBackClicked();

    Image {
        anchors.fill: parent
        source: "qrc:/images/444.jpeg"
    }

    Rectangle {
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
        Image {
            anchors.left: parent.left
            anchors.leftMargin: 12
            anchors.top: parent.top
            anchors.topMargin: 20
            height: 63
            width: 63
            source: "qrc:/images/back.png"
            MouseArea {
                id: button_back
                anchors.fill: parent
                onClicked: buttonBackClicked()
            }
        }
    }


    Rectangle {
        id: text_rect
        width: parent.width - 10
        height: 400
        color: "transparent"
       // border.color: "black"
        x: 5
        y: 130
        Label {
            width: parent.width - 10
            wrapMode: Text.WordWrap
            text: "Умная теплица или вертикальная ферма – станция с полностью автоматизированными процессами выращивания культур. Влажность, температуру воздуха и даже полив регулирует автоматика и программное обеспечение. Владельцу достаточно следить за параметрами на смартфоне или ноутбуке. Данное приложение разработано командой Losers Technology. Идея данного программного обеспечения состоит в том, что бы облегчить труд сельско-хозяйственным работникам. В проекте учавтсвовали: Мартынюк В.Д (должность - frontend разработчик), Дулевский Е.Р (должность - backednd разработчик), Тимофеев Д.В (должность - frontend разработчик). Для ркомендаций для обновления проекта просим писать на почту smartgreenhouse@mail.ru"
            color: "white"
            font.pixelSize: 16
            style:Text.Outline
            styleColor: "black"
        }
    }

}
