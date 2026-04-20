project(MainWindow VERSION 0.0.1 LANGUAGES CXX)

set_source_files_properties(resources/images/logo.png PROPERTIES QT_RESOURCE_ALIAS logo.png)

qt_add_library(${PROJECT_NAME}lib STATIC)

qt_add_qml_module(${PROJECT_NAME}lib
                        URI MainWindow 
                        QML_FILES 
                            MainWindow.qml
                        RESOURCES
                            resources/images/logo.png)

# target_include_direcotries(${PROJECT_NAME}lib PRIVATE src)