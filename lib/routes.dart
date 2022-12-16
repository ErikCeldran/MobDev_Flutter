import 'package:flutter/cupertino.dart';
import 'package:midterm_project/screens/Dashboard.dart';
import 'package:midterm_project/screens/LoginScreen.dart';
import 'package:midterm_project/screens/Settings.dart';
import 'package:midterm_project/screens/SignupScreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  Dashboard.routeName: (BuildContext context) => const Dashboard(),
  Settings.routeName: (BuildContext context) => const Settings(),
  SignupScreen.routeName: (BuildContext context) => const SignupScreen(),
};
