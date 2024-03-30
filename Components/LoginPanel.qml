import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
  property var user: userField.text
  property var password: passwordField.text
  property var session: sessionPanel.session
  property var inputHeight: Screen.height * 0.04
  property var inputWidth: Screen.width * 0.16

  Rectangle {
    id: loginBackground

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    height: Screen.height * 0.3
    width: Screen.height * 0.3
    radius: Screen.height * 0.15
    visible: true
    color: "#373737"
    opacity: 0.4
  }

  Row {
    spacing: 8
    anchors {
      bottom: parent.bottom
      horizontalCenter: parent.horizontalCenter
    }
    PowerButton {
      id: powerButton
    }
    RebootButton {
      id: rebootButton
    }
    SleepButton {
      id: sleepButton
    }
    SessionPanel {
      id: sessionPanel
    }
    UserField {
      id: userField
    }
    z: 5
  }

  Column {
    spacing: 8
    z: 5
    width: inputWidth

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Text {
      text: "󰌾"
      color: "white"
      font.pointSize: 100
      anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalTop
      }
    }

    PasswordField {
      id: passwordField
      height: inputHeight
      width: parent.width

      onAccepted: loginButton.clicked()
    }
  }

  Connections {
    target: sddm

    function onLoginFailed() {
      passwordField.text = ""
      passwordField.focus = true
    }
  }
}
