project(MediaToolBar VERSION 0.0.1 LANGUAGES CXX)

qt_add_library(${PROJECT_NAME}lib STATIC)

qt_add_qml_module(${PROJECT_NAME}lib
                        URI MediaToolBar 
                        VERSION 1.0
                        QML_FILES 
                            MediaToolBar.qml)
