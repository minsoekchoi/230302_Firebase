<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="resources/img/btn_google.png" id="googleLogIn">

	<script type="module">
	// 1. Firebase와 Project 연결
    // Import the functions you need from the SDKs you need
  	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
  	import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-analytics.js";
	import { getAuth, signInWithPopup, GoogleAuthProvider } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-auth.js";
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries
	
  	// Your web app's Firebase configuration
  	// For Firebase JS SDK v7.20.0 and later, measurementId is optional
  	const firebaseConfig = {
    	apiKey: "AIzaSyCug7KomBbrtO6PrOARU7IH9FOPhlNQl0g",
    	authDomain: "logintest-4fd58.firebaseapp.com",
   		projectId: "logintest-4fd58",
    	storageBucket: "logintest-4fd58.appspot.com",
    	messagingSenderId: "22472930227",
    	appId: "1:22472930227:web:d179b95f22b1cfb27311c6",
    	measurementId: "G-6TT9XGJ2CM"
  	};

  	// Initialize Firebase
  	const app = initializeApp(firebaseConfig);
  	const analytics = getAnalytics(app);
  	// console.log(app);

	// 2. Firebase SDK로 로그인 과정 처리 = 복사 / 붙이기
	// 위로 이동 : import { GoogleAuthProvider } from "firebase/auth";
	const provider = new GoogleAuthProvider();

	// 3. 이벤트처리 _ Google 제공업체 객체를 사용해 Firebase에 인증합니다.
    // 팝업 창을 띄우거나 로그인 페이지로 리디렉션하여 사용자가 Google 계정에 로그인하도록 유도할 수 있습니다.
	// 휴대기기의 경우 리디렉션을 사용할 것을 권장합니다.
	// import { getAuth, signInWithPopup, GoogleAuthProvider } from "firebase/auth";
	// 겹쳐서 하나로 합침

	const auth = getAuth();

	document.getElementById('googleLogIn').addEventListener('click', function(event){
		// 팝업창
		// 도메인 문제 발생 : 프로젝트-인증-setting-승인된 도메인 확인
		// 도메인 이름은 사람들이 원하는 사이트에 방문하기 위해 브라우저에서 입력하는 주소를 말합니다.
		signInWithPopup(auth, provider)
  			.then((result) => {
			// This gives you a Google Access Token. You can use it to access the Google API.
			const credential = GoogleAuthProvider.credentialFromResult(result);
    		const token = credential.accessToken;
    		// The signed-in user info.
    		const user = result.user;
    		// ...
		  }).catch((error) => {
    		// Handle Errors here.
    		const errorCode = error.code;
    		const errorMessage = error.message;
    		// The email of the user's account used.
    		const email = error.customData.email;
    		// The AuthCredential type that was used.
    		const credential = GoogleAuthProvider.credentialFromError(error);
    		// ...
 		 });
	});	
	</script>
</body>
</html>