#include "tcpserver.h"
#include "tcpthread.h"

TcpServer::TcpServer(QObject *parent) :
    QTcpServer(parent)
{
}

void TcpServer::startServer(int port)
{
    m_port = port;
    if(!this->listen(QHostAddress::Any,port))
    {
        qDebug() << "Could not start server";
    }
    else
    {
        qDebug() << "Listening to port " << port << "...";
    }
}

void TcpServer::updateSettings(int port)
{
    if(port != m_port) {
        // close socket
        this->close();
        // open new socket
        m_port = port;
        if(!this->listen(QHostAddress::Any,port))
        {
            qDebug() << "Could not start server";
        }
        else
        {
            qDebug() << "Listening to port " << port << "...";
        }
    }
}

void TcpServer::incomingConnection(qintptr socketDescriptor)
{
    // We have a new connection
    qDebug() << socketDescriptor << " Connecting...";

    TcpThread *thread = new TcpThread(socketDescriptor, this);
    qDebug() << "Add socket to list = " << socketDescriptor;
    m_threadlist.append(thread);

    // connect signal/slot
    // once a thread is not needed, it will be beleted later
    connect(thread, &TcpThread::disconnectFromClient, this, &TcpServer::clientDisconnect);
    connect(thread, &TcpThread::request, this, &TcpServer::clientRequest);
}

void TcpServer::clientDisconnect(qintptr socketDescriptor)
{
    qDebug() << "Client disconnect = " << socketDescriptor;
    // remove socketDescriptor from list
    TcpThread* found = nullptr;
    for( int i=0; i<m_threadlist.count(); ++i )
    {
        TcpThread* thread = m_threadlist.at(i);
        if(thread->getSocketDescriptor() == socketDescriptor) {
            found = thread;
        }
    }

    if(found != nullptr) {
        qDebug() << "Remove socket from list = " << socketDescriptor;
        m_threadlist.removeAll(found);
    }
}

void TcpServer::clientRequest(qintptr socketDescriptor, const QString &req)
{
    qDebug() << "Client request = " << socketDescriptor << req;
    emit request(socketDescriptor, req);
}

void TcpServer::broadcastEvent(const QString &event)
{
    for( int i=0; i<m_threadlist.count(); ++i )
    {
        TcpThread* thread = m_threadlist.at(i);
        if(thread->isConnect()) {
            qDebug() << "Send event to socket = " << thread->getSocketDescriptor();
            thread->sendEvent(event);
        }
    }
}

void TcpServer::sendMessage(qintptr socketDescriptor, const QString &message)
{
    TcpThread* found = nullptr;
    for( int i=0; i<m_threadlist.count(); ++i )
    {
        TcpThread* thread = m_threadlist.at(i);
        if(thread->getSocketDescriptor() == socketDescriptor) {
            found = thread;
        }
    }

    if(found != nullptr) {
        qDebug() << "Send message to socket = " << socketDescriptor;
        found->sendEvent(message);
    }
}


