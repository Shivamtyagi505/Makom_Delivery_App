import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

final ref = FirebaseFirestore.instance.collection("driver");

void signupWithEmail(
    {@required BuildContext context, @required Map userData}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userData["email"], password: userData["password"]);
    userData["id"] = userCredential.user.uid;
    print("User Created");
    DocumentReference snapshot = await ref.doc(userCredential.user.uid);
    await snapshot.set(userData);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Toast.show("The password provided is too weak", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Toast.show("The account already exists for that email", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
