import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/buttons/custom_button.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/common/widgets/text_fields/custom_text_field.dart';
import 'package:networks_app/features/authentication/controllers/signin_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/validators/validation.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SigninController signinController = SigninController.instance;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign in to Networks App".tr,
                style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: THelperFunctions.screenHeight(context) * 0.02),
            TRoundedContainer(
              padding: const EdgeInsets.all(20),
              width: THelperFunctions.screenWidth(context) *
                  0.3, // Fixed width for the form

              child: Form(
                key: signinController.signInFormState,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To wrap the content
                  children: [
                    CustomTextField(
                      hintText: "Enter your Email".tr,
                      keyboardType: TextInputType.emailAddress,
                      validator: TValidator.validateEmail,
                      controller: signinController.emailController,
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.02),
                    CustomTextField(
                      hintText: "Enter your password".tr,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: TValidator.validatePassword,
                      controller: signinController.passwordController,
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.04),
                    Obx(
                      () => signinController.signinApiStatus.value ==
                              RequestState.loading
                          ? const CircularProgressIndicator(
                              color: TColors.primary,
                            )
                          : CustomButton(
                              backgroundColor: TColors.secondary,
                              onPressed: signinController.signin,
                              textPrimary: "Sign In".tr,
                              primaryTextStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to our app?'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed:
                              () {}, // Functionality for new account creation
                          child: Text(
                            'Create an account'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey),
                          ),
                        ),
                      ],
                    )
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
