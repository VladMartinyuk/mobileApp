#include "newuserprofiledata.h"

NewUserProfileData::NewUserProfileData(QObject *parent)
    : QObject{parent}
{
    connect(this,&NewUserProfileData::setBuf_to,NetworkAcsessor::getInstance(),&NetworkAcsessor::setBuff_in);
}

void NewUserProfileData::setNewUserLogin(QString log_in)
{
    new_user_login = log_in;
}

void NewUserProfileData::setNewUserPass(QString pass_in)
{
    new_user_pass = pass_in;
}

void NewUserProfileData::setNewUserMail(QString mail_in)
{
    new_user_mail = mail_in;
}

void NewUserProfileData::setNewUserNumber(QString number)
{
    new_user_number = number;
}

void NewUserProfileData::sendNewProfileData(QString log_in)
{
    QJsonObject obj;
    obj.insert("type",EditUser);
    obj.insert("oldLogin",log_in);
    obj.insert("login",new_user_login);
    obj.insert("pass",new_user_pass);
    obj.insert("mail",new_user_mail);
    obj.insert("role",2);
    obj.insert("tel",new_user_number);
    QJsonDocument docToServer;
    docToServer.setObject(obj);
    emit setBuf_to(docToServer);
}

void NewUserProfileData::getSlotReadyRead(QJsonDocument doc_in)
{
    QJsonDocument docFromServer = doc_in;
    qDebug() << "Data from server new user data: " << docFromServer;
    switch(docFromServer.object().value("type").toInt())
    {
    case EditUser:
    {
        bool result = docFromServer.object().value("result").toBool();
        if(result)
        {
            emit currentNewProfileData(new_user_login,new_user_pass,new_user_mail,new_user_number);
        }
        else
        {
            emit newUserDataBad();
        }
        break;
    }
    }
}
