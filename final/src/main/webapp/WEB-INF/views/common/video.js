 let localStream;
let peerConnection;
const configuration = {
    iceServers: [{ urls: 'stun:stun.l.google.com:19302' }] // STUN 서버 설정
};

const localVideo = document.getElementById('localVideo');
const remoteVideo = document.getElementById('remoteVideo');

// WebSocket 연결 설정
const webSocket = new WebSocket('ws://localhost:8080/chat');

// WebSocket 메시지 처리
webSocket.onmessage = function(message) {
    const data = JSON.parse(message.data);

    if (data.offer) {
        // 상대방으로부터 offer를 받으면 처리
        handleOffer(data.offer);
    } else if (data.answer) {
        // 상대방으로부터 answer를 받으면 처리
        handleAnswer(data.answer);
    } else if (data.candidate) {
        // ICE candidate 처리
        handleCandidate(data.candidate);
    }
};

async function startCall() {
    // 사용자 미디어(비디오/오디오) 가져오기
    localStream = await navigator.mediaDevices.getUserMedia({ video: true, audio: true });
    localVideo.srcObject = localStream; // 본인 비디오 표시

    // WebRTC 연결 설정
    peerConnection = new RTCPeerConnection(configuration);

    // localStream 트랙을 peerConnection에 추가
    localStream.getTracks().forEach(track => peerConnection.addTrack(track, localStream));

    // ICE 후보 전송
    peerConnection.onicecandidate = event => {
        if (event.candidate) {
            sendToServer({ candidate: event.candidate });
        }
    };

    // 상대방의 스트림을 수신하면 비디오에 표시
    peerConnection.ontrack = event => {
        remoteVideo.srcObject = event.streams[0];
    };

    // Offer 생성
    const offer = await peerConnection.createOffer();
    await peerConnection.setLocalDescription(offer);

    // 서버로 Offer 전송
    sendToServer({ offer });
}

// WebSocket을 통해 서버로 메시지 전송
function sendToServer(message) {
    webSocket.send(JSON.stringify(message));
}

// 상대방으로부터 Offer 수신 처리
async function handleOffer(offer) {
    peerConnection = new RTCPeerConnection(configuration);

    // localStream 트랙을 peerConnection에 추가
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
    
    // Answer 생성
    const answer = await peerConnection.createAnswer();
    await peerConnection.setLocalDescription(answer);

    // 서버로 Answer 전송
    sendToServer({ answer });
}

// 상대방으로부터 Answer 수신 처리
async function handleAnswer(answer) {
    await peerConnection.setRemoteDescription(new RTCSessionDescription(answer));
}

// ICE Candidate 처리
async function handleCandidate(candidate) {
    await peerConnection.addIceCandidate(new RTCIceCandidate(candidate));
}
 