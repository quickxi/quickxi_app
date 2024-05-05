import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

/// stless -> StatelessWidget 생성 단축키
/// StatelessWidget(HomeScreen)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/img/taxi.png',
          ),
          Text(
            'Quickxi',
            style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '세상에 없던 혁신적인 어쩌고 퀵 배송 저쩌고',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            onPressed: () {
              print('로그인 버튼 클릭');
            },
            child: Text('로그인'),
          ),
          SizedBox(
            height: 12.0,
          ),
          ElevatedButton(
            onPressed: () {
              print('회원가입 버튼 클릭');
            },
            child: Text('회원가입'),
          )
        ],
      ),
    );
  }
}
