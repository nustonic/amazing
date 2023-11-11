import 'package:amezing/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class addInfoShop extends StatefulWidget {
  const addInfoShop({super.key});

  @override
  State<addInfoShop> createState() => _addInfoShopState();
}

class _addInfoShopState extends State<addInfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Infomation Shop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Mystyle().mySizebox(),
            nameForm(),
            Mystyle().mySizebox(),
            addressForm(),
            Mystyle().mySizebox(),
            phoneForm(),
            Mystyle().mySizebox(),
            groupImage(),
            Mystyle().mySizebox(),
            showMap(),
            Mystyle().mySizebox(),
            saveButton()
          ],
        ),
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.save),
        label: Text('Save Infomation'),
      ),
    );
  }

  Container showMap() {
    LatLng latLng = LatLng(17.981201, 102.631381);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );
    return Container(
      height: 300.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }

  Row groupImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_a_photo,
            size: 36.0,
          ),
        ),
        Container(
          width: 250.0,
          child: Image.asset('imgaes/mypic.jpg'),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_photo_alternate,
            size: 36.0,
          ),
        ),
      ],
    );
  }

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name Shop',
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'address',
                prefixIcon: Icon(Icons.holiday_village),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
}
