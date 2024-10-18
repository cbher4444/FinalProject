<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Zego Express Video Call</title>
    <style type="text/css">
        * {
            font-family: sans-serif;
        }

        h1,
        h4 {
            text-align: center;
        }

        #local-video, #remote-video {
            width: 400px;
            height: 300px;
            border: 1px solid #dfdfdf;
        }

        #local-video {
            position: relative;
            margin: 0 auto;
            display: block;
        }

        #remote-video {
            display: flex;
            margin: auto;
            position: relative !important;
        }
    </style>
</head>

<body>
    <h1>
        Zego RTC Video Call
    </h1>
    <h4>Local video</h4>
    <div id="local-video"></div>
    <h4>Remote video</h4>
    <div id="remote-video"></div>
    <script>
 // Unique AppID of a project, which is of the Number type. You can obtain it in ZEGOCLOUD Admin Console.
    let appID = "880165234"; 
    // Access server address, which is of the String type. You can obtain it in ZEGOCLOUD Admin Console. (For more information about how to obtain it, see Prerequisites.)
    let server = "5b273e51739a831ec02f25b22e333821";

    // Instance initialization
    const zg = new ZegoExpressEngine(appID, server);

    // Room status update callback
    zg.on('roomStateChanged', (roomID, reason, errorCode, extendData) => {
            if (reason == 'LOGINING') {
                // Logging in.
            } else if (reason == 'LOGINED') {
                // Login successful.
                // Only after a user successfully logs in to a room or switches the room, can `startPublishingStream` and `startPlayingStream` be called to publish and play streams properly.
                // Publish streams to ZEGOCLOUD audio and video cloud.
            } else if (reason == 'LOGIN_FAILED') {
                // Login failed.
            } else if (reason == 'RECONNECTING') {
                // Reconnecting.
            } else if (reason == 'RECONNECTED') {
                // Reconnection successful.
            } else if (reason == 'RECONNECT_FAILED') {
                // Reconnection failed.
            } else if (reason == 'KICKOUT') {
                // Forced to log out of a room.
            } else if (reason == 'LOGOUT') {
                // Logout successful.
            } else if (reason == 'LOGOUT_FAILED') {
                // Logout failed.
            }
    });

    // Notification of users joining or leaving a room
    // The `roomUserUpdate` callback can be received only when `ZegoRoomConfig` in which the `userUpdate` parameter is set to `true` is passed in the `loginRoom` method.
    zg.on('roomUserUpdate', (roomID, updateType, userList) => {
        if (updateType == 'ADD') {
            for (var i = 0; i < userList.length; i++) {
                console.log(userList[i]['email'], 'joins the room:', roomID)
            }
        } else if (updateType == 'DELETE') {
            for (var i = 0; i < userList.length; i++) {
                console.log(userList[i]['email'], 'leaves the room:', roomID)
            }
        }
    });

    zg.on('roomStreamUpdate', async (email, updateType, streamList, extendedData) => {
        // Notification of audio or video stream updates of other users in a room

    
    const result = await zg.checkSystemRequirements();
	 // The returned [result] is the compatibility result.  [webRTC] is [true] indicates webRTC is supported, for more details, see the API documents.
	 console.log(result);
	 // {
	 //   webRTC: true,
	 //   customCapture: true,
	 //   camera: true,
	 //   microphone: true,
	 //   videoCodec: { H264: true, H265: false, VP8: true, VP9: true },
	 //   screenSharing: true,
	 //   errInfo: {}
	 // }
	 
    });
    </script>
</body>

</html>