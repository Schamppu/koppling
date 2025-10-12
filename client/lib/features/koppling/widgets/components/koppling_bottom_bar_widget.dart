import 'package:client/features/navigation/router/router.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:client/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KopplingBottomBarWidget extends ConsumerWidget {
  const KopplingBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colors.cardBackground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 4; i++)
                Icon(Icons.favorite, color: context.theme.colors.primary),
            ],
          ),
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonDefault(
                onPressed: () {
                  router.pop();
                },
                label: 'Back',
                icon: Icons.arrow_back,
              ),

              ButtonDefault(
                onPressed: () {
                  router.pop();
                },
                label: 'Shuffle',
                icon: Icons.shuffle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
