import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hive/hive.dart';
import 'package:news_book/layout/home/home_page.dart';
import 'package:news_book/shared/styles/colors.dart';
import '../../shared/authentication_helper.dart';
import '../../shared/firebase_methos.dart';
import '../../shared/styles/themes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 100);

  Future<String?>? _authUser(LoginData data, BuildContext context) async {
    ResponseData res =
        await FirebaseMethos.fetchUserData(data.name, data.password);

    if (!res.status) {
      return res.result.toString();
    } else {
      bool isEmailVerified = await FirebaseMethos.checkEmailVerified(data: res);

      AuthenticationHelper.finishValidation(
          context: context,
          data: res,
          func: () async {
            if (!isEmailVerified) {
              AuthenticationHelper.finishVerification(context, isEmailVerified);
              return "Verify Your Email , Check your inbox";
            } else {
              Hive.box('AppSettings')
                  .put('uid', res.result.user.uid.toString());
              return null;
            }
          });
    }
    return null;
  }

  Future<String?>? _signupUser(SignupData data, BuildContext context) async {
    ResponseData res = await FirebaseMethos.userRegister(
      email: data.name.toString(),
      password: data.password.toString(),
      confiremPassword: data.password.toString(),
      phone: data.additionalSignupData!.values.first.toString(),
    );
    if (!res.status) {
      return res.result.toString();
    } else {
      AuthenticationHelper.finishValidation(
          context: context,
          data: data,
          func: () {
            res.result.user!.sendEmailVerification();
            AuthenticationHelper.finishVerification(context, false);
            return null;
          });
    }

    return null;
  }

  Future<String?> _recoverPassword(String name) async {
    if (name.toString().isNotEmpty) {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: name.toString());
      return null;
    } else {
      return "Fill Your Email";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kBasicColor,
        ),
        Positioned(
          bottom: 0.0,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/bakground.png')),
        ),
        Positioned(
          child: FlutterLogin(
            //logo: 'assets/images/logoo.png',
            onLogin: (LoginData data) => _authUser(data, context),
            onSignup: (SignupData data) => _signupUser(data, context),
            onSubmitAnimationCompleted: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            theme: loginTheme,
            onRecoverPassword: _recoverPassword,
            loginAfterSignUp: false,
            additionalSignupFields: [
              UserFormField(
                  keyName: "phone",
                  displayName: "Phone",
                  icon: const Icon(Icons.phone),
                  fieldValidator: (value) {
                    if (value!.isEmpty ||
                        !(value.startsWith("09") && value.length == 10)) {
                      return "Invalid Phone number";
                    }
                    return null;
                  })
            ],
            passwordValidator: (password) {
              // if (password!.length > 5) {
              //   return null;
              // } else {
              //   return "The Minimum password length is 5 Characters";
              // }
              return null;
            },
            userType: LoginUserType.email,
            messages: LoginMessages(
              userHint: 'Email',
              passwordHint: 'Password',
              confirmPasswordHint: 'Confirm',
              loginButton: 'LOG IN',
              signupButton: 'REGISTER',
              goBackButton: 'GO BACK',
              confirmPasswordError: 'Not match!',
              recoverPasswordDescription:
                  'we will send an email to reset your password.',
              recoverPasswordSuccess: 'Password rescued successfully',
            ),
          ),
        ),
      ],
    );
  }
}
