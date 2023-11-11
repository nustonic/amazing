import 'dart:convert';

import 'package:amezing/model/user_model.dart';
import 'package:amezing/screens/main_rider.dart';
import 'package:amezing/screens/main_shop.dart';
import 'package:amezing/screens/main_user.dart';
import 'package:amezing/utility/my_style.dart';
import 'package:amezing/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.brown,
            ],
            center: Alignment(0, -0.3),
            radius: 1.0,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Mystyle().showLogo(),
                Mystyle().mySizebox(),
                Mystyle().showTitle('Amazing Food'),
                Mystyle().mySizebox(),
                userForm(),
                Mystyle().mySizebox(),
                passwordForm(),
                Mystyle().mySizebox(),
                loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Container(
        width: 100.0,
        child: ElevatedButton(
          onPressed: () {
            if (user!.isEmpty || password!.isEmpty) {
              normalDialog(context, 'Please enter your credentials');
            } else {
              checkAuthen();
            }
          },
          child: const Text('Log In'),
        ),
      );

  Future<void> checkAuthen() async {
    String url =
        'http://localhost/amazing/getUserWhereUser.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('res=$response');
      var result = json.decode(response.data);
      print('result=$result');

      if (result != null && result is List && result.isNotEmpty) {
        // Assuming the API returns a list of users, even if it's a single user.
        var map = result.first;
        UserModel userModel = UserModel.fromJson(map);

        if (password == userModel.password) {
          routeToService(userModel);
        } else {
          normalDialog(context, 'Incorrect password');
        }
      } else {
        normalDialog(context, 'User not found');
      }
    } catch (e) {
      print('Error: $e');
      normalDialog(context, 'Error occurred. Please try again.');
    }
  }

  Future<void> routeToService(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('id', userModel.id ?? '');
    // prefs.setString('chooseType', userModel.chooseType ?? '');
    // prefs.setString('Name', userModel.name ?? '');
    prefs.setString('id', userModel.id ?? '');
    prefs.setString('chooseType', userModel.chooseType ?? '');
    prefs.setString('Name', userModel.name ?? '');
    Widget myWidget;
    switch (userModel.chooseType) {
      case 'User':
        myWidget = MainUser();
        break;
      case 'Shop':
        myWidget = MainShop();
        break;
      case 'Rider':
        myWidget = MainRider();
        break;
      default:
        normalDialog(context, 'Invalid user type');
        return;
    }

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: Mystyle().darkcolor),
            labelStyle: TextStyle(color: Mystyle().darkcolor),
            labelText: 'User: ',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Mystyle().darkcolor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Mystyle().primarycolor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: Mystyle().darkcolor),
            labelStyle: TextStyle(color: Mystyle().darkcolor),
            labelText: 'Password: ',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Mystyle().darkcolor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Mystyle().primarycolor)),
          ),
        ),
      );
}
