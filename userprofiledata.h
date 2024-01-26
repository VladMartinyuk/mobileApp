#ifndef USERPROFILEDATA_H
#define USERPROFILEDATA_H

#include <QObject>
#include <QJsonObject>
#include <QJsonDocument>
#include "networkacsessor.h"

class UserProfileData : public QObject
{
    Q_OBJECT

    QString userLogin;
    QString userPassword;
    QString userMail;
    QString userNumber;


    enum typeOfMessage {
        InfoUser = 4,
    };

public:
    explicit UserProfileData(QObject *parent = nullptr);

    Q_INVOKABLE void getCurrentProfileData(QString);


public slots:
    void getSlotReadyRead(QJsonDocument);

signals:
    void setBuff_to(QJsonDocument);
    void profileDataGet(QString login, QString password, QString mail, QString tel);
};

#endif // USERPROFILEDATA_H
