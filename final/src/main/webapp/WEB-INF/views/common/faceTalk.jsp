<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/@zegocloud/zego-uikit-prebuilt/zego-uikit-prebuilt.js"></script>
<script defer src="video.js"></script>

 
<script>
        $(document).ready(function() { 
            // 화상 통화 버튼 클릭 시 팝업 창 띄우기
            $('#videoCall-btn').click(function() {
                $('#videoCall-btn').fadeOut();
                $('#videoCall-btn').removeClass('red-dot');
                // AJAX 요청 또는 바로 팝업 열기
                $('#video-popup').fadeIn();
            });

            // 팝업 닫기 버튼
            $('#close-video-popup').click(function(){
                $('#video-popup').fadeOut();
                $('#videoCall-btn').fadeIn();
            });

            // 화상 통화 시작 버튼
            $('#startCall').click(function() {
                startCall();
            });
        });
    </script>

<style>
#videoCall-btn {
	position: fixed;
	bottom: 40px;
	right: 10%;
	z-index: 999;
	background-color: white;
	border: 2px solid #dbdbdb;
	outline: none;
	cursor: pointer;
	padding: 10px;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	font-size: 13px;
	font-weight: 500;
	color: #333333;
}

#video-popup {
	display: none;
	width: 1000px;
	height: 600px;
	background-color: #f1f1f1;
	border: 1px solid #888;
	position: fixed;
	bottom: 50px;
	right: 50px;
	z-index: 1200;
}
 
        #localVideo, #remoteVideo {
            width: 400px;
            height: 400px;
            background-color: black;
            margin: 10px;
        }
        .red-dot {
            background-color: red;
            border-radius: 50%;
            width: 10px;
            height: 10px;
            display: inline-block;
        }
        
        #close-video-popup{
        position:absolute;
		right:1px;
		top:5px;
		background-color:red;
        }
</style>
</head>
<body>
	 <button type="button" id="videoCall-btn">화상 통화</button>

    <!-- 팝업 창 -->
    <div id="video-popup" align="center">
        <h2 id="video-head-line">커플 화상 통화</h2>
        <button id="close-video-popup">X</button>
        
        <div id="videoArea">
            <video id="localVideo" autoplay playsinline></video>
            
            <video id="remoteVideo" autoplay playsinline></video>
        </div>
        <button id="startCall">화상 통화 시작</button>
    </div>

 <script>
    let localStream;
    let peerConnection;
    const configuration = {
        iceServers: [{ urls: 'stun:stun.l.google.com:19302' }]
    };

    const localVideo = document.getElementById('localVideo');
    const remoteVideo = document.getElementById('remoteVideo');
    const closeVideoPopupBtn = document.getElementById('close-video-popup');

    // WebSocket 연결 설정
    const webSocket = new WebSocket('ws://localhost:8444/chat');

    webSocket.onmessage = function(message) {
        const data = JSON.parse(message.data);
        if (data.offer) {
            handleOffer(data.offer);
        } else if (data.answer) {
            handleAnswer(data.answer);
        } else if (data.candidate) {
            handleCandidate(data.candidate);
        }
    };

    async function startCall() {
        try {
            localStream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
            localVideo.srcObject = localStream;

            peerConnection = new RTCPeerConnection(configuration);
            localStream.getTracks().forEach(track => peerConnection.addTrack(track, localStream));

            peerConnection.onicecandidate = event => {
                if (event.candidate) {
                    sendToServer({ candidate: event.candidate });
                }
            };

            peerConnection.ontrack = event => {
                remoteVideo.srcObject = event.streams[0];
            };

            const offer = await peerConnection.createOffer();
            await peerConnection.setLocalDescription(offer);
            sendToServer({ offer });
        } catch (error) {
            console.error('Error accessing media devices:', error);
            alert('카메라 또는 마이크 접근이 허용되지 않았습니다: ' + error.message);
        }
    }

    function sendToServer(message) {
        webSocket.send(JSON.stringify(message));
    }

    async function handleOffer(offer) {
        peerConnection = new RTCPeerConnection(configuration);
        localStream.getTracks().forEach(track => peerConnection.addTrack(track, localStream));

        peerConnection.onicecandidate = event => {
            if (event.candidate) {
                sendToServer({ candidate: event.candidate });
            }
        };

        peerConnection.ontrack = event => {
            remoteVideo.srcObject = event.streams[0];
        };

        await peerConnection.setRemoteDescription(new RTCSessionDescription(offer));
        const answer = await peerConnection.createAnswer();
        await peerConnection.setLocalDescription(answer);
        sendToServer({ answer });
    }

    async function handleAnswer(answer) {
        await peerConnection.setRemoteDescription(new RTCSessionDescription(answer));
    }

    async function handleCandidate(candidate) {
        await peerConnection.addIceCandidate(new RTCIceCandidate(candidate));
    }

    // X 버튼 클릭 시 화상 통화 종료
    closeVideoPopupBtn.addEventListener('click', stopCall);

    function stopCall() {
        if (peerConnection) {
            peerConnection.close(); // WebRTC 연결 종료
            peerConnection = null;
        }
        if (localStream) {
            localStream.getTracks().forEach(track => track.stop()); // 카메라/마이크 사용 중지
            localStream = null;
        }
        // 화상 통화 팝업 숨기기
        document.getElementById('video-popup').style.display = 'none';
    }

    // 화상 통화 시작 버튼 클릭 이벤트 설정
    document.getElementById('startCall').addEventListener('click', startCall);
</script>
   
</body>
</html>