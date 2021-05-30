part of 'screen_page.dart';

class MainPage extends StatefulWidget {
  static const id = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            DatabaseReference dbref =
                FirebaseDatabase.instance.reference().child('Test');
            dbref.set('IsConnected').onError(
                (error, stackTrace) => debugPrint("$error | ${stackTrace}"));
          },
          child: Text('Test Connection'),
        ),
      ),
    );
  }
}
