import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
  id: passwordField

  focus: true
  selectByMouse: true
  placeholderText: "Password"
  echoMode: TextInput.Password

  passwordCharacter: "•"
  passwordMaskDelay: config.PasswordShowLastLetter

  selectionColor: config.overlay0
  renderType: Text.NativeRendering

  font {
    family: config.Font
    pointSize: config.FontSize
    bold: false
  }
  color: "#c8bec3"

  horizontalAlignment: TextInput.AlignHCenter

  background: Rectangle {
    id: passFieldBackground
    radius: 50
    border.width: 3
    border.color: "#D4AC99"
    color: "#130f0f"
  }

  states: [
    State {
      name: "focused"
      when: passwordField.activeFocus
      // PropertyChanges {
      //   target: passwordField
      //   color: "#c8bec3"
      //   font.bold: true
      // }
      // PropertyChanges {
      //   target: passFieldBackground
      //   color: "#130f0f"
      // }
    },
    State {
      name: "hovered"
      when: passwordField.hovered
      PropertyChanges {
        target: passwordField
        color: "#130f0f"
        font.bold: true
      }
    }
  ]
  transitions: Transition {
    PropertyAnimation {
      properties: "color"
      duration: 300
    }
  }
}
