import 'package:flutter/material.dart';

class KnowledgesharingCommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 54,bottom: 6),
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 26,
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '이찬혁',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 3),
                          Text(
                            '방금',
                            style: TextStyle(
                              color: Color(0xFF939393),
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        '아니 리액트 store에 이거 어케하는데',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '리액트 너무 어려워요ㅠㅠ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF939393),
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 16),
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
            ),
            Column(
              children: List.generate(6, (index) => buildCommentContainer()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 26,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '댓글 작성하기',
                    hintStyle: TextStyle(
                      color: Color(0xFF939393),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Image.asset(
                  'img/send.png',
                  width: 41,
                  height: 41,
                ),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCommentContainer() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF939393), width: 1),
          left: BorderSide(color: Color(0xFF939393), width: 1),
          right: BorderSide(color: Color(0xFF939393), width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 17.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 26,
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '김가은',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  '방금',
                  style: TextStyle(
                    color: Color(0xFF939393),
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            SizedBox(height: 13),
            Text(
              '그거 reducer에 스토어 대신 state 지정하면 됩니다',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
