import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/authentication_helper.dart';
import 'package:flutter_app/shared/styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import '../../../layout/home/home_page.dart';
import '../../../shared/components/components.dart';
import '../../../shared/firebase_methos.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Login text Widget
              buildLogoText(text: "Login"),
              // Textfields for email and password fields
              buildInputField(
                controller: emailController, // Controller for Username
                hintText: "Email",
                prefixIcon: Icons.email,
              ),
              buildInputField(
                  onChangeObscure: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  hintText: "Password",
                  controller: passwordController, // Controller for Password
                  isObscure: _isObscure,
                  prefixIcon: FontAwesomeIcons.key),

              // Submit Button
              buildSubmitButton(
                isLoading: _isLoading,
                onPressed: () async {
                  changeLoadingState(true);
                  ResponseData data = await FirebaseMethos.fetchUserData(
                      emailController.text, passwordController.text);

                  if (!data.status) {
                    changeLoadingState(false);
                    showErrorMsg(context: context, text: data.result);
                  } else {
                    bool isEmailVerified =
                        await FirebaseMethos.checkEmailVerified(data: data);

                    AuthenticationHelper.finishValidation(
                        context: context,
                        data: data,
                        func: () async {
                          if (!isEmailVerified) {
                            changeLoadingState(false);
                            AuthenticationHelper.finishVerification(
                                context, isEmailVerified);
                          } else {
                            Hive.box('AppSettings')
                                .put('uid', data.result.user.uid.toString());
                            return navigatorpushWithFinish(
                              context: context,
                              nextPage: const HomePage(),
                            );
                          }
                          /*
                          else {
                            bool isLogin = await FirebaseMethos.userIsLogin(
                                uid: data.result.user!.uid);
                            if (!isLogin) {
                              Hive.box('AppSettings')
                                  .put('uid', data.result.user.uid.toString());
                              return navigatorpushWithFinish(
                                context: context,
                                nextPage: const HomePage(),
                              );
                            } else {
                              changeLoadingState(false);
                              showErrorMsg(
                                context: context,
                                text:
                                    "User is already logged in news App ,Reset your password to LogOut from All",
                              );
                            }
                          }*/
                        });
                  }
                },
              ),

              // Register
              buildRegisterButton(
                  onTap: () => {
                        navigatorpushWithoutFinish(
                          context: context,
                          nextPage: const SignupScreen(),
                        )
                      }),

              buildResetPasswordButton(onTap: () async {
                return {
                  if (emailController.text.toString().isNotEmpty)
                    {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text.toString()),
                      showWarningMsg(
                          context: context,
                          text:
                              "Sign in to your email to reset your password."),
                    }
                };
              }),
            ],
          )),
    );
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
    passwordController.dispose();
  }
}
