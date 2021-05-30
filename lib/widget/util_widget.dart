part of 'widgets.dart';

class UtilWidget {
  static Future<bool> isNoConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.mobile &&
        result != ConnectivityResult.wifi;
  }

  static void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );

    ScaffoldMessenger.maybeOf(context)?.showSnackBar(snackBar);
  }
}
