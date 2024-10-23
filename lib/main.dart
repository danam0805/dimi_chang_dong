import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'description_page.dart';
import 'start_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late TabController _tabController;
  bool _showAppBar = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // TabBarView에서 현재 선택된 탭의 인덱스에 따라 앱바를 숨기거나 보이는 로직 추가
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 2 || _tabController.index == 3) {
          _showAppBar = false;  // WritingTab 또는 ProfileTab에서는 앱바를 숨김
        } else {
          _showAppBar = true;   // 다른 탭에서는 앱바를 표시
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: _showAppBar
          ? AppBar(
        backgroundColor: Color(0xFFF4F4F4),
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(32.0),
                  border: Border.all(color: Color(0xFF0044FF)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '키워드를 입력하세요',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Color(0xFF0044FF),
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image.asset(
                'img/bell.png',
                width: 33,
                height: 34,
              ),
            ),
          ],
        ),
      )
          : null,  // 앱바를 숨길 때 null로 처리
      body: TabBarView(
        controller: _tabController,
        children: [
          buildHomeTab(),
          buildCommunityTab(),
          buildWritingTab(),
          buildProfileTab(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFF4F4F4),
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Image.asset(
                'img/home.png',
                width: 52,
                height: 52,
              ),
            ),
            Tab(
              icon: Image.asset(
                'img/community.png',
                width: 52,
                height: 52,
              ),
            ),
            Tab(
              icon: Image.asset(
                'img/writing.png',
                width: 52,
                height: 52,
              ),
            ),
            Tab(
              icon: Image.asset(
                'img/profile.png',
                width: 52,
                height: 52,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildTag(String text) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF0044FF)),
        borderRadius: BorderRadius.circular(24),
      ),

      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: Color(0xFF0044FF),
        ),
      ),
    );
  }
  Widget buildHomeTab() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 152,
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF939393),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF939393),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF939393),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: WormEffect(
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        spacing: 8.0,
                        dotColor: Color(0xFFADADAD),
                        activeDotColor: Color(0xFF0044FF),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '추천 공모전',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF939393),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DescriptionPage()), // Navigate to description_page.dart
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 21.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Junction Asia 2024',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildTag('개발'),
                                  _buildTag('디자인'),
                                  _buildTag('기획'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF939393),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DescriptionPage()), // Navigate to description_page.dart
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 21.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Junction Asia 2024',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildTag('개발'),
                                  _buildTag('디자인'),
                                  _buildTag('기획'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCommunityTab() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xFFC0C0C0),
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                child: Text(
                  '자유 커뮤니티',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  '지식 나눔',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  '인력 구인',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                buildFreeCommunityTab(),
                buildKnowledgeSharingTab(),
                buildRecruitmentTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget buildFreeCommunityTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: Container(
              width: double.infinity,
              height: 152,
              decoration: BoxDecoration(
                color: Color(0xFF939393),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF939393),
                              radius: 15,
                            ),
                            SizedBox(width: 16),
                            Row(
                              children: [
                                Text(
                                  '이찬혁',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 3),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 2),
                                    Text(
                                      '방금',
                                      style: TextStyle(
                                        color: Color(0xFF939393),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 6,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          '내일 축제 같이 즐길 사람 구해요...!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '내일 축제 때 같이 다닐 사람 구해요..! 맛있는거 많이 사드릴게요!',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF939393),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite_border),
                                SizedBox(width: 5),
                                Text('21'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.comment),
                                SizedBox(width: 5),
                                Text('5'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.remove_red_eye),
                                SizedBox(width: 5),
                                Text('78'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildKnowledgeSharingTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
            child: Container(
              width: double.infinity,
              height: 152,
              decoration: BoxDecoration(
                color: Color(0xFF939393),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF939393),
                              radius: 15,
                            ),
                            SizedBox(width: 16),
                            Row(
                              children: [
                                Text(
                                  '이찬혁',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(width: 3),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 2),
                                    Text(
                                      '방금',
                                      style: TextStyle(
                                        color: Color(0xFF939393),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 6,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 6),
                        Text(
                          '아니 리액트 store에 이거 어케하는데',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '잉 리액트 너무 어려워잉ㅠㅠㅠㅠㅠㅠ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF939393),
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.favorite_border),
                                SizedBox(width: 5),
                                Text('21'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.comment),
                                SizedBox(width: 5),
                                Text('5'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.remove_red_eye),
                                SizedBox(width: 5),
                                Text('78'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildRecruitmentTab() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 152,
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF939393),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '추천 공모전',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF939393),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DescriptionPage()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 21.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Junction Asia 2024 같이 나갈 사람',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.people_outline, color: Colors.grey),
                                          SizedBox(width: 6),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '모집인원',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 12,
                                                    height: 1,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 3',
                                                  style: TextStyle(
                                                    color: Colors.pinkAccent,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 12,
                                                    height: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _buildTag('개발'),
                                          _buildTag('디자인'),
                                          _buildTag('기획'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF939393),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DescriptionPage()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 21.0, horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Junction Asia 2024 같이 나갈 사람',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.people_outline, color: Colors.grey),
                                          SizedBox(width: 6),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '모집인원',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 12,
                                                    height: 1,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 3',
                                                  style: TextStyle(
                                                    color: Colors.pinkAccent,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 12,
                                                    height: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _buildTag('개발'),
                                          _buildTag('디자인'),
                                          _buildTag('기획'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildWritingTab() {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the Profile Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget buildProfileTab() {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the Profile Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}