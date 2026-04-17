#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "utils/constants.hpp"

int main (int argc, char** argv) {
   QGuiApplication app(argc, argv);
   QQmlApplicationEngine engine;
   engine.loadFromModule("MainWindow", "MainWindow");

   if (engine.rootObjects().isEmpty()) {
      exit(-1);
   }

   return app.exec();
}
