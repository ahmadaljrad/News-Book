import 'package:flutter/material.dart';
import 'package:news_book/shared/authentication_helper.dart';
import 'package:news_book/shared/firebase_methos.dart';
import 'package:news_book/shared/styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/components/components.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhiteColor,
      body: const SignupScreenContent(),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "My Company, Inc",
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}

class SignupScreenContent extends StatefulWidget {
  const SignupScreenContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupScreenContent();
}

class _SignupScreenContent extends State<SignupScreenContent> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Signup Text
            buildLogoText(text: "SignUp"),

            // Signup Info
            buildInputField(
              controller: emailController,
              hintText: "Email",
              prefixIcon: Icons.email,
            ),
            buildInputField(
              controller: phoneController,
              hintText: "Phone",
              prefixIcon: FontAwesomeIcons.phone,
            ),
            buildInputField(
                controller: passwordController1,
                hintText: "Password",
                onChangeObscure: () {
                  setState(() {
                    _isObscure1 = !_isObscure1;
                  });
                },
                isObscure: _isObscure1,
                prefixIcon: FontAwesomeIcons.key),
            buildInputField(
              controller: passwordController2, // Controller for Password
              hintText: "Re-enter Password",
              onChangeObscure: () {
                setState(() {
                  _isObscure2 = !_isObscure2;
                });
              },
              isObscure: _isObscure2,
              prefixIcon: FontAwesomeIcons.key,
            ),

            // Signup Submit button
            buildSubmitButton(
              isLoading: _isLoading,
              onPressed: () async {
                changeLoadingState(true);
                ResponseData data = await FirebaseMethos.userRegister(
                  email: emailController.text,
                  password: passwordController1.text,
                  confiremPassword: passwordController2.text,
                  phone: phoneController.text,
                );
                if (!data.status) {
                  changeLoadingState(false);
                  showErrorMsg(context: context, text: data.result);
                } else {
                  AuthenticationHelper.finishValidation(
                      context: context,
                      data: data,
                      func: () {
                        data.result.user!.sendEmailVerification();
                        AuthenticationHelper.finishVerification(context, false);
                        return navigatorpushWithFinish(
                          context: context,
                          nextPage: const LoginScreen(),
                        );
                      });
                }
              },
            ),
          ],
        ));
  }

  void changeLoadingState(bool isLoading) {
    return setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController1.dispose();
    passwordController2.dispose();
    phoneController.dispose();
  }
}
