import 'package:e_commerce/core/constants/assets.dart';
import 'package:e_commerce/core/constants/colors.dart';
import 'package:e_commerce/modules/create_account/widgets/cusom_text.dart';
import 'package:e_commerce/modules/create_account/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CreateSuccess extends StatelessWidget {
  const CreateSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
      const Spacer(
        flex: 1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsImages.stars,
            height: 30,
            width: 30,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsImages.stars,
            height: 80,
            width: 80,
          ),
          Image.asset(
            AssetsImages.stars,
            height: 25,
            width: 25,
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      CustomTextComponent(
          text: "Account Created Successfully!",
          fontSize: 24,
          color: AppColors.primarytxt),
      CustomTextComponent(
          text:
              "  If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing.",
          fontSize: 12,
          color: AppColors.seconadarytxt),
      const SizedBox(height: 30,),
      CustomButton(child: CustomTextComponent(text: "Forget Password", fontSize: 17,color: AppColors.white,), buttonColor: AppColors.primary, onPressed: (){})
   ,Spacer(flex: 1,)

              ],
            ),
    );
  }
}
