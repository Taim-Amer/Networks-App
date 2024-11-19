import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/common/widgets/text_fields/custom_text_field.dart';
import 'package:networks_app/features/authentication/controllers/signup_controller.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/validators/validation.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = SignupController.instance;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signup to Networks App".tr, style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: THelperFunctions.screenHeight(context) * 0.02),
            TRoundedContainer(
              padding: const EdgeInsets.all(20),
              width: THelperFunctions.screenWidth(context) * 0.3,
              child: Form(
                key: signupController.signInFormState,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      hintText: "Enter your Name".tr,
                      keyboardType: TextInputType.text,
                      validator: (value) => TValidator.validateEmptyText("Name", value),
                      controller: signupController.nameController,
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.02),
                    CustomTextField(
                      hintText: "Enter your Email".tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => TValidator.validateEmail(value),
                      controller: signupController.emailController,
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.02),
                    CustomTextField(
                      hintText: "Enter your password".tr,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) => TValidator.validatePassword(value),
                      controller: signupController.passwordController,
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.02),
                    CustomTextField(
                      hintText: "Enter your password confirmation".tr,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) => TValidator.validatePassword(value),
                      controller: signupController.passwordConfirmation,
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.04),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(onPressed: () => signupController.signup(), child: const Text("Signup")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
