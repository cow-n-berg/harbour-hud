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

CoverBackground {

    Image {
        id: icon
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height/2.3
        width : height
        fillMode: Image.PreserveAspectCrop
        opacity: 0.09
        source: "file:///usr/share/icons/hicolor/86x86/apps/harbour-hud.png"
    }

            Label {
                //transform: Rotation { origin.x: (parent.width/1.8 ) ; origin.y:(parent.height/2.2)  ;  angle: 90}

                id: label
                x : Theme.paddingSmall
                text: generic.speedunit === "km/h"? generic.kmhspeed  : generic.mphspeed
                width : parent.width  - 2 * Theme.paddingSmall
                font.pixelSize: parent.height / 2.5
                horizontalAlignment: Text.AlignRight
            }
            Label {
                //transform: Rotation { origin.x: (parent.width/1.8 ) ; origin.y:(parent.height/2.2)  ;  angle: 90}

                id: label2
                anchors.top: label.bottom
                x: Theme.paddingLarge
                text: generic.speedunit
                font.pixelSize: parent.height / 4.2
                width : parent.width  - 2 * Theme.paddingLarge
                horizontalAlignment: Text.horizontalCenter
            }

// cover actions need some work (hoe krijg je de knoppen geclicked?
            //en waar is de waarde van despeed gebleven?  )
   /* CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-sync"
            onTriggered: page.unitbutton.clicked()
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-shuffle"
            onTriggered: page.flipbutton.clicked()
        }
    }*/
}


