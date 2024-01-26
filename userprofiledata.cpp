#include "userprofiledata.h"

UserProfileData::UserProfileData(QObject *parent)
    : QObject{parent}
{
    connect(this,&UserProfileData::setBuff_to, NetworkAcsessor::getInstance(), &NetworkAcsessor::setBuff_in);
}

void UserProfileData::getCurrentProfileData(QString name)
{
    QJsonObject obj;
    obj.insert("type",InfoUser);
    obj.insert("login",name);
    QJsonDocument docToServer;
    docToServer.setObject(obj);
    emit setBuff_to(docToServer);
}

void UserProfileData::getSlotReadyRead(QJsonDocument doc_in)
{
    QJsonDocument docFromServer = doc_in;
    qDebug() << "Data from server user data:" << docFromServer;
    switch(docFromServer.object().value("type").toInt())
    {
    case InfoUser:
    {
        userLogin = docFromServer.object().value("login").toString();
        userPassword = docFromServer.object().value("pass").toString();
        userMail = docFromServer.object().value("mail").toString();
        userNumber = docFromServer.object().value("tel").toString();
        emit profileDataGet(userLogin,userPassword,userMail, userNumber);
        break;
    }
    }
}


