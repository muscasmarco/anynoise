#include <QApplication>
#include <QPushButton>
#include <QLabel>
#include <QVBoxLayout>
#include <QWidget>

#include "utils/constants.hpp"

int main (int argc, char** argv) {
    QApplication app(argc, argv);

    QWidget window;
    QVBoxLayout layout(&window);

    QString appName = QString::fromStdString(Utils::Constants::APP_NAME);
    QLabel label {appName};
    QPushButton button("Click me");

    layout.addWidget(&label);
    layout.addWidget(&button);

    // Signal & slot — the heart of Qt
    QObject::connect(&button, &QPushButton::clicked, [&]() {
        label.setText("Button clicked!");
    });

    window.show();
    return app.exec();
}