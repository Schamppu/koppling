import 'package:client/features/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PaddingSize { small, medium, large }

class CardDefault extends ConsumerWidget {
  const CardDefault({
    super.key,
    required this.child,
    this.paddingSize = PaddingSize.large,
  });
  final Widget child;
  final PaddingSize paddingSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(
        paddingSize == PaddingSize.small
            ? 4
            : paddingSize == PaddingSize.medium
            ? 8
            : 16,
      ),
      decoration: BoxDecoration(
        color: context.theme.colors.cardBackground,
        borderRadius: paddingSize == PaddingSize.small
            ? BorderRadius.circular(4)
            : paddingSize == PaddingSize.medium
            ? BorderRadius.circular(8)
            : BorderRadius.circular(16),
        boxShadow: [context.theme.shadows.defaultShadow],
      ),
      child: child,
    );
  }
}
