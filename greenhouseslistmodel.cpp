#include "greenhouseslistmodel.h"

GreenHousesListModel::GreenHousesListModel(QObject *parent)
    : QObject{parent}
{
    greenHousesModel = new QStandardItemModel;

    connect(this,&GreenHousesListModel::setBuff_to,NetworkAcsessor::getInstance(),&NetworkAcsessor::setBuff_in);

}

void GreenHousesListModel :: getCurrentHousesNames(QString log_in)
{
    QJsonObject obj;
    obj.insert("type",GreenHouses);
    obj.insert("login", log_in);
    QJsonDocument docToSever;
    docToSever.setObject(obj);
    emit setBuff_to(docToSever);
}


void GreenHousesListModel::button_cancel_search_clicked()
{
    refresh();
    emit modelChanged();
}

void GreenHousesListModel::delete_house_toServer(QString log_in)
{
    for(int i = 0 ; i < nameOfHouses.size(); ++i)
    {
        if(houseToDelete == nameOfHouses[i])
        {
            QJsonObject obj;
            obj.insert("type",DeleteHouse);
            obj.insert("name",houseToDelete);
            obj.insert("mac",macsOfHouses[i]);
            obj.insert("login",log_in);
            QJsonDocument docToServer;
            docToServer.setObject(obj);
            emit setBuff_to(docToServer);
            break;
        }
    }
}

void GreenHousesListModel::setHouseToDelete(QString house_in)
{
    houseToDelete = house_in;
}

void GreenHousesListModel::button_search_clicked(QString house_in)
{
    greenHousesModel->clear();
    greenHousesModel->insertColumn(0);
    for(int i = 0 ; i < nameOfHouses.size(); ++i)
    {
        // if(house_in == nameOfHouses[i])
        // {
        //     QStandardItemModel *newModel = new QStandardItemModel(this);
        //     newModel->insertRow(0);
        //     newModel->insertColumn(0);
        //     newModel->setData(newModel->index(0,0),house_in);
        //     emit newModelHouses(newModel);
        // }
        if(nameOfHouses[i].contains(house_in, Qt::CaseInsensitive))
        {
        greenHousesModel->insertRow(greenHousesModel->rowCount());
        greenHousesModel->setData(greenHousesModel->index(greenHousesModel->rowCount()-1,0),nameOfHouses[i]);
        }
    }
    emit newModelHouses(greenHousesModel);
}

void GreenHousesListModel::getSlotReadyRead(QJsonDocument doc_in)
{
    QJsonDocument docFromServer = doc_in;
    qDebug() << "Data from server: " << docFromServer;
    switch(docFromServer.object().value("type").toInt())
    {
    case GreenHouses:
    {
        nameOfHouses.clear();
        macsOfHouses.clear();
        QJsonArray arrHouses = docFromServer.object().value("houses").toArray();
        for(int i = 0 ; i < arrHouses.count(); ++i)
        {
            QJsonObject houseObj = arrHouses[i].toObject();
            nameOfHouses.push_back(houseObj.value("name").toString());
            macsOfHouses.push_back(houseObj.value("mac").toInt());
        }
        qDebug() << "vector houses: " << nameOfHouses << " vector macs: " << macsOfHouses;
        refresh();
        break;
    }
    case NewGreenHouse:
    {
        bool result = docFromServer.object().value("result").toBool();
        if(result)
        {
            nameOfHouses.push_back(newHouseName);
            macsOfHouses.push_back(newHouseMac);
            refresh();
            emit newGreenHouseAdded();
        }
        else
        {
            emit newGreenHouseDontAdded();
        }
        break;
    }
    case DataSensor:
    {
        QString temp = docFromServer.object().value("temp").toString();
        QString water = docFromServer.object().value("humanity").toString();
        QString svet = docFromServer.object().value("light").toString();
        qDebug() << temp << water << svet;
        emit givenCurrentSensors(svet,water,temp);
        break;
    }
    case NewDataSensor:
    {
        bool result = docFromServer.object().value("result").toBool();
        if(result)
        {
            qDebug() << svet, water , temp;
            emit newSensorGood(svet,water,temp);
        }
        else
        {
            emit newSensorsBad();
        }
        break;
    }
    case DeleteHouse:
    {
        bool result = docFromServer.object().value("result").toBool();
        if(result)
        {
            for(int i = 0 ; i < nameOfHouses.size(); ++i)
            {
                if(nameOfHouses[i] == houseToDelete)
                {
                    nameOfHouses.remove(i);
                    macsOfHouses.remove(i);
                    break;
                }
            }
            refresh();
            emit deleteSuccess();
        }
        break;
    }
    }
}

void GreenHousesListModel::refresh()
{
    greenHousesModel->clear();
    greenHousesModel->insertColumn(0);
    for(int i=0 ; i<nameOfHouses.size(); ++i)
    {
            greenHousesModel->insertRow(i);
            greenHousesModel->setData(greenHousesModel->index(i,0),nameOfHouses[i]);
    }
}

void GreenHousesListModel::setNewHouseCommend(QString commend_in)
{
    newHouseCommend = commend_in;
}

void GreenHousesListModel::setNewHouseName(QString name_in)
{
    newHouseName = name_in;
}

void GreenHousesListModel::setNewHouseMac(QString mac_in)
{
    newHouseMac = mac_in.toInt();
}

void GreenHousesListModel::sendNewGreenDataToServer(QString log_in)
{
    QJsonObject obj;
    obj.insert("login",log_in);
    obj.insert("type",NewGreenHouse);
    obj.insert("name",newHouseName);
    obj.insert("mac",newHouseMac);
    obj.insert("comment",newHouseCommend);
    QJsonDocument docToServer;
    docToServer.setObject(obj);
    emit setBuff_to(docToServer);
}

void GreenHousesListModel::setSvetSensor(QString svet_in)
{
    svet = svet_in;
}

void GreenHousesListModel::setTempSensor(QString temp)
{
    this->temp = temp;
}

void GreenHousesListModel::setWaterSensor(QString water)
{
    this->water = water;
}

void GreenHousesListModel::getCurrentHouseSensors(QString log_in,QString house_in)
{
    int currentMac;
    for(int i=0; i<nameOfHouses.size(); ++i)
    {
        if(nameOfHouses[i] == house_in)
        {
            currentMac = macsOfHouses[i];
            break;
        }
    }
    QJsonObject obj;
    obj.insert("type",DataSensor);
    obj.insert("name",house_in);
    obj.insert("mac",currentMac);
    obj.insert("login",log_in);
    QJsonDocument docToServer;
    docToServer.setObject(obj);
    emit setBuff_to(docToServer);
}

void GreenHousesListModel::setNewSensorsToServer(QString log_in,QString house_in)
{
    int currentMac;
    for(int i=0; i<nameOfHouses.size(); ++i)
    {
        if(nameOfHouses[i] == house_in)
        {
            currentMac = macsOfHouses[i];
            break;
        }
    }
    QJsonObject obj;
    obj.insert("type",NewDataSensor);
    obj.insert("login",log_in);
    obj.insert("name",house_in);
    obj.insert("mac",currentMac);
    obj.insert("humanity",water);
    obj.insert("light",svet);
    obj.insert("temp",temp);
    QJsonDocument docToServer;
    docToServer.setObject(obj);
    emit setBuff_to(docToServer);
}
