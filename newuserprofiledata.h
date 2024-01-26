#ifndef NEWUSERPROFILEDATA_H
#define NEWUSERPROFILEDATA_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include "networkacsessor.h"

class NewUserProfileData : public QObject
{
    Q_OBJECT

    QString new_user_login;
    QString new_user_pass;
    QString new_user_mail;
    QString new_user_number;

    enum typeOfMessage {
        EditUser = 8,
    };

public:
    explicit NewUserProfileData(QObject *parent = nullptr);

    Q_INVOKABLE void setNewUserLogin(QString);
    Q_INVOKABLE void setNewUserPass(QString);
    Q_INVOKABLE void setNewUserMail(QString);
    Q_INVOKABLE void setNewUserNumber(QString);
    Q_INVOKABLE void sendNewProfileData(QString);

public slots:
    void getSlotReadyRead(QJsonDocument);

signals:
    void setBuf_to(QJsonDocument);
    void currentNewProfileData(QString new_login, QString new_password, QString new_mail, QString new_number);
    void newUserDataBad();
};

#endif // NEWUSERPROFILEDATA_H
