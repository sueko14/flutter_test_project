import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/screens/login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserState user = UserState();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserState>.value(
        value: user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),//TODO LoginCheck()にする
        )
    );
  }
}

class UserState extends ChangeNotifier{
  late User user;
  void setUser(User currentUser){
    user = currentUser;
    notifyListeners();
  }
}
