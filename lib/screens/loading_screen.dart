import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    LocationPermission permission;
    print(permission);
    if(permission == null) {
      permission = await Geolocator.requestPermission();
    }

    //print(permission);
    //LocationPermission permission1 = await Geolocator.checkPermission();
    //print(permission1);
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever){
      LocationPermission permission = await Geolocator.requestPermission();
    }
    if(permission == LocationPermission.whileInUse || permission == LocationPermission.always || permission == null){
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
