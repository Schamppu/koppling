import 'package:auto_size_text/auto_size_text.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
