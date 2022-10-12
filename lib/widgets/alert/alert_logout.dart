import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/services/firebase_service.dart';
import 'package:chat_bot/pages/login_pages.dart';

void AlertLogOut(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.info,
    borderSide: const BorderSide(
      color: Colors.white,
      width: 10,
    ),
    width: 380,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(2),
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: 'Info',
    desc: 'Apakah anda yakin untuk logout?',
    showCloseIcon: true,
    btnOkText: 'Ya',
    btnCancelText: 'Tidak',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginPage();
          },
        ),
      );
    },
  ).show();
}
