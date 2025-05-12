import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          CircleAvatar(
            radius: 30,
            backgroundImage:NetworkImage(user?.photoURL??"") ,
          ),
          Text(user?.displayName??""),
          Text(user?.email??""),
          TextButton(onPressed: (){
            FirebaseAuth.instance.signOut();

          }, child: Text("Sign out"))
        ],
      ),
    );
  }
}
