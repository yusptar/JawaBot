import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void AlertWrongInput(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    borderSide: const BorderSide(
      color: Colors.white,
      width: 4,
    ),
    width: 380,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(2),
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: 'Login Gagal',
    desc: 'Email atau password anda salah.',
    autoHide: const Duration(seconds: 3),
  ).show();
}
