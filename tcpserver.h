#ifndef TCPSERVER_H
#define TCPSERVER_H

#include <QTcpServer>
#include "tcpthread.h"

class TcpServer : public QTcpServer
{
    Q_OBJECT
public:
    explicit TcpServer(QObject *parent = 0);
    void startServer(int port);
    void updateSettings(int port);
    void broadcastEvent(const QString &event);
    void sendMessage(qintptr socketDescriptor, const QString &message);

signals:
    void request(qintptr socketDescriptor, const QString &req);
    void error(const QString &s);

public slots:
    void clientDisconnect(qintptr socketDescriptor);
    void clientRequest(qintptr socketDescriptor, const QString &req);

protected:
    void incomingConnection(qintptr socketDescriptor);

private:
    int m_port;
    int m_timeout;
    QList<TcpThread*> m_threadlist;
};

#endif // TCPSERVER_H
