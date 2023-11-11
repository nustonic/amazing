import 'package:amezing/screens/add_info_shop.dart';
import 'package:amezing/utility/my_style.dart';
import 'package:flutter/material.dart';

class infomationShop extends StatefulWidget {
  const infomationShop({super.key});

  @override
  State<infomationShop> createState() => _infomationShopState();
}

class _infomationShopState extends State<infomationShop> {
  void routeToaddInfoShop() {
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (context) => addInfoShop(),
    );
    Navigator.push(context, materialPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Mystyle().titleCenter(context, 'No infomation'),
        addAnEditButtom()
      ],
    );
  }

  Row addAnEditButtom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => routeToaddInfoShop(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
