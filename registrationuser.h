#ifndef REGISTRATIONUSER_H
#define REGISTRATIONUSER_H

#include <QObject>
#include <QTcpSocket>
#include <QJsonDocument>
#include <QJsonObject>
#include "networkacsessor.h"

class RegistrationUser : public QObject
{
    Q_OBJECT

    QString newUserLogin;
    QString newUserPassword;
    QString newUserMail;
    QString newUserNumber;
    QString ipHost = "192.168.88.250";
  //  QString ipHost = "localhost";
    int portHost = 2323;

    enum typeOfMEssage {
        Registration = 2,
    };

public:
    explicit RegistrationUser(QObject *parent = nullptr);

    Q_INVOKABLE void setNewUserLogin(QString);
    Q_INVOKABLE void setNewUserPassword(QString);
    Q_INVOKABLE void setNewUserMail(QString);
    Q_INVOKABLE void setNewUserNumber(QString);
    Q_INVOKABLE void sendMessageToServer();
    Q_INVOKABLE void connectToServer();
    Q_INVOKABLE void reg_disconnectFromHost();

public slots:
    void getSlotReadyRead(QJsonDocument);

signals:
    void setBuff_to(QJsonDocument);
    void connectToHost(QString,int);
    void disconnectFromHost();
    void registerSuccess();
    void registerUnsuccess();
};

#endif // REGISTRATIONUSER_H
