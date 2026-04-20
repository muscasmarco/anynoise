#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char **argv) {
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;
  engine.addImportPath(
      QString("%1/ui").arg(QGuiApplication::applicationDirPath()));
  engine.loadFromModule("MainWindow", "MainWindow");

  if (engine.rootObjects().isEmpty()) {
    exit(-1);
  }

  return app.exec();
}
