/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.dbus 1.0
//import org.freedesktop.DBus 1.0
//import org.freedesktop.contextkit 1.0

Page {
    id: page

    allowedOrientations: Orientation.Landscape | Orientation.Portrait | Orientation.LandscapeInverted

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        // Tell SilicaFlickable the height of its content.
        contentHeight: parent.height

        PullDownMenu {
            MenuItem {
                text: "Speedometer"
                onClicked: { //console.log("Speedometer")
                pageStack.push(Qt.resolvedUrl("Speedometer.qml"))
                }
            }
        }

        /* A kilometre (American spelling: kilometer, symbol: km) is a unit of length equal to 1000 metres
        (from the Greek words khilia = thousand and metro = count/measure).
        It is approximately equal to 0.621 miles, 1094 yards or 3281 feet. */

        Row{
            id: row2
           // anchors.fill : parent
            height: page.height //-row1.height

            transform: Rotation { origin.x: page.width/ 2; origin.y: parent.height ; axis { x: 0; y: 1; z: 0 } angle: generic.rotationangle }

                width :parent.width
                Label {id: measurement
                    x: Theme.paddingLarge
                    text: unitbutton.text === "km/h"? generic.kmhspeed: generic.mphspeed
                    color: Theme.primaryColor //colorComboBox.value //
                    font.pixelSize: orientation === Orientation.Portrait?  page.height/3 : page.height
                    width: parent.width
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignBottom
                }

         }
         Row{id: row1

             height: page.height/3
             width: parent.width

             Button {id: flipbutton
                width: parent.width/3
                text: "flip"
                onClicked: {
                    if ( generic.mirrored == true){
                        generic.rotationangle =  0
                        generic.mirrored = false
                    }
                    else {
                       rotationangle = 180
                       generic.mirrored = true
                    }
                }
             }

             IconButton {
                width: parent.width/3
                icon.source: "image://theme/icon-l-gps"
                opacity: generic.speed<0? 0.3 : 1.0
                       onClicked: { positionSource.active? positionSource.stop() : positionSource.start()
                       }
                }

                Button {id: unitbutton
                    width: parent.width/3
                   // height: parent.width/3
                    text: "km/h"
                    onClicked: {
                       if ( generic.speedunit === "km/h"){
                           text = "mph"
                           generic.speedunit = "mph"
                       }
                       else {
                           text = "km/h"
                           generic.speedunit = "km/h"
                       }
                   }
                }
        }
    }

    SimpleTorchScreenBlank{
        activated: Qt.application.active
    }
}
