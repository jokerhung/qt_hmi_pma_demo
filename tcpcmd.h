#ifndef TCPCMD_H
#define TCPCMD_H

#include <QString>

class TcpCmd
{
public:
    TcpCmd();
    QString buildTcpResp(QString cmd, QString result);
};

#endif // TCPCMD_H
