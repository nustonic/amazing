import 'package:flutter/material.dart';

class Mystyle {
  Color darkcolor = Colors.blue;
  Color primarycolor = Colors.greenAccent;
  SizedBox mySizebox() => const SizedBox(
        height: 5.0,
        width: 8.0,
      );

  Text showTitle(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 24.0,
            color: Color.fromARGB(255, 204, 155, 6),
            fontWeight: FontWeight.bold),
      );

  Text showTitleH2(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 18.0,
            color: Color.fromARGB(255, 10, 84, 149),
            fontWeight: FontWeight.bold),
      );
  Widget titleCenter(BuildContext context, String string) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Text(
          string,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Container showLogo() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 120.0,
      child: Image.asset('images/logou.png'),
    );
  }

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/$namePic'), fit: BoxFit.cover),
    );
  }

  Mystyle();
}
