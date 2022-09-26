import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> msnKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError(String msn) {
    final snackbar = SnackBar(
        duration: const Duration(milliseconds: 5000),
        elevation: 10.0,
        backgroundColor: Colors.red.withOpacity(0.9),
        content: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                msn,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ));

    msnKey.currentState?.showSnackBar(snackbar);
  }

  static showSnackBarExito(String msn) {
    final snackbar = SnackBar(
        duration: const Duration(milliseconds: 3000),
        elevation: 10.0,
        backgroundColor: const Color(0xff52b04f),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 25,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              msn,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ));

    msnKey.currentState?.showSnackBar(snackbar);
  }

  static showSnackBarIfo(String msn) {
    final snackbar = SnackBar(
        duration: const Duration(milliseconds: 3000),
        elevation: 10.0,
        backgroundColor: Colors.blue.withOpacity(0.9),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
              size: 25,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              msn,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ));

    msnKey.currentState?.showSnackBar(snackbar);
  }
}
