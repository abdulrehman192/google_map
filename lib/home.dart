
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GoogleMapController mapController;
  //Okara map address
  static LatLng latLng = LatLng(30.8138, 73.4534);
  static LatLng _jinahpark = LatLng(30.8000342, 73.4293302);
  void _onCreatedMap(GoogleMapController controller)
  {
    setState(() {
      mapController = controller;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),

     body: Container(
          child: GoogleMap(
            markers: {okara,JinnahPark},
            mapType: MapType.normal,
            onMapCreated: _onCreatedMap,
            initialCameraPosition: CameraPosition(
              target: latLng,
              zoom: 12.0
            ),
          ),
     ),

      floatingActionButton: FloatingActionButton.extended(

        onPressed: _gotoHome,
        label: Text('Goto UCMT'),
        icon: Icon(Icons.place),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Marker okara = Marker(markerId: MarkerId('okara'),
  position: latLng,
    infoWindow: InfoWindow(title: 'Okara',snippet: 'A Beautiful City'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
  );

  Marker JinnahPark = Marker(markerId: MarkerId('JinnahPark'),
  position: _jinahpark,
    infoWindow: InfoWindow(
      title: 'Jinnah Park Okara',
      snippet: 'A beautiful park in the heart of okara city'
    )
  );



  static final CameraPosition _ucmt = CameraPosition(target: LatLng(30.828650817081517, 73.49449621071335),
      zoom: 15.0,
      bearing: 110.35,
      tilt: 35.0,
  );
  Future<void> _gotoHome() async
  {
    final GoogleMapController controller = await mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(_ucmt));
  }


}
