import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:things_register2/screens/main_screen.dart';
import 'package:things_register2/util/const.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // 디바이스에서 이용가능한 카메라 목록을 받아옵니다.
  final cameras = await availableCameras();

  // 이용가능한 카메라 목록에서 특정 카메라를 얻습니다.
  final firstCamera = cameras.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: MainScreen(),
    );
  }
}
