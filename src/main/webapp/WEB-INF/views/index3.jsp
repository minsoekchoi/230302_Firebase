<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		핸드폰 번호 : <input type="text" id="phoneNumber">
		<input type="submit" value="핸드폰 번호 전송" id="phoneNumberButton">
	</form>
	<hr>
	<form>
		확인 코드 : <input type="text" id="confirmCode">
		<input type="submit" value="확인 코드 전송" id="confirmCodeButton">
	</form>

	<script type="module">
	// 1. Firebase와 Project 연결
    // Import the functions you need from the SDKs you need
  	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
  	import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-analytics.js";
  	import { getAuth, RecaptchaVerifier, signInWithPhoneNumber } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-auth.js";
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
  	
  	// 2. 전화번호 위젯
  	const auth = getAuth();
  	// sign-in-button -> phoneNumberButton
  	window.recaptchaVerifier = new RecaptchaVerifier('phoneNumberButton', {
  	  'size': 'invisible',
  	  'callback': (response) => {
  	    // reCAPTCHA solved, allow signInWithPhoneNumber.
  	    onSignInSubmit();
  	  }
  	}, auth);
  	
  	// 3. 이벤트 처리
	// 3-1. 핸드폰으로 확인 코드 전송
  	document.getElementById('phoneNumberButton').addEventListener('click', function(event){
		event.preventDefault();  		
		const phoneNumber = document.getElementById('phoneNumber').value;
  		const appVerifier = window.recaptchaVerifier;
  		
  		// 오류 이유 : 국제 전화 시 +82 넣어줘야 한다.
  		signInWithPhoneNumber(auth, '+82'+phoneNumber, appVerifier)
  		    .then((confirmationResult) => {
			  // alert("성공");
  		      // SMS sent. Prompt user to type the code from the message, then sign the
  		      // user in with confirmationResult.confirm(code).
  		      window.confirmationResult = confirmationResult;
  		      // ...
  		    }).catch((error) => {
			  // alert("실패");
  		      // Error; SMS not sent
  		      // ...
  		    });
  	});

	// 3-2. 확인 코드 전송 받은거 확인하기
	document.getElementById('confirmCodeButton').addEventListener('click', function(event){
		event.preventDefault();
		const code = document.getElementById('confirmCode').value;
		confirmationResult.confirm(code).then((result) => {
			// User signed in successfully.
  			alert("성공");
			const user = result.user;
			console.log(user);
			console.log(user.uid);
			console.log(user.phoneNumber);
			}).catch((error) => {
  			// User couldn't sign in (bad verification code?)
				alert("실패");
				return;
		});
	});
  	
	</script>
	
</body>
</html>