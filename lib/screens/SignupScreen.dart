import 'package:flutter/material.dart';
// import 'package:midterm_project/screens/Dashboard.dart';
import 'package:midterm_project/screens/LoginScreen.dart';
import 'package:midterm_project/widget/PrimaryButton.dart';
import '../services/AuthService.dart';
import '../widget/CustomTextField.dart';
import '../widget/PasswordField.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = "/signup";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthService _authService = AuthService();
  String validation_msg = '';
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool validation = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: const AssetImage("assets/signup_scrn.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Email Address",
                        hintText: "Enter Email Address",
                        controller: emailController,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        labelText: "Password",
                        hintText: "Enter Password",
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        controller: passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        labelText: "Confirm Password",
                        hintText: "Enter Password",
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        controller: confirmpasswordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Signup",
                      iconData: Icons.app_registration,
                      onPress: () {
                        validation = validate(
                            emailController.text,
                            passwordController.text,
                            confirmpasswordController.text);
                        if (validation == true) {
                          signUp();
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        }
                      },
                    ),
                    Container(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: const Text(
                            "Already have an account? Log in here.",
                            style: TextStyle(
                                color: Colors.white,
                                height: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
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

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  bool validate(String email, String pass, String confirmpass) {
    bool retval = true;
    if (email == '' || pass == '' || confirmpass == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: SizedBox(
              height: 45.0,
              child: Center(child: Text('Please fill in all input fields')))));
      retval = false;
    } else {
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email) !=
          true) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: SizedBox(
                height: 45.0,
                child: Center(child: Text('Email Address is Invalid')))));
        retval = false;
      }
      if (pass != confirmpass) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: SizedBox(
                height: 45.0,
                child: Center(child: Text('Password does not Match')))));
        retval = false;
      }
    }
    return retval;
  }

  signUp() async {
    try {
      var user = await _authService.signUpWithEmailPass(
          emailController.text, passwordController.text);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } catch (e) {
      null;
    }
  }
}
