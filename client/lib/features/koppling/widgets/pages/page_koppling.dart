import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:client/widgets/scaffolds/scaffold_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';

class PageKoppling extends ConsumerWidget {
  const PageKoppling({super.key, required this.koppling});

  final GameKoppling koppling;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = koppling.words.expand((w) => w.words).toList();
    List<WordWidget> children = List.generate(
      words.length,
      (index) => WordWidget(
        word: words.elementAt(index),
        key: Key(words.elementAt(index).word),
      ),
    );

    children.shuffle();

    return ScaffoldDefault(
      child: ReorderableBuilder(
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
    );
  }
}

class WordWidget extends ConsumerWidget {
  const WordWidget({super.key, required this.word});

  final Word word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          key: Key(word.word),
          decoration: BoxDecoration(
            color: context.theme.colors.cardBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(4),
          child: Center(
            child: AutoSizeText(
              word.word,
              textAlign: TextAlign.center,
              maxFontSize: 16,
              minFontSize: 8,
              maxLines: 2,
              style: context.theme.fonts.primary,
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
                // Handle word tap if needed
              },
            ),
          ),
        ),
      ],
    );
  }
}
