import 'package:amezing/screens/signin.dart';
import 'package:amezing/screens/signup.dart';
import 'package:amezing/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Placeholder data for the daily news update image and news link
  String newsImage = 'https://unsplash.com/photos/';
  String newsLink = 'https://sengrompholao.wixsite.com/sengrompho';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: showDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Navigate to read the full news article
                launchNewsLink();
              },
              child: Mystyle().showLogo(),
            ),
            const SizedBox(height: 20),
            Mystyle().showTitle('SENGROMPHO'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  Drawer showDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHeadDrawer(),
          signInMenu(),
          signUpMenu(),
        ],
      ),
    );
  }

  ListTile signInMenu() {
    return ListTile(
      leading: const Icon(Icons.login),
      title: const Text('Sign in'),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignIn()));
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: const Icon(Icons.person_add),
      title: const Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignUp()));
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: Mystyle().myBoxDecoration('guest.jpg'),
      currentAccountPicture: Mystyle().showLogo(),
      accountName: Text('Guest'),
      accountEmail: Text('Please log in'),
    );
  }

  void launchNewsLink() async {
    if (await canLaunch(newsLink)) {
      await launch(newsLink);
    } else {
      throw 'Could not launch $newsLink';
    }
  }
}
