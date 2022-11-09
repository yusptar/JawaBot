import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void AlertRegisterFailure(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    borderSide: const BorderSide(
      color: Colors.white,
      width: 2,
    ),
    width: 380,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(2),
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: 'Register Gagal',
    desc: 'Nama, dan password harus terisi.',
    autoHide: const Duration(seconds: 3),
  ).show();
}
