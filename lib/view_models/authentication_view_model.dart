import 'dart:async';

import 'package:components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:im/app/app.dart';
import 'package:im/bloc/network_bloc.dart';
import 'package:im/bloc/network_event.dart';
import 'package:im/modals/user_model.dart';

class AuthenticationViewModel{
  static late AuthenticationViewModel _instance;

  factory AuthenticationViewModel(App app) {
    _instance = AuthenticationViewModel._internal();
    return _instance;
  }

  AuthenticationViewModel._internal() {
    _init();
  }

  var categories = ["One","two","three","four","five","six","seven","eight","nine","ten"];

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  var verificationCode = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  late StreamController<String> buttonLoadingStream;

  User? user;

  void _init() {
    buttonLoadingStream = StreamController<String>();
  }

  bool validatePhoneNumber(BuildContext context){
    var number = phoneNumberController.text;
    if(number.isNotEmpty){
      if(number.length>=10){
        return true;
      }else{
        Utils.showSnackBar(context: context, message: "Phone number is invalid");
        return false;
      }
    }else {
      Utils.showSnackBar(context: context, message: "Phone number can't be empty");
      return false;
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    try{
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(_){
      Utils.showSnackBar(context: context, message: "Google login failed");
    }
    buttonLoadingStream.add("google_completed");
  }

  bool validateNameScreen(BuildContext context){
    var name = nameController.text;
    var category = categoryController.text;
    var business = businessNameController.text;
    if(name.isNotEmpty){
      if(business.isNotEmpty){
        if(category.isNotEmpty){
          return true;
        }else {
          Utils.showSnackBar(context: context, message: "Category can't be empty");
          return false;
        }
      }else {
        Utils.showSnackBar(context: context, message: "Business name can't be empty");
        return false;
      }
    }else {
      Utils.showSnackBar(context: context, message: "Name can't be empty");
      return false;
    }
  }

  createUser(NetworkBloc bloc){
    var user = ModelUser(
      phoneNumber: phoneNumberController.text,
      name: nameController.text,
      language: '',
      email: ''
    );
    bloc.add(AddUserEvent(user));
  }

}