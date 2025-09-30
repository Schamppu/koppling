import 'package:client/features/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldDefault extends ConsumerWidget {
  const FieldDefault({
    super.key,
    required this.label,
    this.icon,
    this.isPassword = false,
  });

  final String label;
  final IconData? icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        icon: icon != null
            ? Icon(icon, color: context.theme.colors.primary)
            : null,
        label: Text(label, style: context.theme.fonts.primary),
        labelStyle: context.theme.fonts.primary,
        fillColor: context.theme.colors.fieldBackground,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
