import 'package:e_commerce/core/constants/assets.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/core/constants/routes.dart';
import 'package:e_commerce/modules/create_account/widgets/cusom_text.dart';
import 'package:e_commerce/modules/create_account/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupMethods extends StatelessWidget {
  const SignupMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             const SizedBox(height: 50,),
              CustomTextComponent(text: "Welcome!", fontSize: 24, color: AppColors.black),
              CustomTextComponent(text: "Sign up to continue!", fontSize: 24, color: AppColors.black,),
            const  SizedBox(height: 50,),
          CustomButton(buttonColor: AppColors.white, onPressed: (){}, child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(children: [
              IconButton(onPressed: (){}, icon:         Image.asset(AssetsImages.googleimg,height: 30,width: 30,)  , ),
              CustomTextComponent(text: " Sign Up with Google", fontSize: 15, color: AppColors.black),
            ],),
          ))
              ,const SizedBox(height: 20,)
           ,   CustomButton(buttonColor: AppColors.white, onPressed: (){}, child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: Row(children: [
                  IconButton(onPressed: (){}, icon: Image.asset(AssetsImages.facebookimg,height:30,width: 30,), // Google icon
                    iconSize: 40.0,
                  ),
                  CustomTextComponent(text: " Sign Up with Facebook", fontSize: 15, color: AppColors.black),
                ],),
           ))
              ,const SizedBox(height: 10,)
              ,Align(alignment: Alignment.center,child: Text("Or",style: TextStyle(fontSize: 18,color: AppColors.seconadarytxt),)),
const SizedBox(height: 15,),
              CustomButton(buttonColor: AppColors.white, onPressed: (){
                Navigator.pushNamed(context, AppRoutes.signup);
              }, child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CustomTextComponent(text: 'Sign up with email', fontSize: 18,color: AppColors.primarytxt,),
              ))
        , const SizedBox(height: 10,), RichText(
        text: TextSpan(
        text: "By signing up you are agreed with our \n",
          style: TextStyle(color: AppColors.seconadarytxt), // Regular text style
          children: [

        TextSpan(
          text: " friendly terms and condition.",
          style: TextStyle(color: AppColors.seconadarytxt), // Regular text style
        ),

            ],
        ),),
             const SizedBox(height: 40,),
              Align(alignment: Alignment.center,child: CustomTextComponent(text: "Already have An Account?", fontSize: 18, color: AppColors.black))
        , const SizedBox(height: 5,),
              CustomButton(buttonColor: AppColors.white, onPressed: (){
                Navigator.pushNamed(context, AppRoutes.userdetails);
              }, child:  Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CustomTextComponent(text: 'Sign in', fontSize: 18,color: AppColors.primary,),
              ))

            ]),
        ),
      ),
    );
  }
}
