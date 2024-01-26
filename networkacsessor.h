#ifndef NETWORKACSESSOR_H
#define NETWORKACSESSOR_H

#include <QObject>
#include <QTcpSocket>
#include <QJsonObject>
#include <QJsonDocument>

class NetworkAcsessor : public QObject
{
    Q_OBJECT

    QTcpSocket *socket;
    QObject *objectSender;

public:
    explicit NetworkAcsessor(QObject *parent = nullptr);

    static NetworkAcsessor *getInstance();

public slots:
    void setBuff_in(QJsonDocument);
    void connectToHost(QString,int);
    void disconnectClientFromHost();

private slots:
    void slotReadyRead();
    void slotConnected();
    void slotDisconnected();

signals:
};

#endif // NETWORKACSESSOR_H
