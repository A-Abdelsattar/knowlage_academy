
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/feature/login/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepo? authRepo=AuthRepo();

  void signInWithGoogle()async{
    emit(AuthLoading());
    final response=await authRepo?.signInWithGoogle();
    debugPrint("response from repo$response");

    if(response is UserCredential){
      debugPrint(response.user?.uid);

      emit(AuthSuccess());
    }else{
      emit(AuthError(response.toString()));
    }

  }


  void signInWithFacebook()async{
    emit(AuthLoading());
    final response=await authRepo?.signInWithFacebook();
    debugPrint("response from repo$response");

    if(response is UserCredential){
      debugPrint(response.user?.uid);

      emit(AuthSuccess());
    }else{
      emit(AuthError(response.toString()));
    }

  }

}
