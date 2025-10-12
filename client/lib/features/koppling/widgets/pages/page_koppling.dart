import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/manager/koppling_manager.dart';
import 'package:client/features/koppling/widgets/components/koppling_bottom_bar_widget.dart';
import 'package:client/features/koppling/widgets/components/word_widget.dart';
import 'package:client/widgets/scaffolds/scaffold_default.dart';
import 'package:flutter/material.dart';
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

    return ScaffoldDefault(
      padding: const EdgeInsets.only(top: 16, left: 4, right: 4),
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
          KopplingBottomBarWidget(),
        ],
      ),
    );
  }
}
