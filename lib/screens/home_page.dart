import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/add_post/chat_page.dart';
import 'package:flutter_test_project/screens/my_profile/profile_page.dart';
import 'package:flutter_test_project/screens/timeline/timeline_page.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.user});

  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String title = "テスト";
  late List<Widget> _pageList;

  @override
  void initState() {
    super.initState();
    _pageList = [
      TimeLinePage(),
      ChatPage(widget.user),
      ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.close),
        //       onPressed: () async {
        //         // ログイン画面に遷移＋チャット画面を破棄
        //         await Navigator.of(context).pushReplacement(
        //           MaterialPageRoute(builder: (context) {
        //             return LoginPage();
        //           }),
        //         );
        //       },
        //     ),
        //   ],
        // ),
        body: _pageList[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "profile",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
