


import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_style.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Or Login With",style: AppStyle.font16Meduim,)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/facebook_icon.png",width: 60,),
                  SizedBox(width: 30,),
                              Image.asset("assets/images/gmail_icon.png",width: 60,),

                ],
              )
              
           
      ],
    );
  }
}