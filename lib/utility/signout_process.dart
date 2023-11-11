import 'package:amezing/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> signOutProcess(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => Home(),
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
