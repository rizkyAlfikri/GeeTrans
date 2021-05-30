part of 'widgets.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;

  const PrimaryButton({
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Container(
        height: 50.0,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontFamily: 'Alfi-Bold',
            ),
          ),
        ),
      ),
    );
  }
}
