import 'package:app_airbnb/app/core/theme/app_theme.dart';
import 'package:app_airbnb/app/modules/signup/signup_controller.dart';
import 'package:app_airbnb/app/modules/signup/widgets/content.dart';
import 'package:app_airbnb/app/modules/signup/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (_) => Scaffold(
        backgroundColor: AppTheme.cyan,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Header(),
              Content(),
            ],
          ),
        ),
      ),
    );
  }
}
