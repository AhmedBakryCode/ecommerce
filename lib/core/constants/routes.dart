

import 'package:e_commerce/modules/create_account/screens/create%20account_screen.dart';
import 'package:e_commerce/modules/create_account/screens/create_sucess.dart';
import 'package:e_commerce/modules/search_page/screens/sreach_page.dart';
import 'package:e_commerce/modules/signup_accouont/screens/sign_up_page.dart';
import 'package:e_commerce/modules/signup_accouont/screens/signup_methods.dart';
import 'package:e_commerce/modules/signup_accouont/screens/user_details.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String createAccount = '/create-account';
  static const String signupMethods = '/sign-Up-Methods';
  static const String accountSuccess = '/account-success';
  static const String signup= '/sign-up';
  static const String userdetails ='/user-details';
  static const String search='/search';

  // Add more routes as needed
  static Map<String, WidgetBuilder> routes = {
    createAccount: (context) => CreateAccount(),
    accountSuccess: (context)=> CreateSuccess(),
    userdetails: (context)=> UserDetails(),
    signupMethods: (context) => SignupMethods(),
    signup: (context) => SignUpScreen(),
    search: (context)=> BottomNavBarPage(),

  };
}
