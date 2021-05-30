part of 'screen_page.dart';

class LoginPage extends StatefulWidget {
  static const id = 'LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70.0,
                ),
                Hero(
                  tag: 'geetrans-logo',
                  child: Image(
                    alignment: Alignment.center,
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Sign in as a Rider',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontFamily: 'Alfi-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 10.0),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 10.0),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      PrimaryButton(
                        title: 'LOGIN',
                        color: ResColors.colorGreen,
                        onTap: () {
                          _validateLoginInput();
                        },
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RegistrationPage.id, (route) => false);
                        },
                        child: Text(
                          'Don\'t have an account, sign up here',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInWithEmail() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => ProgressDialog(status: 'Logging you in...'));

    final result = await AuthService.signInWithEmail(
      emailController.text,
      passwordController.text,
    );

    Navigator.pop(context);

    if (result.user != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(MainPage.id, (route) => false);
    } else {
      UtilWidget.showSnackbar(context, result.errorMsg ?? "System is busy");
    }
  }

  void _validateLoginInput() async {
    if (await UtilWidget.isNoConnectivity()) {
      UtilWidget.showSnackbar(context, 'No internet connectivity');
      return;
    }

    if (!EmailValidator.validate(emailController.text.trim())) {
      UtilWidget.showSnackbar(context, 'Please input valid Email');
      return;
    }

    if (passwordController.text.trim().length < 6) {
      UtilWidget.showSnackbar(context, 'Minimum password length is 6 digit');
      return;
    }

    _signInWithEmail();
  }
}
