import 'package:amezing/utility/my_style.dart';
import 'package:amezing/utility/signout_process.dart';
import 'package:amezing/widget/infomation_shop.dart';
import 'package:amezing/widget/list_food_menu_shop.dart';
import 'package:amezing/widget/order_list_shop.dart';
import 'package:flutter/material.dart';

class MainShop extends StatefulWidget {
  const MainShop({super.key});

  @override
  State<MainShop> createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  Widget currentWidget = const orderListShop();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Shop'),
        actions: <Widget>[
          IconButton(
              onPressed: () => signOutProcess(context),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHeadDrawer(),
          homeMenu(),
          foodMenu(),
          infoMenu(),
          signOutMenu(),
        ],
      ),
    );
  }

  ListTile homeMenu() => ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Order List'),
        subtitle: const Text('waiting order'),
        onTap: () {
          setState(() {
            currentWidget = const orderListShop();
          });
          Navigator.pop(context);
        },
      );
  ListTile foodMenu() => ListTile(
        leading: const Icon(Icons.food_bank),
        title: const Text('Menu'),
        subtitle: const Text('waiting order'),
        onTap: () {
          setState(() {
            currentWidget = const listFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );
  ListTile infoMenu() => ListTile(
        leading: const Icon(Icons.info),
        title: const Text('Infomation'),
        subtitle: const Text('waiting order'),
        onTap: () {
          setState(() {
            currentWidget = const infomationShop();
          });
          Navigator.pop(context);
        },
      );
  ListTile signOutMenu() => const ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign Out'),
        subtitle: Text('waiting order'),
      );
  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: Mystyle().myBoxDecoration('shop.jpg'),
      currentAccountPicture: Mystyle().showLogo(),
      accountName: const Text('Shop'),
      accountEmail: const Text('log in'),
    );
  }
}
