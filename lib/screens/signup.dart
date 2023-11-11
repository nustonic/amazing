import 'package:amezing/utility/my_style.dart';
import 'package:amezing/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          Mystyle().mySizebox(),
          Mystyle().showTitle('Amazing Food'),
          Mystyle().mySizebox(),
          nameForm(),
          Mystyle().mySizebox(),
          userForm(),
          Mystyle().mySizebox(),
          passForm(),
          Mystyle().mySizebox(),
          Mystyle().mySizebox(),
          Mystyle().showTitleH2('Role as:'),
          userRadio('User', 'User'),
          userRadio('Shop', 'Merchant'),
          userRadio('Rider', 'Rider Delivery'),
          registerButton(),
        ],
      ),
    );
  }

  Widget userRadio(String value, String title) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: value,
                  groupValue: chooseType,
                  onChanged: (val) {
                    setState(() {
                      chooseType = val as String?;
                    });
                  },
                ),
                Text(
                  title,
                  style: TextStyle(color: Mystyle().darkcolor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget registerButton() => Container(
        width: 100.0,
        child: ElevatedButton(
          onPressed: () {
            if (name == null ||
                user == null ||
                password == null ||
                chooseType == null) {
              normalDialog(
                  context, 'Please fill in all details and select a role.');
            } else {
              checkUser();
            }
          },
          child: const Text('Register'),
        ),
      );

  Widget nameForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.face, color: Mystyle().darkcolor),
            labelStyle: TextStyle(color: Mystyle().darkcolor),
            labelText: 'Fullname: ',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().primarycolor),
            ),
          ),
        ),
      );

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_box, color: Mystyle().darkcolor),
            labelStyle: TextStyle(color: Mystyle().darkcolor),
            labelText: 'User: ',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().primarycolor),
            ),
          ),
        ),
      );

  Widget passForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_person, color: Mystyle().darkcolor),
            labelStyle: TextStyle(color: Mystyle().darkcolor),
            labelText: 'Password: ',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().darkcolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyle().primarycolor),
            ),
          ),
        ),
      );

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Mystyle().showLogo(),
        ],
      );

  Future<void> checkUser() async {
    String url =
        'http://localhost/amazing/getUserWhereUser.php?isAdd=true&User=$user';
    try {
      Response response = await Dio().get(url);
      print('res=$response');
      if (response.data == 'null') {
        registerUser();
      } else {
        normalDialog(context, 'This User $user already exists');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> registerUser() async {
    String url =
        'http://localhost/amazing/insertdata.php?isAdd=true&Name=$name&User=$user&Password=$password&ChooseType=$chooseType';
    try {
      Response response = await Dio().get(url);
      print('res=$response');
      if (response.data == 'true') {
        Navigator.pop(context);
      } else {
        normalDialog(context, 'Unable to register');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
