import 'package:flutter/material.dart';

class DescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF4F4F4),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: Container(
          color: Color(0xFFF4F4F4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xFF939393),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'JUNCTION AISA 2024',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 7),
              Text(
                '2024/7/9 ~ 2024/7/30',
                style: TextStyle(fontSize: 16, color: Color(0xFF7F7F7F), fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTag('개발'),
                  _buildTag('디자인'),
                  _buildTag('기획'),
                ],
              ),
              SizedBox(height: 13),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                  backgroundColor: Color(0xFF0044FF),
                ),
                child: Text(
                  '팀빌딩중 4팀',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TabBar(
                labelColor: Color(0xFF0044FF),
                unselectedLabelColor: Color(0xFF939393),
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Text(
                      '대회정보',
                      style: TextStyle(
                        fontWeight: FontWeight.w600, // Semi Bold
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'TIP',
                      style: TextStyle(
                        fontWeight: FontWeight.w600, // Semi Bold
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '수상작',
                      style: TextStyle(
                        fontWeight: FontWeight.w600, // Semi Bold
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('대회정보 내용')),
                    Center(child: Text('TIP 내용')),
                    Center(child: Text('역대 수상작 내용')),
                  ],
                ),
              ),
            ],
          ),
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
          fontSize: 14,
          fontWeight: FontWeight.w800,
          color: Color(0xFF0044FF),
        ),
      ),
    );
  }
}
