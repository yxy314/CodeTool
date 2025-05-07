cmake_minimum_required(VERSION 3.16)

project(CodeTool VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)
set(QRC_FILES
        qml.qrc
)
qt6_add_resources(RESOURCES ${QRC_FILES})
qt_add_executable(appCodeTool
    main.cpp
        ${RESOURCES}
)

qt_add_qml_module(appCodeTool
    URI CodeTool
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES qml.qrc
        SOURCES address_Tool.h address_Tool.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCodeTool PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCodeTool
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appCodeTool
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appCodeTool
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
