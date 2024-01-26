#ifndef AUTHORIZATIONUSER_H
#define AUTHORIZATIONUSER_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include "networkacsessor.h"


class AuthorizationUser : public QObject
{
    Q_OBJECT

    QString user_login;
    QString user_password;
    //QString ipHost = "192.168.88.250";
  //  QString ipHost = "localhost";
    QString ipHost = "192.168.88.250";
    int portHost = 2323;

    enum typeOfMessage {
        Authorization = 1,
    };

public:
    explicit AuthorizationUser(QObject *parent = nullptr);

    Q_INVOKABLE void setUserLogin(QString);
    Q_INVOKABLE void setUserPassword(QString);
    Q_INVOKABLE void sendMessageToServer();
    Q_INVOKABLE void connectToServer();
    Q_INVOKABLE void disconnectHost();

    QString getLogin();

public slots:
    void getSlotReadyRead(QJsonDocument);

signals:
    void setBuff_to(QJsonDocument);
    void connectToHost(QString,int);
    void disconnetUsers();
    void userVoshel();
    void userNeVochel();
};

#endif // AUTHORIZATIONUSER_H
