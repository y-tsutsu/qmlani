import sys

from PySide2.QtCore import QCoreApplication, Qt
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine


def main():
    sys.argv += ['--style', 'material']

    QGuiApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    QCoreApplication.setAttribute(Qt.AA_UseHighDpiPixmaps)
    QCoreApplication.setAttribute(Qt.AA_UseOpenGLES)

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    engine.load('Main.qml')

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()
