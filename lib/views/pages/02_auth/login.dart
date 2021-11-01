import 'package:flutter/material.dart';
import '../../../consts/app_images.dart';
import '../../../consts/app_sizes.dart';
import '../08_others/interest_selection.dart';
import '../../themes/text.dart';
import '../../widgets/app_button.dart';
import '../../widgets/google_sign_in_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.all(
            AppSizes.DEFAULT_PADDING,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /* <---- HeadLine ----> */
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Discover your \n favourite podcast',
                  style: AppText.h6.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              /* <---- Hero Image ----> */
              Expanded(
                child: Image.asset(
                  AppImages.LOGIN_HERO,
                  width: Get.width * 0.6,
                ),
              ),

              /* <---- Login ----> */
              Column(
                children: [
                  AppButton(
                    width: Get.width * 0.6,
                    label: 'Login With Email',
                    onTap: () {
                      Get.to(() => InterestSelectScreen());
                    },
                  ),
                  GoogleSignInButton(
                    width: Get.width * 0.6,
                    onTap: () {
                      Get.to(() => InterestSelectScreen());
                    },
                  ),
                  AppSizes.hGap30,
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
