import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "Components"

Item {
  id: root
  height: config.ScreenHeight || Screen.height
  width: config.ScreenWidth || Screen.ScreenWidth

  Rectangle {
    id: background
    anchors.fill: parent
    height: parent.height
    width: parent.width
    z: 0
    color: config.base
  }
  Item {
    id: main
    z: 3
    anchors.fill: parent
    anchors.margins: 50
    Clock {
      id: time
    }
    LoginPanel {
      id: loginPanel
      anchors.fill: parent
    }
  }
}
