import 'package:client/features/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldDefault extends ConsumerStatefulWidget {
  const FieldDefault({
    super.key,
    required this.label,
    this.icon,
    this.isPassword = false,
    this.onChanged,
  });

  final String label;
  final IconData? icon;
  final bool isPassword;
  final Function(String text)? onChanged;

  @override
  ConsumerState<FieldDefault> createState() => _FieldDefaultState();
}

class _FieldDefaultState extends ConsumerState<FieldDefault> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        icon: widget.icon != null
            ? Icon(widget.icon, color: context.theme.colors.primary)
            : null,
        label: Text(widget.label, style: context.theme.fonts.primary),
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
