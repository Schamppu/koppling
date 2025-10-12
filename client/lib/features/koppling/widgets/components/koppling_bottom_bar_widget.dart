import 'package:client/features/koppling/functions/check_words.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/navigation/router/router.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:client/widgets/buttons/button_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KopplingBottomBarWidget extends ConsumerWidget {
  const KopplingBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWords = ref.watch(
      kopplingProvider.select((p) => p.selectedWords),
    );
    final misses = ref.watch(kopplingProvider.select((p) => p.misses));
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
                Builder(
                  builder: (context) {
                    if (i < misses) {
                      return Icon(
                            Icons.favorite_border,
                            color: context.theme.colors.background,
                          )
                          .animate(
                            onComplete: (controller) {
                              controller.reverse();
                            },
                          )
                          .slideY(
                            begin: 0,
                            end: -0.2,
                            duration: 300.ms,
                            curve: Curves.easeInOutCirc,
                          )
                          .scale(
                            begin: Offset(1, 1),
                            end: Offset(1.2, 1.2),
                            duration: 300.ms,
                            curve: Curves.easeInOutCirc,
                          );
                    }
                    return Icon(
                      Icons.favorite,
                      color: context.theme.colors.primary,
                    );
                  },
                ),
            ],
          ),
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 16,
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
              ButtonDefault(
                onPressed: () async {
                  await checkWords(
                    gameKoppling: koppling.state.gameKoppling!,
                    words: koppling.state.selectedWords,
                  );
                },
                label: 'Check',
                icon: Icons.check,
                disabled: selectedWords.length != 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
