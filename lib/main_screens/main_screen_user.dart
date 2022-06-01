import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';




class mainScreenUser extends StatefulWidget {
  const mainScreenUser({Key? key}) : super(key: key);

  @override
  State<mainScreenUser> createState() => _mainScreenUserState();
}

class _mainScreenUserState extends State<mainScreenUser> {

 final Completer<GoogleMapController> _controllerGoogleMap = Completer();
 GoogleMapController? newGoogleMapcontroler;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller)
            {
              _controllerGoogleMap.complete(controller);
              newGoogleMapcontroler = controller;
            },
          ),
        ],
      ),
    );
  }
}
