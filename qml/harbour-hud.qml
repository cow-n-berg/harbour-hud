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
import QtPositioning 5.2
import "pages"
//import org.nemomobile.dbus 1.0


ApplicationWindow

{id: generic
    property int speed : positionSource.position.speed
    property int kmhspeed : positionSource.position.speed<0? 0: ((positionSource.position.speed )* 60 * 60 ) / 1000
    property int mphspeed : positionSource.position.speed <0? 0: kmhspeed * 0.621371192
    property bool mirrored : false
    property string speedunit : "km/h"
    property int rotationangle: 0

    // Speed is groundspeed in unit m/s
    // to make km/h multiply with 60 (sec) makes meter per minute and 60 (min) makes meter per hour
    // divide by 1000 makes km/h (km/u).

    PositionSource {
                 id: positionSource
                 preferredPositioningMethods: PositionSource.SatellitePositioningMethods
                 updateInterval: 1000
                 active: true
             }


    initialPage: Component { FirstPage {id: page} }

    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    Speedometer { id: speedo
    }

}


