import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/theme/app_style.dart';
import 'package:to_do_app/feature/login/presentation/manager/auth_cubit.dart';
import 'package:to_do_app/feature/new_screen.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is AuthLoading){
          showDialog(context: context, builder: (context)=>AlertDialog(
            backgroundColor: Colors.transparent,
            content: Center(child: CircularProgressIndicator()),
          ));
        }else if(state is AuthError){
          Navigator.pop(context);
          showDialog(context: context, builder: (context)=>AlertDialog(
            content: Text(state.errorMessage),
          ));
        }else if (state is AuthSuccess){
          Navigator.pop(context);

          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewScreen()));
        }
      },
      child: Column(
        children: [
          Center(child: Text("Or Login With", style: AppStyle.font16Meduim)),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
              onTap: (){
                context.read<AuthCubit>().signInWithFacebook();
              }
              ,child: Image.asset("assets/images/facebook_icon.png", width: 60)),
              SizedBox(width: 30),
              InkWell(
                  onTap: () {
                    context.read<AuthCubit>().signInWithGoogle();
                  }
                  ,
                  child: Image.asset(
                      "assets/images/gmail_icon.png", width: 60)),
            ],
          ),
        ],
      ),
    );
  }
}
