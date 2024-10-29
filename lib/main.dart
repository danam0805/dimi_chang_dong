import 'package:dimi_chang_dong/knowledgesharing_comment_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'description_page.dart';
import 'start_page.dart';
import 'freecommunity_comment_page.dart';

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

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late TabController _tabController;
  bool _showAppBar = true;
  bool _showBottomNavBar = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 2 || _tabController.index == 3) {
          _showAppBar = false;
          _showBottomNavBar = false;
        } else {
          _showAppBar = true;
          _showBottomNavBar = true;
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
      backgroundColor: Colors.white,
      appBar: _showAppBar
          ? AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
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
          : null,
      body: TabBarView(
        controller: _tabController,
        children: [
          buildHomeTab(),
          buildCommunityTab(),
          buildWritingTab(),
          buildProfileTab(),
        ],
      ),
      bottomNavigationBar: _showBottomNavBar
          ? Container(
        color: Colors.white,
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
      )
          : null,
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
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('img/Banner1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('img/Banner1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('img/Banner1.png'),
                                fit: BoxFit.cover,
                              ),
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1, 1),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('img/Banner2.png'),
                          fit: BoxFit.cover,
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
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(),
                          ),
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1, 1),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('img/Banner2.png'),
                          fit: BoxFit.cover,
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
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(),
                          ),
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
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
                borderRadius: BorderRadius.circular(24.0),
                image: DecorationImage(
                  image: AssetImage('img/Banner3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FreeCommunityCommentPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(1, 1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 15,
                                child: Icon(
                                  Icons.person,
                                  size: 15,
                                  color: Colors.grey[700],
                                ),
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
                              ),
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
                  )
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
                borderRadius: BorderRadius.circular(24.0),
                image: DecorationImage(
                  image: AssetImage('img/Banner3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KnowledgesharingCommentPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(1, 1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 15,
                                child: Icon(
                                  Icons.person,
                                  size: 15,
                                  color: Colors.grey[700],
                                ),
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
                              ),
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
                  )
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
                              borderRadius: BorderRadius.circular(24.0),
                              image: DecorationImage(
                                image: AssetImage('img/Banner3.png'), // 배경 이미지 설정
                                fit: BoxFit.cover, // 이미지가 컨테이너에 맞게 조정됩니다
                              ),
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1, 1), // x1, y1 방향으로 그림자 설정
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('img/Banner2.png'), // 배경 이미지 설정
                          fit: BoxFit.cover, // 이미지가 컨테이너에 맞게 조정됩니다
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
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(),
                          ),
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
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
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(1, 1), // x1, y1 방향으로 그림자 설정
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('img/Banner2.png'), // 배경 이미지 설정
                          fit: BoxFit.cover, // 이미지가 컨테이너에 맞게 조정됩니다
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
                          MaterialPageRoute(
                            builder: (context) => DescriptionPage(),
                          ),
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
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

  bool _isDropdownOpen = false;
  String _selectedCategory = '자유 커뮤니티';

  Widget buildWritingTab() {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 변경
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white, // 앱바 배경색을 흰색으로 변경
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _tabController.index = 0;
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                ),
                child: Text(
                  '취소',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                onPressed: () {
                  // Add your post action here
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF0044FF),
                  padding:
                  EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                ),
                child: Text(
                  '게시하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  _isDropdownOpen = !_isDropdownOpen;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _selectedCategory,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                  Spacer(),
                  Transform.rotate(
                    angle: _isDropdownOpen ? 3.14159 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            if (_isDropdownOpen) ...[
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategory = '자유 커뮤니티';
                          _isDropdownOpen = false;
                        });
                      },
                      child: Text(
                        '자유 커뮤니티',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategory = '지식나눔';
                          _isDropdownOpen = false;
                        });
                      },
                      child: Text(
                        '지식나눔',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategory = '인력구인';
                          _isDropdownOpen = false;
                        });
                      },
                      child: Text(
                        '인력구인',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 27),
            if (_selectedCategory == '자유 커뮤니티') ...[
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: '질문 남기기',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF939393),
                    height: 1,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ] else if (_selectedCategory == '지식나눔') ...[
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 25,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: '질문 남기기',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF939393),
                    height: 1,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ] else if (_selectedCategory == '인력구인') ...[
              SizedBox(height: 16), // 여백 조정
              Column(
                children: [
                  Stack(
                    children: [
                      Stack(
                        clipBehavior: Clip.none, // Allows the icon to go outside the boundaries of the stack
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Positioned(
                            bottom: -12.0, // Moves the icon outside the container
                            right: 5.0,  // Moves the icon outside the container on the right
                            child: CircleAvatar(
                              radius: 18.5,
                              backgroundColor: Color(0xFF4A4A4A),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 31),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '제목',
                      hintText: '제목을 입력해주세요',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: '설명',
                      hintText: '세부적인 설명을 입력해주세요',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '모집 인원',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFCDCDCD),
                        width: 1.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 10,
                        children: [
                          Row(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, // 볼드체 적용
                                  fontSize: 16, // 폰트 크기 16 적용
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '제목',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, top: 13.0, bottom: 13.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Color(0xFFCDCDCD),
                        width: 1.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 10,
                            children: [
                              Chip(
                                label: Text('백엔드'),
                                backgroundColor: Color(0xFF007BFF),
                                labelStyle: TextStyle(color: Colors.white),
                                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                              Chip(
                                label: Text('프론트엔드'),
                                backgroundColor: Color(0xFF007BFF),
                                labelStyle: TextStyle(color: Colors.white),
                                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ],
                          ),
                          Spacer(), // 오른쪽 끝으로 밀어주는 Spacer 추가
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: _selectedCategory == '인력구인' ? null : _buildBottomNavigationBar(),
    );
  }
  Widget _buildBottomNavigationBar() {
    if (_selectedCategory == '자유 커뮤니티') {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'img/image.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 36),
              Image.asset(
                'img/mic.png',
                width: 18,
                height: 24,
              ),
              SizedBox(width: 36),
              Image.asset(
                'img/clip.png',
                width: 30,
                height: 15,
              ),
            ],
          ),
        ),
      );
    } else if (_selectedCategory == '지식나눔') {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'img/image.png',
                width: 24,
                height: 24,
              ),
              SizedBox(width: 36),
              Image.asset(
                'img/mic.png',
                width: 18,
                height: 24,
              ),
              SizedBox(width: 36),
              Image.asset(
                'img/clip.png',
                width: 30,
                height: 15,
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget buildProfileTab() {
    return Scaffold(
      backgroundColor: Colors.white, // Scaffold 배경 색상 흰색으로 변경
      appBar: AppBar(
        backgroundColor: Colors.white, // 앱바 색상 흰색으로 변경
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          // "취소" 텍스트 대신 화살표 아이콘
          onPressed: () {
            setState(() {
              _tabController.index = 0; // 홈 탭으로 전환 또는 네비게이션 처리
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // 바디 색상 흰색으로 변경
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey[300], // Light gray background for default avatar
                      child: Icon(
                        Icons.person,
                        size: 65, // Size adjusted to fit within the avatar radius
                        color: Colors.grey[700], // Darker gray for the icon
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 18.5, // Set diameter to 37
                        backgroundColor: Color(0xFF4A4A4A),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Text(
                '닉네임',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  height: 1,
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCDCDCD)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '이찬혁', // 기존의 hintText 역할을 하는 텍스트
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                '학교 선택',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  height: 1,
                ),
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFCDCDCD)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  '디미대학교 23학번 해킹방어학과', // 기존의 hintText 역할을 하는 텍스트
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '학교 인증하기',
                    style: TextStyle(
                      color: Color(0xFF939393),
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                      height: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                '역할 소개',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  height: 1,
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 27.5, vertical: 6.0),
                // 패딩 조정
                decoration: BoxDecoration(
                  color: Color(0xFF61A0FF).withOpacity(0.5), // 배경색 설정
                  borderRadius: BorderRadius.circular(8.0), // 둥근 모서리
                ),
                child: Text(
                  'Developer',
                  style: TextStyle(
                    color: Colors.white, // 텍스트 색상
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                '자기 소개',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  height: 1,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 13.0),
                  // 패딩 설정
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDCD), // 테두리 색상 설정
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDCD), // 기본 테두리 색상
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDCD), // 포커스된 상태의 테두리 색상
                    ),
                  ),
                  hintText: '간단한 자기소개, 나의 포지션, 유용한 경험,\n'
                      '내가 잘 하는 것 등 나를 잘 표현할 수 있는 것들을\n'
                      '써주세요!',
                  hintStyle: TextStyle(
                    color: Color(0xFF939393), // hint text 색상 설정
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                '키워드',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  height: 1,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: '내가 최우선으로 생각하는 가치',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: '키워드에 맞는 단어나 문장을 작성해주세요!',
                  hintStyle: TextStyle(
                    color: Color(0xFF939393),
                    fontSize: 14,
                  ),
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black,
                    size: 24.0, // Width of the icon
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDCD), // 테두리 색상 CDCDCD로 설정
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDCD), // 사용자가 입력하지 않은 기본 테두리 색상
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color(0xFFCDCDCD), // 사용자가 클릭했을 때 테두리 색상
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
