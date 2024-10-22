import QtQuick 2.15
import QtQuick.Controls 2.15

Column {
  id: clock
  spacing: 0
  width: parent.width / 2

  Label {
    id: time
    anchors.horizontalCenter: parent.horizontalCenter
    font.pointSize: root.font.pointSize * 3
    color: root.palette.text
    renderType: Text.QtRendering
    function updateTime() {
      text = new Date().toLocaleTimeString(Qt.locale(config.Locale),
        config.HourFormat == "long" ? Locale.LongFormat :
        config.HourFormat !== "" ? config.HourFormat : Local.ShortFormat)
    }
  }

  Label {
    id: date
    anchors.horizontalCenter: parent.horizontalCenter
    color: root.palette.text
    renderType: Text.QtRendering
    function updateDate() {
      text = new Date().toLocaleDateString(Qt.locale(config.Locale),
        config.DateFormat == "short" ? Locale.ShortFormat :
          config.DateFormat !== "" ? config.DateFormat : Locale.LongFormat)
    }
  }

  Timer {
    interval: 1000
    repeat: true
    running: true
    onTriggered: {
      date.updateDate()
      time.updateTime()
    }
  }

  Component.onCompleted: {
    date.updateDate()
    time.updateTime()
  }
}
