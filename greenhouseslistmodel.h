#ifndef GREENHOUSESLISTMODEL_H
#define GREENHOUSESLISTMODEL_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QStandardItemModel>
#include <QJsonArray>
#include "networkacsessor.h"


class GreenHousesListModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStandardItemModel *greenHousesModel READ getModel WRITE setModel NOTIFY modelChanged)

    QStandardItemModel *greenHousesModel;
    QVector<QString> nameOfHouses;
    QVector<int> macsOfHouses;

    QString newHouseName;
    int newHouseMac;
    QString newHouseCommend;

    QString svet;
    QString water;
    QString temp;

    QString userLogin;

    QString houseToDelete;

    void refresh();

    enum tpeOfMessage {
        NewGreenHouse = 3,
        DataSensor = 5,
        GreenHouses = 6,
        NewDataSensor = 7,
        DeleteHouse = 12,
    };

public:
    explicit GreenHousesListModel(QObject *parent = nullptr);

    QStandardItemModel *getModel() { return greenHousesModel; }
    void setModel(QStandardItemModel *new_model) { greenHousesModel = new_model; }

    Q_INVOKABLE void getCurrentHousesNames(QString);
    Q_INVOKABLE void setNewHouseName(QString);
    Q_INVOKABLE void setNewHouseMac(QString);
    Q_INVOKABLE void setNewHouseCommend(QString);
    Q_INVOKABLE void sendNewGreenDataToServer(QString);
    Q_INVOKABLE void setSvetSensor(QString);
    Q_INVOKABLE void setWaterSensor(QString);
    Q_INVOKABLE void setTempSensor(QString);
    Q_INVOKABLE void getCurrentHouseSensors(QString,QString);
    Q_INVOKABLE void setNewSensorsToServer(QString,QString);

    Q_INVOKABLE void button_search_clicked(QString);

    Q_INVOKABLE void button_cancel_search_clicked();

    Q_INVOKABLE void delete_house_toServer(QString);

    Q_INVOKABLE void setHouseToDelete(QString);



public slots:
    void getSlotReadyRead(QJsonDocument);

signals:
    void modelChanged();
    void setBuff_to(QJsonDocument);
    void newGreenHouseAdded();
    void newGreenHouseDontAdded();
    void givenCurrentSensors(QString svet, QString water, QString temp);
    void newSensorGood(QString new_svet, QString new_water , QString new_temp);
    void newSensorsBad();
    void deleteSuccess();
    void newModelHouses(QStandardItemModel *newModel);
};

#endif // GREENHOUSESLISTMODEL_H
