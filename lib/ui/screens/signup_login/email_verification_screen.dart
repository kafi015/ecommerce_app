import 'package:ecommerce_shopanbd/ui/state_managers/user_auth_controller.dart';
import 'package:ecommerce_shopanbd/ui/utils/app_colors.dart';
import 'package:ecommerce_shopanbd/ui/utils/snakbar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/elevated_button.dart';
import '../../widgets/text_form_field.dart';
import '../../widgets/title_text.dart';
import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UserAuthController>(
          builder: (authController) => Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/App_Logo.jpg',
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TitleText(
                    text: "Welcome Back",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Please enter your email address',
                    style: TextStyle(
                      fontSize: 18,
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormFieldApp(
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    controller: _emailETController,
                    hintText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  authController.emailVarificationInProgress
                      ? const Center(
                          child: CircularProgressIndicator(color: primaryColor,),
                        )
                      : ElevatedButtonApp(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final bool response = await authController
                                  .emailVarification(_emailETController.text);
                              if (response) {
                                Get.to(OtpVerificationScreen(
                                  email: _emailETController.text,
                                ));
                              } else {
                                if (mounted) {
                                  showSnackBarMessage(context,
                                      "Email Varification Failed", Colors.red);
                                }
                              }
                            } else {
                              showSnackBarMessage(
                                  context,
                                  "Please enter valid email. Then press next.",
                                  Colors.red);
                            }
                          },
                          title: 'Next',
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
