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

Page {
    id: speedo

    property int pageangle

    onStatusChanged:{page.blankingtimer.restart()}

    transform: Rotation {origin.x: icon.width /2 ; origin.y: icon.height; axis { x: 1; y: 1; z: 0 } angle: pageangle  }

    onOrientationChanged: {
        if (Orientation.LandscapeInverted)
            {pageangle = 0
        }
        else{pageangle = 180
        }

            // if portrait: the image is half on the screen and half not,
            // and rotation is problematic
             //else {pageangle =180
            //}

    }

    allowedOrientations: Orientation.LandscapeInverted // Orientation.Landscape || Orientation.Portrait

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        Rectangle{
            transform: Rotation { origin.x: speedo.width/ 2; origin.y: parent.height ; axis { x: 0; y: 1; z: 0 } angle: generic.rotationangle }

            Image {
                id: icon
                source: generic.speedunit=="km/h"? "Speedometertemp2.png" : "Speedometertempmph.png"
            }

            Image {
                id: needle
                x: 335
                y: 278
                //width: 190
                //height: 45
                source: "Needle.png"
                transform: Rotation{
                                origin.x:143;
                                origin.y:18 ;
                                angle: generic.speedunit=="km/h"? 0.91 * generic.kmhspeed : 0.91 * 2 * generic.mphspeed

                }
                smooth: true
            }

            IconButton {
                x : 735
                y : 8
                icon.source: "image://theme/icon-l-gps"
                opacity: generic.speed<0? 0.3 : 1.0
            }

        }
    }
}
