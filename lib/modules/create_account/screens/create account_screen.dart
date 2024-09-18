import 'package:e_commerce/core/constants/assets.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/modules/create_account/widgets/custom_button.dart';
import 'package:e_commerce/modules/create_account/widgets/custom_form_field.dart';
import 'package:e_commerce/modules/create_account/widgets/termas_chickbox.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwodcontroller = TextEditingController();

  bool _isTermsChecked = false;

  void _submitForm() {
    if (_formKey.currentState!.validate() && _isTermsChecked) {
      // Proceed with the form submission
      print("Form is valid and terms are accepted");
    } else {
      if (!_isTermsChecked) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please accept the terms and conditions"))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(
                AssetsImages.logo,
                height: 90,
                width: 90,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'A handful of model sentence structures',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff767372),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _usernamecontroller,
                      prefixIcon: Icons.person,
                      hintText: "Username",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _emailcontroller,
                      prefixIcon: Icons.email,
                      hintText: "Email Id",
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomTextFormField(
                            controller: _passwodcontroller,
                            prefixIcon: Icons.visibility,
                            hintText: "Password",
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 55,
                          width: 65,
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.fingerprint),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isTermsChecked,
                          onChanged: (value) {
                            setState(() {
                              _isTermsChecked = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: TermsCheckbox(), // The text spans for terms and privacy policy
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white),
                      ),
                      buttonColor: const Color(0xff3787FF),
                      onPressed: _submitForm,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Color(0xff767372)),
                        ),
                        TextButton(
                          onPressed: () { Navigator.pushNamed(context, AppRoutes.signupMethods);},
                          child: const Text(
                            "Sign In",
                            style: TextStyle(color: Color(0xff3787FF)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
