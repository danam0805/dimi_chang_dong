import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'description_page.dart';
import 'writing_page.dart';
import 'profile_page.dart';


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
      home: MainPage(),
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F4F4),
        title: Row(
          children: [
            // Container for text input
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 0),
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
                          fontWeight: FontWeight.w500, // medium font weight
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Color(0xFF0044FF), // Set the color to #0044FF
                      size: 24, // Set the size to 24x24
                    ),
                  ],
                ),
              ),
            ),
            // Add an image icon with padding on the left
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image.asset(
                'img/bell.png',
                width: 33, // You can adjust the size as needed
                height: 34,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildHomeTab(), // Home Tab
          buildCommunityTab(), // Community Tab
          buildWritingTab(), // 빈 페이지 (Writing Page)
          buildProfileTab(), // 빈 페이지 (Profile Page)
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
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color(0xFF0044FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildWritingTab() {
    return Scaffold(
      body: Center(
        child: Text(
          'This is the Writing Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  // Profile Page UI implementation
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

  // Home Tab UI implementation
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
                                'Junction Asia 2024',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Column( // Text와 원들이 세로로 쌓이도록 변경
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [ // Text와 원 사이의 간격
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
                                                  text: '인원', // "인원" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.black, // 검은색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 4~6', // "4~6" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.pinkAccent, // 핑크색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _buildTag('개발'), // "개발" 태그
                                          _buildTag('디자인'), // "디자인" 태그
                                          _buildTag('기획'), // "기획" 태그
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
                                'Junction Asia 2024',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Column( // Text와 원들이 세로로 쌓이도록 변경
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [ // Text와 원 사이의 간격
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
                                                  text: '인원', // "인원" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.black, // 검은색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 4~6', // "4~6" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.pinkAccent, // 핑크색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _buildTag('개발'), // "개발" 태그
                                          _buildTag('디자인'), // "디자인" 태그
                                          _buildTag('기획'), // "기획" 태그
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

  Widget buildCommunityTab() {
    return DefaultTabController(
      length: 3, // 자유 커뮤니티, 지식 나눔, 인력 구인 3개 탭
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
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600), // semi bold
                ),
              ),
              Tab(
                child: Text(
                  '지식 나눔',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600), // semi bold
                ),
              ),
              Tab(
                child: Text(
                  '인력 구인',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600), // semi bold
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

  // 자유 커뮤니티 탭 내용
  Widget buildFreeCommunityTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Image placeholder
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

          // List of posts
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3, // Number of posts to show
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  color: Colors.white, // Card background color set to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0), // Setting border radius to 0
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
                                  mainAxisAlignment: MainAxisAlignment.center, // Center align
                                  children: [
                                    SizedBox(height: 2), // Adjust vertical alignment
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
                            fontWeight: FontWeight.w600, // semi bold
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '내일 축제 때 같이 다닐 사람 구해요..! 맛있는거 많이 사드릴게요!',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500, // semi bold
                            color: Color(0xFF939393),
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
  // 지식 나눔 탭 내용
  Widget buildKnowledgeSharingTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Image placeholder
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

          // List of posts
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3, // Number of posts to show
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  color: Colors.white, // Card background color set to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0), // Setting border radius to 0
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
                                  mainAxisAlignment: MainAxisAlignment.center, // Center align
                                  children: [
                                    SizedBox(height: 2), // Adjust vertical alignment
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
                            fontWeight: FontWeight.w600, // semi bold
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '잉 리액트 너무 어려워잉ㅠㅠㅠㅠㅠㅠ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500, // semi bold
                            color: Color(0xFF939393),
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

  // 인력 구인 탭 내용
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
                          MaterialPageRoute(builder: (context) => DescriptionPage()), // Navigate to description_page.dart
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
                                'Junction Asia 2024',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Column( // Text와 원들이 세로로 쌓이도록 변경
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [ // Text와 원 사이의 간격
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
                                                  text: '인원', // "인원" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.black, // 검은색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 4~6', // "4~6" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.pinkAccent, // 핑크색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _buildTag('개발'), // "개발" 태그
                                          _buildTag('디자인'), // "디자인" 태그
                                          _buildTag('기획'), // "기획" 태그
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
                          MaterialPageRoute(builder: (context) => DescriptionPage()), // Navigate to description_page.dart
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
                                'Junction Asia 2024',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '8/9 ~ 8/11',
                                style: TextStyle(
                                  color: Color(0xFF939393),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Column( // Text와 원들이 세로로 쌓이도록 변경
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [ // Text와 원 사이의 간격
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
                                                  text: '인원', // "인원" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.black, // 검은색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: ' 4~6', // "4~6" 텍스트
                                                  style: TextStyle(
                                                    color: Colors.pinkAccent, // 핑크색
                                                    fontWeight: FontWeight.w800, // ExtraBold
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          _buildTag('개발'), // "개발" 태그
                                          _buildTag('디자인'), // "디자인" 태그
                                          _buildTag('기획'), // "기획" 태그
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
}