part of 'screen_page.dart';

class MainPage extends StatefulWidget {
  static const id = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Completer<GoogleMapController> _completer  = Completer();
  late GoogleMapController _mapController;

   static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: <Widget>[
          GoogleMap(initialCameraPosition: _kGooglePlex, 
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _completer.complete(controller);
            _mapController =  controller;
          },)
        ],
      )
    );
  }
}
