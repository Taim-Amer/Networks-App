import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/text_fields/custom_text_field.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/validators/validation.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: THelperFunctions.screenWidth(context) *
              0.4, // Fixed width for the form
          decoration: BoxDecoration(
            color: Colors.grey[900], // Dark theme box color
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To wrap the content
            children: [
              CustomTextField(
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                hintText: "Enter your Email".tr,
                keyboardType: TextInputType.emailAddress,
                borderColor: Colors.green,
                validator: TValidator.validateEmail,


              ),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username or email address',
                  labelStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true, // For password hiding
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {}, // Functionality for logging in
                style: ElevatedButton.styleFrom(
                  // Button color
                  minimumSize: Size.fromHeight(50), // Button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text('Sign in'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {}, // Functionality for forgotten password
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to YourApp?',
                    style: TextStyle(color: Colors.white54),
                  ),
                  TextButton(
                    onPressed: () {}, // Functionality for new account creation
                    child: Text(
                      'Create an account',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
