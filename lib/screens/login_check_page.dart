import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/home_page.dart';
import 'package:flutter_test_project/screens/login_page.dart';
import 'package:provider/provider.dart';

import '../main.dart';


class LoginCheck extends StatefulWidget{
  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck>{
  @override
  void initState(){
    super.initState();
    checkUser();
  }
  //ログイン状態のチェック時はこの画面が表示される
  //チェック終了後にホーム or ログインページに遷移する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading..."),
        ),
      ),
    );
  }

  // 非同期でユーザーの状態を確認する
  void checkUser() async{
    final User? currentUser = FirebaseAuth.instance.currentUser;
    // TODO Unhandled Exception: setState() or markNeedsBuild() called during build.のエラー解除する
    final userState = Provider.of<UserState>(context,listen: false);
    if(currentUser == null){
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return LoginPage();
        }),
      );
    }else{
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return HomePage(user: currentUser);
        }),
      );
    }
  }
}
