import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property var bottomColor: "#404040"
    property var  topColor: "#e60112"

    function changeColor()
    {
        if(control.value ===0)
        {
            takeOffL.color = bottomColor
        }
        else if(control.value === 1)
        {
            takeOffL.color = topColor
        }
    }

    Slider {
        id: control
        anchors.centerIn: parent
        z:200
        orientation: "Vertical"

        background: Rectangle {
            x: control.leftPadding
            y: control.topPadding + control.availableHeight / 2 - height / 2
            implicitWidth: 600
            implicitHeight: 400
            width: control.availableWidth
            height: implicitHeight +60

            Image{
                source: "sliderBackground.png"
                anchors.fill: parent
                Label
                {
                    id:takeOffL
                     //NOTE :待背景尺寸确定后，算label左侧与上方锚 目前测试暂时写死
                    text: "Take off"
                    anchors.top: parent.top
                    anchors.topMargin:15
                    anchors.left: parent.left
                    anchors.leftMargin:(control.availableWidth- 60)/2
                    color:bottomColor
                }
            }
        }

        handle: Rectangle
        {

             x: control.topPadding + control.availableWidth / 2 - width/ 2-5
             y: control.topPadding + control.visualPosition * (control.availableHeight - height)

            implicitWidth: 100
            implicitHeight: 100
            color:"#00ffffff"

            Image{
                source: "bigThumb.png"
                anchors.fill: parent
            }
        }

        Timer {
                  interval: 500; running: true; repeat: true
                  onTriggered: changeColor()
              }
    }
}
