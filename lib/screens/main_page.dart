part of 'screen_page.dart';

class MainPage extends StatefulWidget {
  static const id = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Completer<GoogleMapController> _completer = Completer();
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
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _completer.complete(controller);
            _mapController = controller;
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(15.0),
                  topEnd: Radius.circular(15.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15.0,
                      spreadRadius: 0.5,
                      offset: Offset(
                        0.7,
                        0.7,
                      )),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Text(
                    'Nice to see you!',
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Where are you going?',
                    style: TextStyle(fontSize: 18, fontFamily: 'Alfi-Bold'),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.7, 0.7),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(width: 10.0),
                          Text('Search Destination')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 22.0),
                  Row(children: <Widget>[
                    Icon(Icons.home, color: ResColors.colorDimText),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Add Home'),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          'Your residential address',
                          style: TextStyle(
                              fontSize: 11.0, color: ResColors.colorDimText),
                        )
                      ],
                    )
                  ]),
                  SizedBox(height: 10.0),
                  DividerWidget(),
                  SizedBox(height: 10.0),
                  Row(children: <Widget>[
                    Icon(Icons.work, color: ResColors.colorDimText),
                    SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Add Work'),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          'Your office address',
                          style: TextStyle(
                              fontSize: 11.0, color: ResColors.colorDimText),
                        )
                      ],
                    )
                  ])
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
