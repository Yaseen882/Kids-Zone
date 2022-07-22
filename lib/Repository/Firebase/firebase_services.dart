import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practise/Presentation/dash_board.dart';
import 'package:practise/Presentation/sign_in.dart';
import 'package:practise/constants.dart';

class FirebaseServices extends ChangeNotifier {
  Future<void> signInUser(
      {String email = '', password = '', BuildContext? context}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushNamed(context!, SignInPage.pageName);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'SignUp Successfully',
            style: TextStyle(color: Constants.textColor),
          ),
          backgroundColor: Constants.primaryColor,
        ));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
            'The password provided is too weak.',
            style: TextStyle(color: Constants.textColor),
          ),
          backgroundColor: Constants.primaryColor,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
            'The account already exists for that email.',
            style: TextStyle(color: Constants.textColor),
          ),
          backgroundColor: Constants.primaryColor,
        ));
      }
    }
    notifyListeners();
  }

  Future<void> userSignIn({required String email, password, BuildContext? context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.pushNamed(context!, Dashboard.pageName);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
            'Invalid email',
            style: TextStyle(color: Constants.textColor),
          ),
          backgroundColor: Constants.primaryColor,
        ));
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
            'User not found.',
            style: TextStyle(color: Constants.textColor),
          ),
          backgroundColor: Constants.primaryColor,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
          content: Text(
            'Wrong password.',
            style: TextStyle(color: Constants.textColor),
          ),
          backgroundColor: Constants.primaryColor,
        ));
      }
    }
    notifyListeners();
  }

}
