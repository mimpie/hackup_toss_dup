import 'package:flutter/material.dart';
import 'package:hackup_toss/config/palette.dart';
import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isMyStock = true; //로그인상태관리, 디폴트사인업메뉴
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(//층층이, 위젯을 원하는 곳에 배치
          children: [
            Positioned(
              //top: 180,
              child: Container(
                padding: EdgeInsets.all(20.0),
                //height: 280.0,
                //width: MediaQuery.of(context).size.width-40,//디바이스별크기에 따라 조절
                //margin: EdgeInsets.symmetric(horizontal: 20.0),//좌우여백 20
                decoration: BoxDecoration(
                  color: Colors.grey,
                  //borderRadius: BorderRadius.circular(15.0),//모서리둥글
                ),
                child: Column( // 큰틀
                  children: [
                    Row( // 로긴, 사인업
                      mainAxisAlignment: MainAxisAlignment.spaceAround,//두메뉴사이간격
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isMyStock = true; //사용자가 로그인메뉴 선택
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "내 주식",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isMyStock ? Palette.activeColor : Palette.textColor1
                                ),
                              ),
                              if(isMyStock)//사인업이 선택되지않으면(false) 밑줄표시
                                Container(
                                  margin: EdgeInsets.only(top: 6),
                                  height: 2,
                                  width: 100,
                                  color: Colors.white,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(//사용자가 각메뉴탭할수있게
                          onTap: (){
                            setState(() {
                              isMyStock = false; //사용자가 사인업메뉴 선택
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "오늘의 발견",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isMyStock ? Palette.activeColor : Palette.textColor1
                                ),
                              ),
                              if(!isMyStock)
                                Container(
                                  margin: EdgeInsets.only(top: 6),
                                  height: 2,
                                  width: 100,
                                  color: Colors.white,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if(isMyStock) // 내주식아랫부분
                      Column( // 텍스트, 버튼
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 300,
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text("증권 계좌 만들면\n해외주식 무료로 드려요",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          TextButton(
                              onPressed: () {},
                              child: Text('무료 주식 받기'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                primary: Colors.white,
                              elevation: 1,
                            ),
                          ),
                        ],

                      ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: 300,
                      height: 20.0,
                      color: Colors.black,
                    ),

                    Expanded(
                        child: pageStock()

                    ),



                  ],
                ),
              ),
            ),//텍스트폼필드
          ],
        )
    );
  }
}




class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Hi'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearch()
                );
              }
          ),
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearch()
                );
              }
          )
        ],
        //elevation: 50.0,
      ),
      body: LoginScreen(),
      //로그인 스크린안에 익스펜디드에 리스트뷰위젯넣기->
      //주식페이지를 스캐폴드말고 컨테이너로 감싼후
      //children이니까 만든주식위젯 바로 ㅁ밑에넣기oo-> 오버플로우
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80.0),
              topRight: Radius.circular(20.0)
          ),
          child: BottomNavigationBar(
            currentIndex: 3,
            selectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Palette.textColor1),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.diamond, color:  Palette.textColor1,),
                label: '혜택',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.money, color:  Palette.textColor1,),
                label: '송금',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.area_chart, color:  Palette.textColor1,),
                label: '주식',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded, color:  Palette.textColor1,),
                label: '전체',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'hackup', 'fighting', 'ham', 'ber', 'ger'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          }
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }
}


class pageStock extends StatefulWidget {
  const pageStock({Key? key}) : super(key: key);

  @override
  State<pageStock> createState() => _pageStockState();
}

class _pageStockState extends State<pageStock> {

  static List<String> stockName = [ //주식이름 리스트 문자열 변수
    '삼성전자', '카카오', 'NAVER', 'SK하이닉스', '현대차', 'LG화학',
    '대한항공', '셀트리온', '삼성바이오로직스', 'LG전자'
  ];

  static List<String> stockImgPath = [ //주식이름 리스트 문자열 변수
    //사진경로 넣기, yaml파일에도
    /*'image/bear.png', 'image/fox.png', 'image/deer.png', 'image/camel.png', 'image/tiger.png',
    'image/lion.png', 'image/koala.png', 'image/kangaroo.png', 'image/back.png', 'image/red.jpg'*/
    'image/테슬라.png', 'image/테슬라.png', 'image/테슬라.png', 'image/테슬라.png', 'image/테슬라.png',
    'image/테슬라.png', 'image/테슬라.png', 'image/테슬라.png', 'image/테슬라.png', 'image/테슬라.png'
  ];

  static List<String> stockAddPerson = [ //주식이름 리스트 문자열 변수
    //몇명추가 넣기->명수는 변수로하고 추가부분만 텍스트로?
    '1,324,634명 추가', '1,324,634명 추가', '1,324,634명 추가', '1,324,634명 추가', '1,324,634명 추가',
    '1,324,634명 추가', '1,324,634명 추가', '1,324,634명 추가', '1,324,634명 추가', '1,324,634명 추가'
  ];

  /*static List<String> stockAddButton = [ //주식이름 리스트 문자열 변수
  //버튼은 리스트로 넣어지려나? 객체생성후 위에 콘테이너로?
    //버튼아이콘은 잇음
  ];*/

  final List<Stock> stockData = List.generate(stockName.length, (index) => //길이만큼 오름차순 호출
  Stock(stockName[index], stockImgPath[index], stockAddPerson[index])); //주식데이터전달

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
      itemCount: stockName.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.grey,
          elevation: 0.0, //위공간사라짐
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.zero //카드 디폴트 모양은 둥글
          ),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stockData[index].name,
                  style: TextStyle(
                    color: Palette.textColor1,
                    fontSize: 17.0,
                  ),
                ),
                //SizedBox(height: 7.0),
                Text(
                  stockData[index].addPerson,
                  style: TextStyle(
                      color: Palette.textColor1,
                      fontSize: 13.0
                  ),
                ),
              ],
            ),
            leading: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset(stockData[index].imgPath),
            ),
          ),
        );
      },
    );

  }
}









