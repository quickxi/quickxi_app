import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 68, 2),
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: '아이디',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20), // 입력 필드 간 간격
            TextField(
              obscureText: true, // 비밀번호 숨김 처리
              decoration: InputDecoration(
                labelText: '패스워드', // 입력 필드 레이블
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print('로그인 시도');
              },
              child: Text(
                '로그인',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            TextButton(
              onPressed: () {
                print('비밀번호 찾기');
              },
              child: Text(
                '비밀번호 찾기',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'quickxi',
              style: TextStyle(
                fontWeight: FontWeight.bold, // 글자 굵기를 bold로 설정
                color: Colors.white, // 글자 색상을 흰색으로 설정
                fontSize: 20, // 글자 크기 설정
              ),
            ),
          ],
        ),
      ),
    );
  }
}
