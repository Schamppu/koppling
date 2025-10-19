import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/koppling/widgets/components/koppling_bottom_bar_widget.dart';
import 'package:client/features/koppling/widgets/components/word_widget.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:client/widgets/scaffolds/scaffold_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';

class PageKoppling extends ConsumerWidget {
  const PageKoppling({super.key, required this.koppling});

  final GameKoppling koppling;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(kopplingProvider);
    final words = state.words;
    List<WordWidget> children = List.generate(
      words.length,
      (index) => WordWidget(
        word: words.elementAt(index),
        key: Key(words.elementAt(index).word),
      ),
    );
    List<Words> completedWords = [];
    for (final completedWord in state.gameKoppling?.correctGroups ?? []) {
      final word = state.gameKoppling?.words.firstWhere(
        (w) => w.id == completedWord,
      );
      completedWords.add(word!);
    }

    return ScaffoldDefault(
      padding: const EdgeInsets.only(top: 16, left: 4, right: 4),
      onPop: () async {
        KopplingManager().update(
          KopplingManager().state.copyWith(id: KopplingManager().state.id + 1),
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ReorderableBuilder(
            onReorder: (reorderedListFunction) {
              // Handle the reorder logic here
            },
            enableDraggable: false,
            enableLongPress: false,
            builder: (children) {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                children: children,
              );
            },
            children: children,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (final (index, completedWord) in completedWords.indexed)
                KopplingGroupWidget(index: index, completedWord: completedWord),
            ],
          ),
          KopplingBottomBarWidget(),
        ],
      ),
    );
  }
}

class KopplingGroupWidget extends ConsumerWidget {
  const KopplingGroupWidget({
    super.key,
    required this.index,
    required this.completedWord,
  });

  final int index;
  final Words completedWord;

  Color getGroupColor(int index, BuildContext context) {
    switch (index) {
      case 0:
        return const Color.fromARGB(255, 92, 59, 145);
      case 1:
        return const Color.fromARGB(255, 175, 86, 70);
      case 2:
        return const Color.fromARGB(255, 138, 57, 97);
      case 3:
        return const Color.fromARGB(255, 141, 37, 161);
      default:
        return context.theme.colors.cardBackground;
    }
  }

  Color lightenColor(Color color, [double amount = -0.05]) {
    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return hslLight.toColor();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 0 : 97),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: lightenColor(getGroupColor(index, context)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              completedWord.koppling,
              style: context.theme.fonts.primaryOnPrimary.copyWith(
                color: lightenColor(getGroupColor(index, context), 0.5),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 500.ms, delay: (300 + index * 100).ms);
  }
}
