import 'package:flutter/material.dart';
import 'package:paypath_last/config/routes/custom_push_navigators.dart';
import 'package:paypath_last/core/utils/assets.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/auth_provider.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/auth/screens/forgort_password_screen.dart';
import 'package:paypath_last/features/auth/screens/signup_screen.dart';
import 'package:paypath_last/features/auth/screens/signup_verification_screen.dart';
import 'package:paypath_last/features/auth/services/auth_service.dart';
import 'package:paypath_last/widgets/custom_app_bar.dart';
import 'package:paypath_last/widgets/custom_button.dart';
import 'package:paypath_last/widgets/custom_textfield.dart';
import 'package:paypath_last/widgets/height_space.dart';
import 'package:paypath_last/widgets/main_app.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  bool obscureText = true;
  final loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void loginUser() {
    if (loginFormKey.currentState!.validate()) {
      authService.loginInUser(
        context: context,
        username: usernameController.text,
        password: passwordController.text,
        onLoginSuccess: () {
          final userProvider =
              Provider.of<UserProvider>(context, listen: false).user;
          final authProvider =
              Provider.of<AuthProvider>(context, listen: false);
          userProvider.isVerified == true
              ? Navigator.pushNamedAndRemoveUntil(
                  context, MainApp.route, (route) => false,
                  arguments: 0)
              : authService.sendOtp(
                  context: context,
                  email: userProvider.email,
                  sendPurpose: 'sign-up-verification',
                  onTapDialogButton: () => namedNavRemoveUntil(
                    context,
                    SignUpVerificationScreen.route,
                  ),
                );
          authProvider.setUserEmail(userProvider.email);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: appGradient
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //appBar: const CustomAppBar(image: mainLogo),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(mainLogo),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.040),
                    const  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Login and start transferring",
                          style: TextStyle(
                           // color: Color(0xFF848884),
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                           // height: MediaQuery.of(context).size.height * 0.0015,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.016),

                    formUI(),

                    const SizedBox(height: 50,),
                    CustomButton(
                      buttonText: "Login",
                      buttonColor: primaryAppColor,
                      buttonTextColor: scaffoldBackgroundColor,
                      onTap: () {
                        loginUser();
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.route);
                      },
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightValue17),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formUI() {
    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          CustomTextField(
            labelText: "Username",
            hintText: "Enter your unique username",
            prefixIcon: const Icon(Icons.alternate_email, color: Color(0xFFC0C0C0),),
            willContainPrefix: true,
            controller: usernameController,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.0009),
          CustomTextField(
            obscureText: obscureText,
            labelText: "Password",
            hintText: "Enter your password",
            controller: passwordController,
            icon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          TextButton(
            onPressed: () => namedNav(context, ForgortPasswordScreen.route),
            child: Text(
              "Forgort Password?",
              style: TextStyle(fontSize: heightValue17),
            ),
          )
        ],
      ),
    );
  }
}
