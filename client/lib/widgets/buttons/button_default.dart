import 'package:client/features/theme/theme_extension.dart';
import 'package:client/widgets/cards/card_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonDefault extends ConsumerWidget {
  const ButtonDefault({
    super.key,
    this.label,
    this.icon,
    this.paddingSize = PaddingSize.medium,
    required this.onPressed,
    this.disabled = false,
    this.color,
    this.textColor,
  });
  final String? label;
  final IconData? icon;
  final PaddingSize paddingSize;
  final VoidCallback onPressed;
  final bool disabled;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: disabled
            ? context.theme.colors.disabled
            : context.theme.colors.buttonBackground,
        foregroundColor: context.theme.colors.onButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 0,
        padding: EdgeInsets.zero,
        shadowColor: Colors.transparent,
      ),
      onPressed: disabled ? null : () => onPressed(),
      child: Padding(
        padding: EdgeInsets.all(
          paddingSize == PaddingSize.small
              ? 8
              : paddingSize == PaddingSize.medium
              ? 12
              : 16,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon, color: context.theme.colors.onPrimary),
            if (icon != null && label != null) const SizedBox(width: 8),
            if (label != null)
              Text(label!, style: context.theme.fonts.primaryOnPrimary),
          ],
        ),
      ),
    );
  }
}
