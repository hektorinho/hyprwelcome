import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
// import QtGraphicalEffects 2.15
import QtQuick.Effects 1.0
import "Components"

Item {
  id: root
  height: Screen.height
  width: Screen.width

  Image {
    id: backgroundImage
    anchors.fill: parent
    height: parent.height
    width: parent.width
    fillMode: Image.PreserveAspectCrop
    visible: true
    z: 1
    source: "/home/anon/Pictures/wallpapers/Kath.png"
    asynchronous: false
    cache: true
    mipmap: true
    clip: true
  }

  MultiEffect {
    source: backgroundImage
    anchors.fill: backgroundImage
    blurEnabled: true
    blurmax: 64
    blur: 0.6
  }

//  GaussianBlur {
//    source: backgroundImage
//    radius: 8
//    samples: 201
//  }

  Item {
    id: mainPanel
    z: 3
    anchors {
      fill: parent
      margins: 50
    }
    Clock {
      id: time
      visible: config.ClockEnabled == "true" ? true : false
    }
    LoginPanel {
      id: loginPanel
      anchors.fill: parent
    }
  }
}
