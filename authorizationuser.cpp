#include "authorizationuser.h"

AuthorizationUser::AuthorizationUser(QObject *parent)
    : QObject{parent}
{
    connect(this, &AuthorizationUser::setBuff_to, NetworkAcsessor::getInstance(), &NetworkAcsessor::setBuff_in);
    connect(this, &AuthorizationUser::connectToHost, NetworkAcsessor::getInstance(), &NetworkAcsessor::connectToHost);
    connect(this, &AuthorizationUser::disconnetUsers, NetworkAcsessor::getInstance(), &NetworkAcsessor::disconnectClientFromHost);
}

void AuthorizationUser::setUserLogin(QString log_in)
{
    user_login = log_in;
}

QString AuthorizationUser::getLogin()
{
    return user_login;
}

void AuthorizationUser::setUserPassword(QString pass_in)
{
    user_password = pass_in;
}

void AuthorizationUser::sendMessageToServer()
{
    QJsonObject obj;
    obj.insert("type",Authorization);
    obj.insert("login",user_login);
    obj.insert("pass",user_password);
    QJsonDocument docToServer;
    docToServer.setObject(obj);
    qDebug() << "Data to server:" << docToServer;
    emit setBuff_to(docToServer);
}

void AuthorizationUser::connectToServer()
{
    emit connectToHost(ipHost,portHost);
}

void AuthorizationUser::disconnectHost()
{
    emit disconnetUsers();
}

void AuthorizationUser::getSlotReadyRead(QJsonDocument doc_in)
{
    QJsonDocument docFromServer = doc_in;
    qDebug() << "Data from server: " << docFromServer;
    switch(docFromServer.object().value("type").toInt())
    {
    case Authorization:
    {
        bool result = docFromServer.object().value("result").toBool();
        if(result)
        {
            qDebug() << "Proshel proverku";
            emit userVoshel();
        }
        else
        {
            qDebug() << "Ne Proshel proverku";
            emit userNeVochel();
        }
        break;
    }
    }
}
