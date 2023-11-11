import 'package:amezing/utility/my_style.dart';
import 'package:amezing/utility/signout_process.dart';
import 'package:flutter/material.dart';

class MainRider extends StatefulWidget {
  const MainRider({super.key});

  @override
  State<MainRider> createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Rider'),
        actions: <Widget>[
          IconButton(
              onPressed: () => signOutProcess(context),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[showHeadDrawer(), homeMenu()],
      ),
    );
  }

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('Order List'),
        subtitle: Text('waiting order'),
      );
  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.food_bank),
        title: Text('Menu'),
        subtitle: Text('waiting order'),
      );
  ListTile infoMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('Infomation'),
        subtitle: Text('waiting order'),
      );
  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign Out'),
        subtitle: Text('waiting order'),
      );

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: Mystyle().myBoxDecoration('rider.png'),
      currentAccountPicture: Mystyle().showLogo(),
      accountName: Text('Rider'),
      accountEmail: Text('log in'),
    );
  }
}
