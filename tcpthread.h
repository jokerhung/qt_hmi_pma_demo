#ifndef TCPTHREAD_H
#define TCPTHREAD_H


#include <QThread>
#include <QTcpSocket>
#include <QDebug>

class TcpThread : public QObject
{
    Q_OBJECT
public:
    explicit TcpThread(qintptr ID, QObject *parent = 0);
    void run();
    void sendEvent(const QString &event);
    qintptr getSocketDescriptor();
    bool isConnect();

signals:
    void error(QTcpSocket::SocketError socketerror);
    void request(qintptr ID, const QString &req);
    void disconnectFromClient(qintptr socketDesciptor);

public slots:
    void readyRead();
    void disconnected();

private:
    QTcpSocket *socket = nullptr;
    qintptr socketDescriptor;
    bool connectStatus;
};
#endif // TCPTHREAD_H
