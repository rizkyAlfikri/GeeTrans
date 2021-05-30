part of 'screen_page.dart';

class RegistrationPage extends StatefulWidget {
  static const id = 'RegistrationPage';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
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
                  'Create a Rider\'s Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontFamily: 'Alfi-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      // Fullname
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Fullname',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 10.0),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      // Email
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

                      // Phone Number
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(color: Colors.green, fontSize: 10.0),
                        ),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      // Password
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
                        height: 10.0,
                      ),

                      // Confirm Password
                      TextField(
                        controller: rePasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
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
                        title: 'REGISTER',
                        color: ResColors.colorGreen,
                        onTap: () {
                          _validateRegisterInput(context);
                        },
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginPage.id, (route) => false);
                        },
                        child: Text(
                          'Already have a RIDER account? Login',
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

  void _registerUser() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => ProgressDialog(status: 'Registering you...'));

    final AuthResponse? result = await AuthService.registerUser(
      emailController.text,
      passwordController.text,
      fullNameController.text,
      phoneController.text,
    ).then((_) {
      Navigator.pop(context);
    });

    if (result?.user != null) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(MainPage.id, (route) => false);
    } else {
      UtilWidget.showSnackbar(context, result?.errorMsg ?? "System is busy");
    }
  }

  void _validateRegisterInput(BuildContext context) async {
    if (await UtilWidget.isNoConnectivity()) {
      UtilWidget.showSnackbar(context, 'No internet connectivity');
      return;
    }

    if (fullNameController.text.trim().length < 3) {
      UtilWidget.showSnackbar(context, 'Please input valid full name');
      return;
    }

    if (!EmailValidator.validate(emailController.text.trim())) {
      UtilWidget.showSnackbar(context, 'Please input valid Email');
      return;
    }

    if (phoneController.text.trim().length < 10) {
      UtilWidget.showSnackbar(context, 'Minimum phone number is 10 digit');
      return;
    }

    if (passwordController.text.trim().length < 6) {
      UtilWidget.showSnackbar(context, 'Minimum password length is 6 digit');
      return;
    }

    if (passwordController.text != rePasswordController.text) {
      UtilWidget.showSnackbar(
          context, 'Password and Confirm Password are different');
      return;
    }

    _registerUser();
  }
}
