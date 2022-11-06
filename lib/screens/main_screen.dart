import 'package:hackup_toss/config/palette.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignupScreen = true; //로그인상태관리, 디폴트사인업메뉴
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(//층층이, 위젯을 원하는 곳에 배치
          children: [
            Positioned(
              top: 0,
              right: 0, //container위치를 상단에 시작점에 맞춤
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/KakaoTalk_20221104_003711298.jpg'),
                      fit: BoxFit.fill //상단여백없앰
                  ),
                ),
                child: Container(//텍스트부분
                  padding: EdgeInsets.only(top: 90, left: 20),
                  child: Column(//두줄
                    crossAxisAlignment: CrossAxisAlignment.start,//왼쪽시작
                    children: [
                      RichText(//같은줄의 텍스트가 폰트나 크기다를때
                        text: TextSpan(//텍스트를 모아서구성
                            text: "Welcome",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 25,
                                color: Colors.white
                            ),
                            children: [
                              TextSpan(
                                text:
                                isSignupScreen ? " to Yesl Chat!" : " back",
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ]
                        ),
                      ),
                      SizedBox(//두줄사이간격
                        height: 5.0,
                      ),
                      Text(
                        "Signup to continue",
                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),//배경
            Positioned(
              top: 180,
              child: Container(
                padding: EdgeInsets.all(20.0),
                height: 280.0,
                width: MediaQuery.of(context).size.width-40,//디바이스별크기에 따라 조절
                margin: EdgeInsets.symmetric(horizontal: 20.0),//좌우여백 20
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),//모서리둥글
                    boxShadow: [//다양한 색조합이므로 리스트로 가져옴
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),//투명도 0.3
                          blurRadius: 15,
                          spreadRadius: 5
                      )
                    ]
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,//두메뉴사이간격
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false; //사용자가 로그인메뉴 선택
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen ? Palette.activeColor : Palette.textColor1
                                ),
                              ),
                              if(!isSignupScreen)//사인업이 선택되지않으면(false) 밑줄표시
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(//사용자가 각메뉴탭할수있게
                          onTap: (){
                            setState(() {
                              isSignupScreen = true; //사용자가 사인업메뉴 선택
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Signup",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen ? Palette.activeColor : Palette.textColor1
                                ),
                              ),
                              if(isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if(isSignupScreen)// 3개텍폼필보여짐
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form( //로그인과 사인업을 할때 밸리데이션체크를위해
                          child: Column(
                            children: [
                              TextFormField(//텍스트필드가 많을때 밸리데이션값받기 수월
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),//텍스트필드의 텍스트앞에 아이콘
                                    enabledBorder: OutlineInputBorder(//아웃라인볼더를 둥글게
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(//텍스트선택시 아웃볼더
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText:  'User name',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)//텍스트필드크기
                                ),
                              ),
                              TextFormField(//텍스트필드가 많을때 밸리데이션값받기 수월
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),//텍스트필드의 텍스트앞에 아이콘
                                    enabledBorder: OutlineInputBorder(//아웃라인볼더를 둥글게
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(//텍스트선택시 아웃볼더
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText:  'User name',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)//텍스트필드크기
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              TextFormField(//텍스트필드가 많을때 밸리데이션값받기 수월
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),//텍스트필드의 텍스트앞에 아이콘
                                    enabledBorder: OutlineInputBorder(//아웃라인볼더를 둥글게
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(//텍스트선택시 아웃볼더
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText:  'User name',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)//텍스트필드크기
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    if(isSignupScreen)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(//텍스트필드가 많을때 밸리데이션값받기 수월
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle,
                                      color: Palette.iconColor,
                                    ),//텍스트필드의 텍스트앞에 아이콘
                                    enabledBorder: OutlineInputBorder(//아웃라인볼더를 둥글게
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(//텍스트선택시 아웃볼더
                                      borderSide: BorderSide(
                                          color: Palette.textColor1
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText:  'User name',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Palette.textColor1
                                    ),
                                    contentPadding: EdgeInsets.all(10)//텍스트필드크기
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),//텍스트폼필드
          ],
        )
    );
  }
}


