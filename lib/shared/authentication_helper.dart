import 'components/components.dart';

class AuthenticationHelper {
  static String returnVisibility(
      {String? email,
      String? password,
      String? phone,
      String? confiremPassword}) {
    if (email!.isEmpty) {
      return "Email can't be empty";
    }
    if (phone != null && phone.isEmpty) {
      return "Phone can't be empty";
    }
    if (password!.isEmpty) {
      return "Password can't be empty";
    }
    if (confiremPassword != null) {
      if (confiremPassword.isEmpty) {
        return "Re-enter Password filed can't be empty";
      }
      if (password != confiremPassword) {
        return "Passwords do not match";
      }

      if (!isPasswordCompliant(password)) {
        return "your password is not Compliant";
      }
    }

    return "";
  }

  static bool isPasswordCompliant(String? password, [int minLength = 6]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  static finishValidation(
      {required context, required data, required func}) async {
    if (data.status) {
      //excute func() if Login is Success
      func();
    } else {
      showErrorMsg(
        context: context,
        text: data.result,
      );
    }
  }

  static finishVerification(context, isEmailVerified) async {
    if (!isEmailVerified) {
      showWarningMsg(
        context: context,
        text: "Sign in to your email to verify your account. ",
      );
    }
  }
}
