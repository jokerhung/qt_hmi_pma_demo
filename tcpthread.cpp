#include "tcpthread.h"

TcpThread::TcpThread(qintptr ID, QObject *parent)
    : QObject(parent)
{
    this->socketDescriptor = ID;

    // thread starts here
    qDebug() << " Thread started";

    socket = new QTcpSocket();

    // set the ID
    if(!socket->setSocketDescriptor(this->socketDescriptor))
    {
        // something's wrong, we just emit a signal
        emit error(socket->error());
        return;
    }

    // connect socket and signal
    // note - Qt::DirectConnection is used because it's multithreaded
    //        This makes the slot to be invoked immediately, when the signal is emitted.

    connect(socket, SIGNAL(readyRead()), this, SLOT(readyRead()), Qt::DirectConnection);
    connect(socket, SIGNAL(disconnected()), this, SLOT(disconnected()));

    // We'll have multiple clients, we want to know which is which
    qDebug() << socketDescriptor << " Client connected";
    connectStatus = true;
}

qintptr TcpThread::getSocketDescriptor()
{
    return socketDescriptor;
}

void TcpThread::readyRead()
{
    //while(socket->canReadLine() && socket->waitForReadyRead(socketTimeout*1000)) {
    if(socket->canReadLine()) {
        // get the information
        QByteArray data = socket->readAll();

        // will write on server siderequest window
        qDebug() << socketDescriptor << " socket data in: " << data;

        // emit
        QString dataAsString = QString::fromUtf8(data);
        emit request(socketDescriptor, dataAsString);
    }
}

void TcpThread::disconnected()
{
    connectStatus = false;
    qDebug() << socketDescriptor << " Disconnected";

    socket->deleteLater();
    socket = nullptr;
    delete socket;

    emit disconnectFromClient(socketDescriptor);
}

void TcpThread::sendEvent(const QString &event)
{
    if(socket != nullptr) {
        socket->write(event.toUtf8());
    }
}

bool TcpThread::isConnect()
{
    return connectStatus;
}
