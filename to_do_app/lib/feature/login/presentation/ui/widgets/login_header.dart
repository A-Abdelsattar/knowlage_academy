


import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
                SizedBox(height: 20,),

        Image.asset("assets/images/app_logo.png"),
        SizedBox(height: 72,),
                Text("Login",style: AppStyle.font24SimiBold,),
                Text("Login to your account",style: AppStyle.font14GreyRegular,),
                        SizedBox(height: 32,),

      ],),
    );
  }
}