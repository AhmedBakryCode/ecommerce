import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/modules/create_account/widgets/cusom_text.dart';
import 'package:e_commerce/modules/create_account/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/defalt_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool? _ischicked= false;
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 80,
                ),
                SizedBox(height: 20),
                Text(
                  'Success',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Congratulations, you have completed your registration!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(), // Navigate to the same screen
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        const    SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomTextComponent(text: "Sign Up", fontSize: 25, color: AppColors.primarytxt),
            ),
          const  SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomTextComponent(text: "Enter your details below & free sign up", fontSize: 12, color: AppColors.seconadarytxt),
            )
           , const SizedBox(height: 30),
      Expanded(
        child: Container(
          decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10))),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                    CustomTextFormField(
                      controller: emailController,
                      text: 'Your Email',
                      isPassword: false,
                      validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
                      }, backgroundColor: AppColors.white, hintText: ' ',
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      backgroundColor: AppColors.white,
                      controller: passwordController,
                      text: 'Password',
                      isPassword: true,
                      validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
                      }, hintText: ' ',
                    ),
                    SizedBox(height: 30),

                    CustomButton(child: CustomTextComponent(text: 'Create Account', fontSize: 18,color: AppColors.white,), buttonColor: AppColors.primary, onPressed: (){
                      if (_formKey.currentState!.validate()&& _ischicked==true) {
              _showSuccessDialog(context);
                      }

                    }),
                  Row(
                    children: [
                      Checkbox(value: _ischicked, onChanged: (val){
                        setState(() {
                          _ischicked=val;
                        });
                      }),
                            RichText(
                              text: TextSpan(
                  text: "By creating an account you have to agree\n",
                  style: TextStyle(color: AppColors.seconadarytxt), // Regular text style
                  children: [


                    TextSpan(
                      text: "with our them & condication.",
                      style: TextStyle(color: AppColors.seconadarytxt), // Regular text style
                    ),

                    ],
                  ))
                              ],
                            )
              ]
                      ),
            ),
          ),
      )

      )],
        ),
      ),
    );
  }
}
