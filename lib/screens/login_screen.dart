import 'package:flutter/material.dart';
import 'package:things_register2/util/pallette.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left:0,
            child: Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/red.jpg'),
                        fit:BoxFit.fill
                    )
                ),
                child: Container(
                    padding: EdgeInsets.only(top:90, left:20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: '환영합니다!',
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color:Colors.white
                              ),
                              children: [
                                TextSpan(
                                  text: '플레져스입니다!',
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '로그인화면입니다.',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              color:Colors.white,
                            )
                        )
                      ],
                    )
                )
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: 280,
              width: MediaQuery.of(context).size.width-40,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '로그인',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.activeColor
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(top:3),
                            height:  2,
                            width: 55,
                            color: Colors.orange,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                              '회원가입',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.activeColor
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top:3),
                            height:  2,
                            width: 55,
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
