import 'package:amezing/utility/my_style.dart';
import 'package:amezing/utility/signout_process.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  const MainUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String? nameUser;

  @override
  void initState() {
    findUser();
    super.initState();
  }

  Future<Null> findUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nameUser = prefs.getString('Name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameUser == null ? 'Main User' : '$nameUser login'),
        actions: <Widget>[
          IconButton(
            onPressed: () => signOutProcess(context), // Pass context here
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHeadDrawer(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: Mystyle().myBoxDecoration('user.png'),
      currentAccountPicture: Mystyle().showLogo(),
      accountName: const Text('User'),
      accountEmail: const Text('log in'),
    );
  }
}
