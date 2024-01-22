#include "tcpcmd.h"
#include <QJsonObject>
#include "util.h"

TcpCmd::TcpCmd()
{

}

QString TcpCmd::buildTcpResp(QString cmd, QString resultValue)
{
    QJsonObject jsonData;
    jsonData.insert("result", resultValue);
    // convert json to string
    QString strJson = Util::getInstance()->JsonToString(jsonData);

    return cmd + " " + strJson;
}
