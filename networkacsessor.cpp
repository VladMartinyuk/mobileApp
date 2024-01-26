#include "networkacsessor.h"

NetworkAcsessor::NetworkAcsessor(QObject *parent)
    : QObject{parent}
{
    socket = new QTcpSocket;

    connect(socket,&QTcpSocket::readyRead, this, &NetworkAcsessor::slotReadyRead);
    connect(socket, &QTcpSocket::connected, this, &NetworkAcsessor::slotConnected);
    connect(socket, &QTcpSocket::disconnected,this, &NetworkAcsessor::slotDisconnected);
}

NetworkAcsessor *NetworkAcsessor::getInstance()
{
    static NetworkAcsessor *acsessor = new NetworkAcsessor;
    return acsessor;
}

void NetworkAcsessor::setBuff_in(QJsonDocument doc_in)
{
    objectSender = sender();
    qDebug() << objectSender;
    socket->write(doc_in.toJson());
    socket->waitForBytesWritten();
}

void NetworkAcsessor::slotReadyRead()
{
    QJsonDocument docFromServer = QJsonDocument::fromJson(socket->readAll());
    QMetaObject::invokeMethod(objectSender,"getSlotReadyRead",Qt::AutoConnection,Q_ARG(QJsonDocument,docFromServer));
}

void NetworkAcsessor::connectToHost(QString ip, int port)
{
    if(socket->state() == QAbstractSocket::UnconnectedState)
    {
        qDebug() << "Unconnected socket state";
        socket->connectToHost(ip,port);
        socket->waitForConnected();
    }
    else
    {
        qDebug() << "Connected socket state";
        socket->disconnectFromHost();;
        socket->connectToHost(ip,port);
        socket->waitForConnected();
    }
}

void NetworkAcsessor::disconnectClientFromHost()
{
    socket->disconnectFromHost();
  //  socket->waitForDisconnected();
}

void NetworkAcsessor::slotConnected()
{
    qDebug() << "Connected!";
}

void NetworkAcsessor::slotDisconnected()
{
   // socket->deleteLater();
}

