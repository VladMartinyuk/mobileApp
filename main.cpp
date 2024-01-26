#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "authorizationuser.h"
#include "registrationuser.h"
#include "greenhouseslistmodel.h"
#include "userprofiledata.h"
#include "newuserprofiledata.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/cursovaya/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    qmlRegisterType<AuthorizationUser>("AuthorizationClass",1,0,"AuthotizationClass");
    qmlRegisterType<RegistrationUser>("RegistrationClass",1,0,"RegistrationClass");
    qmlRegisterType<GreenHousesListModel>("GreenHousesModel",1,0,"GreenHousesModel");
    qmlRegisterType<UserProfileData>("UserProfileData",1,0,"UserProfileData");
    qmlRegisterType<NewUserProfileData>("NewUserProfileData",1,0,"NewUserProfileData");

    engine.load(url);

    return app.exec();
}
