import 'package:amritha_ayurveda/presentation/screen_home.dart';
import 'package:amritha_ayurveda/services/signin_service.dart';
import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _token = "";

  String get email => _email;

  String get password => _password;
  String get token => _token;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  loginpressed(BuildContext context) async {
    final signInInservice = SignInService();

    await signInInservice.login(this, context);
  }

  void setToken(String token, BuildContext context) {
    _token = token;
    notifyListeners();

    if (token.isNotEmpty) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => const ScreenHome(),
      ));
    }
  }

  resetControllers() {
    emailController.clear();
    passwordController.clear();
  }

  String title1 = 'Check all fields';
  String message1 = 'One or more fields are missing except referral code.';
  String title2 = 'Login Failed';
  String message2 = 'Incorrect Username or Password';
}
