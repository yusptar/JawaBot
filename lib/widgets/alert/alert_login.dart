import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void AlertLoginSucces(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
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
    title: 'Login Berhasil',
    desc: 'Selamat Datang di JawaBot!',
    autoHide: const Duration(seconds: 2),
  ).show();
}
