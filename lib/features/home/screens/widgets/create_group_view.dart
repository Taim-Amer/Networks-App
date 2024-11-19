import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:networks_app/common/widgets/buttons/custom_button.dart';
import 'package:networks_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:networks_app/common/widgets/text_fields/custom_text_field.dart';
import 'package:networks_app/features/home/controllers/home_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/validators/validation.dart';

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController.instance;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create your Group",
                style: Theme.of(context).textTheme.displaySmall),
            SizedBox(height: THelperFunctions.screenHeight(context) * 0.02),
            TRoundedContainer(
              padding: const EdgeInsets.all(20),
              width: THelperFunctions.screenWidth(context) *
                  0.3, // Fixed width for the form
              child: Form(
                key: homeController
                    .globalKey, // Ensure this key isn't reused elsewhere
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To wrap the content
                  children: [
                    CustomTextField(
                      hintText: "Enter your Group Name",
                      keyboardType: TextInputType.emailAddress,
                      validator: TValidator.validateEmail,
                      controller: homeController.createGroupController,
                    ),
                    SizedBox(
                        height: THelperFunctions.screenHeight(context) * 0.04),
                    Obx(
                      () => homeController.getCreateGroupApiStatis.value ==
                              RequestState.loading
                          ? const CircularProgressIndicator(
                              color: TColors.primary)
                          : CustomButton(
                              backgroundColor: TColors.secondary,
                              onPressed: homeController.createGroup,
                              textPrimary: "Create Group",
                              primaryTextStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                            ),
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
