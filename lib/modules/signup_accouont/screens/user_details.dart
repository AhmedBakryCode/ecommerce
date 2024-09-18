import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/modules/create_account/widgets/cusom_text.dart';
import 'package:e_commerce/modules/create_account/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/defalt_textformfield.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController _usernamecontroller=TextEditingController();
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  TextEditingController _confirmcontroller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
              const  SizedBox(height: 20,),
                Align(alignment:Alignment.topLeft ,child: IconButton(onPressed: (){ Navigator.pop(context);}, icon:const Icon(Icons.arrow_back_ios))),
                const SizedBox(height: 10,),
                Align(alignment: Alignment.topLeft,child: CustomTextComponent(text: "Enter Your Details ", fontSize: 21, color: AppColors.black)),
               const SizedBox(height: 30,),
                CustomTextFormField(controller: _usernamecontroller, text: "", isPassword: false, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Username';
                  }
                  return null;
                }, backgroundColor: AppColors.white, hintText: 'Username',)
               ,const SizedBox(height: 5,),
                CustomTextFormField(controller: _emailcontroller, text: "", isPassword: false, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                }, backgroundColor: AppColors.white, hintText: 'Email Address',)
                ,const SizedBox(height: 5,),
                CustomTextFormField(controller: _passwordcontroller, text: "", isPassword: true, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                }, backgroundColor: AppColors.white, hintText: 'Password',)
                ,const SizedBox(height: 5,),
                CustomTextFormField(controller: _confirmcontroller, text: "", isPassword: true, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                }, backgroundColor: AppColors.white, hintText: 'Confirm Password',),
                const SizedBox(height: 30,),
                CustomButton(child: CustomTextComponent(text: 'Continue', fontSize: 18, color: AppColors.white,), buttonColor: AppColors.primary, onPressed: (){
                  if (_formKey.currentState!.validate()) {
Navigator.pop(context);
                  }

                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
