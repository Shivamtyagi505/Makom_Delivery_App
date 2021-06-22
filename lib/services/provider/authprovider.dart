import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makom_delivery_app/services/auth/sign_up/shared_pref.dart';

class AuthProvider extends ChangeNotifier{
  String _uid;
  String _email;
  String get getUid =>_uid;
  String get getEmail => _email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> LoginUser(String email,String password) async{
    bool retval = false;
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Shared_pref().set_bool("auth", true);
      print("Successfully signed in UID: $_uid");
      if(userCredential.user != null)
      {
        _uid = userCredential.user.uid;
        _email = userCredential.user.email;
        return retval = true;
      }
    }catch(e)
    {
      print(e);
    }
    return retval;
  }
}