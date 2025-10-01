import 'package:client/features/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:toastification/toastification.dart';

Future<void> showSuccess({
  required String title,
  String? message,
  IconData? icon,
}) async {
  toastification.show(
    title: Text(title, style: ktheme.fonts.primaryOnPrimary),
    description: message != null
        ? Text(message, style: ktheme.fonts.primaryOnPrimary)
        : null,
    icon: icon != null
        ? Icon(icon, color: ktheme.colors.buttonBackground)
        : null,
    alignment: Alignment.bottomCenter,
    backgroundColor: ktheme.colors.primary,
    borderSide: BorderSide.none,
    autoCloseDuration: 4.seconds,
    animationDuration: 300.ms,
    animationBuilder: (context, animation, alignment, child) {
      // Slide transition with EaseInOut curve
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
  );
}

Future<void> showError({
  required String title,
  String? message,
  IconData? icon,
}) async {
  toastification.show(
    title: Text(title, style: ktheme.fonts.onError),
    description: message != null
        ? Text(message, style: ktheme.fonts.onError)
        : null,
    icon: icon != null ? Icon(icon, color: ktheme.colors.lightError) : null,
    alignment: Alignment.bottomCenter,
    backgroundColor: ktheme.colors.error,
    borderSide: BorderSide.none,
    autoCloseDuration: 4.seconds,
    animationDuration: 300.ms,
    animationBuilder: (context, animation, alignment, child) {
      // Slide transition with EaseInOut curve
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
  );
}
