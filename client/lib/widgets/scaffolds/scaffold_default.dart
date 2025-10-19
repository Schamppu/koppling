import 'package:client/features/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScaffoldDefault extends ConsumerWidget {
  const ScaffoldDefault({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.onPop,
  });
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onPop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (onPop != null) {
            onPop!();
          }
        },
        child: SafeArea(
          child: Padding(padding: padding, child: child),
        ),
      ),
      backgroundColor: context.theme.colors.background,
    );
  }
}
