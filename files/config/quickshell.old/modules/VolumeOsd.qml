import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Scope {
    id: root

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onVolumeChanged() {
            root.osdShown = true;
            osdTimer.restart();
        }
    }

    property bool osdShown: false

    Timer {
        id: osdTimer
        interval: 1500
        onTriggered: root.osdShown = false
    }

    LazyLoader {
        active: root.osdShown

        PanelWindow {
            anchors.bottom: true
            margins.bottom: screen.height / 10
            exclusiveZone: 0

            implicitWidth: 400
            implicitHeight: 70
            color: "transparent"

            // Prevent window from blocking mouse events
            mask: Region {}

            Rectangle {
                anchors {
                    fill: parent
                }
                radius: 10
                color: "#E0000000"

                RowLayout {
                    anchors {
                        fill: parent
                        leftMargin: 25
                        rightMargin: 25
                    }

                    Text {
                        text: (Pipewire.defaultAudioSink?.audio?.volume * 100).toFixed(0) + " %"
                        font.pixelSize: 20
                        color: "white"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Rectangle {
                        Layout.fillWidth: true

                        implicitHeight: 10
                        radius: 20
                        color: "#50ffffff"

                        Rectangle {
                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }

                            implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio?.volume ?? 0)
                            radius: parent.radius
                        }
                    }
                }
            }
        }
    }
}
