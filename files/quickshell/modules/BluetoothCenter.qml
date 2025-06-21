import QtQuick
import Quickshell
import "root:/services"

Scope {
    id: root

    PanelWindow {
        visible: false

        anchors.bottom: true

        implicitWidth: 400
        implicitHeight: 400

        ListView {
            anchors.fill: parent
            model: Bluetooth.devices

            delegate: Item {
                width: parent.width
                height: 50

                Text {
                    text: model.name
                    font.pixelSize: 16
                    color: model.connected ? "blue" : "black"
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
