#include "registrationuser.h"

RegistrationUser::RegistrationUser(QObject *parent)
    : QObject{parent}
{
    connect(this,&RegistrationUser::setBuff_to,NetworkAcsessor::getInstance(),&NetworkAcsessor::setBuff_in);
    connect(this,&RegistrationUser::connectToHost,NetworkAcsessor::getInstance(),&NetworkAcsessor::connectToHost);
    connect(this,&RegistrationUser::disconnectFromHost,NetworkAcsessor::getInstance(),&NetworkAcsessor::disconnectClientFromHost);
}

void RegistrationUser::setNewUserLogin(QString log_in)
{
    newUserLogin = log_in;
}

void RegistrationUser::setNewUserPassword(QString pass_in)
{
    newUserPassword = pass_in;
}

void RegistrationUser::setNewUserMail(QString mail_in)
{
    newUserMail = mail_in;
}

void RegistrationUser::setNewUserNumber(QString new_number)
{
    newUserNumber = new_number;
}

void RegistrationUser::sendMessageToServer()
{
    QJsonObject obj;
    obj.insert("type",Registration);
    obj.insert("login",newUserLogin);
    obj.insert("pass",newUserPassword);
    obj.insert("mail",newUserMail);
    obj.insert("role",2);
    obj.insert("tel",newUserNumber);
 //   obj.insert("sex", ' ');
    QJsonDocument docToServer;
    docToServer.setObject(obj);
    emit setBuff_to(docToServer);
}

void RegistrationUser::connectToServer()
{
    qDebug() << "Try connect to: " << ipHost << portHost;
    emit connectToHost(ipHost,portHost);
}

void RegistrationUser::reg_disconnectFromHost()
{
    emit disconnectFromHost();
}

void RegistrationUser::getSlotReadyRead(QJsonDocument doc_in)
{
    QJsonDocument docFromServer = doc_in;
    qDebug() << "Data from server:" << doc_in;
    switch(docFromServer.object().value("type").toInt())
    {
    case Registration:
    {
        bool result = docFromServer.object().value("result").toBool();
        qDebug() << result;
        if(result)
        {
            qDebug() << "Зарегестрирован успешно!";
            emit registerSuccess();
        }
        else
        {
            qDebug() << "Не удаось зарегестрировать!";
            emit registerUnsuccess();
        }
        break;
    }
    }
}
