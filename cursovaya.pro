QT += quick core network

SOURCES += \
        authorizationuser.cpp \
        greenhouseslistmodel.cpp \
        main.cpp \
        networkacsessor.cpp \
        newuserprofiledata.cpp \
        registrationuser.cpp \
        userprofiledata.cpp

resources.files = main.qml \
                 RegistrarionWindow.qml \
                 MainWindow.qml \
                 AddNewGreenHouseWindow.qml \
                 ChatWindow.qml \
                 NastrGreenHouseWindow.qml \
                 AboutAppWindow.qml \
                 ProfileWindow.qml \
                 NastrUserProfileWindow.qml \
                 ErrorWindow.qml \
                 SuccessRegWindow.qml \
                 ErrorAuthorizationWindow.qml \
                 DeleteHouseWnd.qml \
                 InCorrectDeleteHouseWnd.qml


resources.prefix = /$${TARGET}
RESOURCES += resources \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

HEADERS += \
    authorizationuser.h \
    greenhouseslistmodel.h \
    networkacsessor.h \
    newuserprofiledata.h \
    registrationuser.h \
    userprofiledata.h
