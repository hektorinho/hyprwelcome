import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15

Item {
  property var user: userModel.lastUser
  implicitHeight: userButton.height
  implicitWidth: userButton.width
  DelegateModel {
    id: userWrapper
    model: userModel
    delegate: ItemDelegate {
      id: userEntry
      height: inputHeight
      width: parent.width
      highlighted: userList.currentIndex == index
      contentItem: Text {
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.FontSize
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: config.text
        text: name
      }
      background: Rectangle {
        id: userEntryBackground
        color: "transparent"
        radius: 3
      }
      states: [
        State {
          name: "hovered"
          when: userEntry.hovered
          PropertyChanges {
            target: userEntryBackground
            color: config.surface2
          }
        }
      ]
      transitions: Transition {
        PropertyAnimation {
          property: "color"
          duration: 300
        }
      }
      MouseArea {
        anchors.fill: parent
        onClicked: {
          sessionList.currentIndex = index
          sessionPopup.close()
        }
      }
    }
  }
  Button {
    id: userButton
    height: inputHeight
    width: inputHeight
    hoverEnabled: true
    icon {
      source: Qt.resolvedUrl("../icons/users.svg")
      height: height
      width: width
      color: "#55eeeeee"
    }
    background: Rectangle {
      id: userButtonBackground
      color: "transparent"
      radius: 3
    }
    states: [
      State {
        name: "pressed"
        when: userButton.down
        PropertyChanges {
          target: userButton
          icon.color: "#eeeeee"
        }
      },
      State {
        name: "hovered"
        when: userButton.hovered
        PropertyChanges {
          target: userButton
          icon.color: "#eeeeee"
        }
      },
      State {
        name: "selection"
        when: userPopup.visible
        PropertyChanges {
          target: userButton
          icon.color: "#eeeeee"
        }
      }
    ]
    transitions: Transition {
      PropertyAnimation {
        properties: "color"
        duration: 150
      }
    }
    onClicked: {
      userPopup.visible ? userPopup.close() : userPopup.open()
      userButton.state = "pressed"
    }
  }
  Popup {
    id: userPopup
    width: inputWidth + padding * 2
    x: (userButton.width + userList.spacing) * -7.6
    y: -(contentHeight + padding * 2) + userButton.height
    padding: inputHeight / 10
    background: Rectangle {
      radius: 5.4
      color: config.surface0
    }
    contentItem: ListView {
      id: userList
      implicitHeight: contentHeight
      spacing: 8
      model: userWrapper
      currentIndex: sessionModel.lastIndex
      clip: true
    }
    enter: Transition {
      ParallelAnimation {
        NumberAnimation {
          property: "opacity"
          from: 0
          to: 1
          duration: 400
          easing.type: Easing.OutExpo
        }
        NumberAnimation {
          property: "x"
          from: userPopup.x + (inputWidth * 0.1)
          to: userPopup.x
          duration: 500
          easing.type: Easing.OutExpo
        }
      }
    }
    exit: Transition {
      NumberAnimation {
        property: "opacity"
        from: 1
        to: 0
        duration: 300
        easing.type: Easing.OutExpo
      }
    }
  }
}
// TextField {
  // id: userField

  // height: inputHeight
  // width: inputWidth
  //
  // selectByMouse: true
  // echoMode: TextInput.Normal
//  selectionColor: config.overlay0
//   renderType: Text.NativeRendering
//
//   font {
//     family: config.Font
//     pointSize: config.FontSize
//     bold: false
//   }
//
//   color: "#eeeeee"
//   horizontalAlignment: Text.AlignHCenter
//   placeholderText: "Username"
//   text: userModel.lastUser
//
//   background: Rectangle {
//     id: userFieldBackground
//     color: "#33333333"
//     border {
//       color: "#eeeeee"
//     }
//     radius: 10
//   }
//
//   states: [
//     State {
//       name: "focused"
//       when: userField.activeFocus
//         PropertyChanges {
//           target: userFieldBackground
//           color: "#333333"
//           border.width: 0
//         }
//         PropertyChanges {
//           target: userField
//           color: "#eeeeee"
//           font.bold: true
//         }
//     },
//     State {
//       name: "hovered"
//       when: userField.hovered
//       PropertyChanges {
//         target: userField
//         color: "#eeeeee"
//         font.bold: true
//       }
//     }
//   ]
//   transitions: Transition {
//     PropertyAnimation {
//       properties: "color"
//       duration: 300
//     }
//   }
// }
