


import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_style.dart';
import 'package:to_do_app/core/widgets/custom_button.dart';
import 'package:to_do_app/core/widgets/custom_text_form_filed.dart';
import 'package:to_do_app/feature/login/presentation/ui/widgets/login_header.dart';
import 'package:to_do_app/feature/login/presentation/ui/widgets/social_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeader(),
              Text("Email",style:AppStyle.font16Meduim),
                      SizedBox(height: 12,),

              CustomTextFormField(
                hintText: "example@gmail.com",
              ),
              SizedBox(height: 16,),
              Text("Password",style:AppStyle.font16Meduim),
                      SizedBox(height: 12,),

              CustomTextFormField(
                hintText: "Password",
              ),
              SizedBox(height: 20,),
              SocialWidget(),
              SizedBox(height: 20,),
              CustomButton()
            ],
          ),
        ),
      ),
    );
  }
}