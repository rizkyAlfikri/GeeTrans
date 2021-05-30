part of 'services.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _database = FirebaseDatabase.instance;

  static Future<AuthResponse> registerUser(
    String email,
    String password,
    String fullname,
    String phone,
  ) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      if (user != null) {
        print('Registration successfull');

        DatabaseReference dbRef =
            _database.reference().child('users/${user.uid}');

        Map<String, dynamic> map = {
          'fullname': fullname,
          'email': email,
          'phone': phone
        };

        dbRef.set(map);

        return AuthResponse(user, null);
      }

      return AuthResponse(null, 'System is busy');
    } on FirebaseAuthException catch (e) {
      return AuthResponse(null, e.message);
    }
  }

  static Future<AuthResponse> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = result.user;

      if (user != null) {
        var result =
            await _database.reference().child('users/${user.uid}').once();

        if (result.value != null) {
          return AuthResponse(user, null);
        }

        return AuthResponse(null, 'Account is\'t exist');
      } else {
        return AuthResponse(null, 'Incorrect email or password');
      }
    } on FirebaseAuthException catch (e) {
      return AuthResponse(null, 'Incorrect email or password');
    }
  }
}

class AuthResponse {
  const AuthResponse(this.user, this.errorMsg);
  final User? user;
  final String? errorMsg;
}
