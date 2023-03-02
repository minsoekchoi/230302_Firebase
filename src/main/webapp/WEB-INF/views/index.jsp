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
		<h2>파이어 베이스 email로 회원가입</h2>
		<div>
			email : <input type="email" id="joinEmail">
		</div>
		<div>
			password : <input type="password" id="joinPassword">
		</div>
		<input type="submit" value="회원가입" id="joinButton">
	</form>
	<hr>
	<form>
		<h2>파이어 베이스 email로 로그인</h2>
		<div>
			email : <input type="email" id="logInEmail">
		</div>
		<div>
			password : <input type="password" id="logInPassword">
		</div>
		<input type="submit" value="로그인" id="logInButton">
	</form>
	<script type="module">
	// 1. Firebase와 Project 연결
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-analytics.js";
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

	// 2. 비밀번호 기반 계정 만들기 - 복사 - 붙이기
	// 그 후, form "firebase/auth"를 
    // import { initializeApp } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js";의
	// https://www.gstatic.com/firebasejs/9.17.1/firebase-app.js
 	// 를 붙이고 app를 auth로 수정한다

	// 로그인 실행 시 signInWithEmailAndPassword 를 import에 추가한다.
  import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/9.17.1/firebase-auth.js";
  const auth = getAuth();

	// 회원가입 버튼을 클릭 할 때
  document.getElementById('joinButton').addEventListener('click', function(event){
		event.preventDefault();
		// console.log('1');
		const email = document.getElementById('joinEmail').value;
		const password = document.getElementById('joinPassword').value;
  		createUserWithEmailAndPassword(auth, email, password)
    		.then((userCredential) => {
      		// Signed in_ 성공 시 호출 되는 함수
      		const user = userCredential.user;
			console.log(user);
			console.log(user.accessToken);
			console.log(user.uid);
			// uid = userId?
		 })
    		.catch((error) => {
		    // 실패
	  		// const는 var랑 비슷함 const = 상수, 변수 개념으로 쓰는것이다.
			alert("회원가입 실패");
			return ;
     		// const errorCode = error.code;
     		// const errorMessage = error.message;
      		// ..
    	});

  });

	// 로그인 버튼을 클릭 할 때
  document.getElementById('logInButton').addEventListener('click', function(event){
		event.preventDefault();
		// console.log('2');
		const email = document.getElementById('logInEmail').value;
		const password = document.getElementById('logInPassword').value;
	
		signInWithEmailAndPassword(auth, email, password)
	  		.then((userCredential) => {
			alert("로그인 성공");
  		    // Signed in
	     	const user = userCredential.user;
    		// ...
  		})
			.catch((error) => {
			alert("로그인 실패");
			return ;
    		// const errorCode = error.code;
    		// const errorMessage = error.message;
  		});
  });


</script>
</body>
</html>