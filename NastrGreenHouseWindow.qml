import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

Window {
    id: nastr_house_window
    visible: false
    title: qsTr("Tune greenhouse")
    minimumHeight: 800
    minimumWidth: 360
    maximumWidth: 430
    maximumHeight: 900

    property string nameOfHouse;

    property string globalLogin;

    signal getPokaz(var temp, var water, var sun)
    signal butBackToMainClicked()

     onGetPokaz:
     {
         sun_txt.text = sun
         water_txt.text = water
         temp_txt.text = temp
         console.log("Nastr:",sun_txt.text,water_txt.text,temp_txt.text)
     }

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
        anchors.centerIn: parent
        text: "     SMART\nGREENHOUSE"
        font.pixelSize: 24
        color: "white"
        styleColor: "black"
        style: Text.Outline
        }
    }

    Rectangle {
        y:155
        width: parent.width
        height: 47
        color: "transparent"
        Rectangle {
            anchors.centerIn: parent
            width: 155
            height: parent.height
            color: "transparent"
            Label {
                anchors.centerIn: parent
                text: nameOfHouse
                color: "white"
                style: Text.Outline
                styleColor: "black"
                font.pixelSize: 32
            }
        }
    }

    RowLayout {
        x: 27
        y: 468
        width: parent.width - 44
        height: 58
        spacing: 36
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 21
            border.color: "black"
            color: save_newData_button.pressed ? "grey" : "#D0B83B"
            Label {
                text: qsTr("Сохранить")
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top: parent.top
                anchors.topMargin: 18
                font.pixelSize: 16
                style: Text.Outline
                styleColor: "black"
                color: "white"
            }
            Image {
                height: 21
                width: 21
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 17
                anchors.rightMargin: 16
                source: "qrc:/images/save_button.png"
            }
            MouseArea {
                id: save_newData_button
                anchors.fill: parent
                onClicked: {
                    green_model.setSvetSensor(sl_sun.value.toFixed(0).toString())
                    green_model.setWaterSensor(sl_water.value.toFixed(0).toString())
                    green_model.setTempSensor(sl_temp.value.toFixed(0).toString())
                    green_model.setNewSensorsToServer(globalLogin,nameOfHouse)
                }
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.color: "black"
            radius: 21
            color: back_button.pressed ? "grey" : "#FFA06B"
            Label {
                text : qsTr("Вернуться")
                anchors.left: parent.left
                anchors.leftMargin: 22
                anchors.top: parent.top
                anchors.topMargin: 19
                font.pixelSize: 16
                style: Text.Outline
                styleColor: "black"
                color: "white"
            }
            Image {
                height: 21
                width: 21
                anchors.top: parent.top
                anchors.topMargin: 18
                anchors.right: parent.right
                anchors.rightMargin: 19
                source: "qrc:/images/back.png"
            }
            MouseArea {
                id: back_button
                anchors.fill: parent
                onClicked: {
                    butBackToMainClicked()
                }
            }
        }
    }

    Image {
        x: 10
        y: parent.height - height - 25
        width: parent.width - 10
        height: parent.height - 5 - 556
        source: "qrc:/images/greenhouse.png"
    }

    ColumnLayout {
        x: 19
        y: 222
        spacing: 25
        height: 227
        width: 61
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 29
            border.color: "black"
            color: "#D6BF6F"
            Image {
                height: 45
                width: 41
                anchors.centerIn: parent
                source: "qrc:/images/svet.png"
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 29
            border.color: "black"
            color: "#D6BF6F"
            Image {
                height: 53
                width: 45
                source: "qrc:/images/temp.png"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 29
            border.color: "black"
            color: "#D6BF6F"
            Image {
                height: 50
                width: 35
                source: "qrc:/images/water.png"
                anchors.centerIn: parent
            }
        }
    }

    Rectangle {
        color: "transparent"
        x: 105
        y: 222
        height: 61
        width: parent.width - 18 - 105
        Label {
            id: sun_txt
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            color: "white"
            style: Text.Outline
            styleColor: "black"
            text: ""
        }
        Label {
            anchors.left: parent.left
            text: qsTr("Значение:")
            font.pixelSize: 18
            color: "white"
            style: Text.Outline
            styleColor:  "black"
        }
        Slider {
            id: sl_sun
            anchors.bottom: parent.bottom
            width: parent.width
            value: sun_txt.text
            from: 10
            to: 100
            stepSize: 1
            onValueChanged: sun_txt.text = sl_sun.value.toFixed(0)
        }
    }

    Rectangle {
        color: "transparent"
        x: 105
        y: 306
        height: 61
        width: parent.width - 18 - 105
        Label {
            id: temp_txt
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            color: "white"
            style: Text.Outline
            styleColor: "black"
            text: ""
        }
        Label {
            anchors.left: parent.left
            text: qsTr("Значение:")
            font.pixelSize: 18
            color: "white"
            style: Text.Outline
            styleColor:  "black"
        }
        Slider {
            id: sl_temp
            anchors.bottom: parent.bottom
            width: parent.width
            value: temp_txt.text
            from: 10
            to: 100
            stepSize: 1
            onValueChanged: temp_txt.text = sl_temp.value.toFixed(0)
        }
    }

    Rectangle {
        color: "transparent"
        x: 105
        y: 392
        height: 61
        width: parent.width - 18 - 105
        Label {
            id: water_txt
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            color: "white"
            style: Text.Outline
            styleColor: "black"
            text : ""
        }
        Label {
            anchors.left: parent.left
            text: qsTr("Значение:")
            font.pixelSize: 18
            color: "white"
            style: Text.Outline
            styleColor:  "black"
        }
        Slider {
            id: sl_water
            anchors.bottom: parent.bottom
            width: parent.width
            value: water_txt.text
            from: 10
            to: 100
            stepSize: 1
            onValueChanged: water_txt.text = sl_water.value.toFixed(0)
        }
    }
}
