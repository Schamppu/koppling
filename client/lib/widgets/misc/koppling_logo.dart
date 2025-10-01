import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:client/features/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class KopplingLogoWidget extends ConsumerWidget {
  const KopplingLogoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: context.theme.colors.primary,
                      ),
                    )
                    .animate(
                      onComplete: (controller) {
                        controller.repeat(reverse: true);
                      },
                    )
                    .slideY(
                      curve: Curves.easeInOutCirc,
                      duration: 1500.ms,
                      delay: 1000.ms,
                    )
                    .rotate(
                      curve: Curves.easeInOutCirc,
                      duration: 1500.ms,
                      delay: 1000.ms,
                      alignment: Alignment.topCenter,
                    )
                    .then(duration: 20.seconds)
                    .shimmer(),
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: context.theme.colors.primary,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                Container(
                  width: 24,
                  height: 16,
                  decoration: BoxDecoration(
                    color: context.theme.colors.primary,
                  ),
                ),
                Container(
                  width: 24,
                  height: 16,
                  decoration: BoxDecoration(
                    color: context.theme.colors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          'KOPPLING',
          style: context.theme.fonts.titleFont.copyWith(height: 0),
        ),
      ],
    );
  }
}
