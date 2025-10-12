import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordWidget extends ConsumerWidget {
  const WordWidget({super.key, required this.word});

  final Word word;

  EdgeInsets getMargin(int index) {
    if (index == -1) {
      return const EdgeInsets.all(2);
    } else if (index == 0) {
      return const EdgeInsets.only(left: 2, top: 2, bottom: 2);
    } else if (index == 3) {
      return const EdgeInsets.only(right: 2, top: 2, bottom: 2);
    } else {
      return const EdgeInsets.only(top: 2, bottom: 2);
    }
  }

  BorderRadius getBorderRadius(int index) {
    if (index == -1) {
      return BorderRadius.circular(8);
    } else if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomLeft: Radius.circular(8),
      );
    } else if (index == 3) {
      return const BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      );
    } else {
      return BorderRadius.circular(0);
    }
  }

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      kopplingProvider.select(
        (p) => p.selectedWords.indexWhere((w) => w.word == word.word) != -1,
      ),
    );
    final correct = ref.watch(
      kopplingProvider.select(
        (p) =>
            p.completedWords
                .expand((element) => element.words)
                .toList()
                .indexWhere((w) => w.word == word.word) !=
            -1,
      ),
    );
    int correctGroupIndex = -1;
    int indexInGroup = -1;
    if (correct) {
      correctGroupIndex = ref.watch(
        kopplingProvider.select(
          (p) => p.completedWords.indexWhere(
            (group) => group.words.indexWhere((w) => w.word == word.word) != -1,
          ),
        ),
      );
      if (correctGroupIndex != -1) {
        final group = ref.read(kopplingProvider).words;
        indexInGroup = group.indexWhere((w) => w.word == word.word);
        // There are 4 per group, so we can use modulo to find the index in the group
        indexInGroup = indexInGroup % 4;
      }
    }
    return Stack(
      children: [
        Container(
          key: Key(word.word),
          decoration: BoxDecoration(
            color: selected
                ? context.theme.colors.primary
                : correct
                ? getGroupColor(correctGroupIndex, context)
                : context.theme.colors.cardBackground,
            borderRadius: getBorderRadius(indexInGroup),
          ),
          margin: getMargin(indexInGroup),
          padding: const EdgeInsets.all(4),
          child: Center(
            child: AutoSizeText(
              word.word,
              textAlign: TextAlign.center,
              maxFontSize: 16,
              minFontSize: 8,
              maxLines: 2,
              style: selected
                  ? context.theme.fonts.primaryOnPrimary
                  : correct
                  ? context.theme.fonts.primaryOnPrimary
                  : context.theme.fonts.primary,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              overlayColor: WidgetStateProperty.all(
                context.theme.colors.primary.withValues(alpha: 0.1),
              ),
              hoverColor: context.theme.colors.primary.withValues(alpha: 0.1),
              focusColor: context.theme.colors.primary.withValues(alpha: 0.25),
              splashColor: context.theme.colors.primary.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                if (correct) {
                  return;
                }
                // Handle word tap if needed
                final list = List<Word>.from(koppling.state.selectedWords);

                if (selected) {
                  list.removeWhere((w) => w.word == word.word);
                } else {
                  if (list.length >= 4) {
                    return;
                  }
                  list.add(word);
                }
                koppling.update(koppling.state.copyWith(selectedWords: list));
              },
            ),
          ),
        ),
      ],
    );
  }
}
