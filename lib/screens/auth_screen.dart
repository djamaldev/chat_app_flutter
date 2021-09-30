import 'package:chatappv2/widgets/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitForm(String email, String password, String userName, bool isLogin,
      BuildContext ctx) async {
    UserCredential authResult;

    try {
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user.uid)
            .set({'username': userName, 'password': password});
      }
    } on FirebaseAuthException catch (error) {
      var errorMessage = error.toString();
      if(error.toString().contains('EMAIL_EXISTS')){
        errorMessage = 'This email is already in use!';
      }else if(error.toString().contains('INVALID_EMAIL')){
        errorMessage = 'This is not a valid email!';
      }else if(error.toString().contains('WEAK_PASSWORD')){
        errorMessage = 'This password is too weak!';
      }if(error.toString().contains('EMAIL__NOT_FOUND')){
        errorMessage = 'Could not find a user with that email!';
      }if(error.toString().contains('INVALID_PASSWORD')){
        errorMessage = 'invalid password!';
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.redAccent,
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitForm),
    );
  }
}
