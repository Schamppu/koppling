import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling_selection/functions/select_koppling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KopplingListTileWidget extends ConsumerWidget {
  const KopplingListTileWidget({super.key, required this.gameKoppling});

  final GameKoppling gameKoppling;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text('Koppling ${gameKoppling.id}'),
      subtitle: Column(
        children: [
          Text('Created At: ${gameKoppling.createdAt}'),
          for (final word in gameKoppling.words.expand((w) => w.words))
            Text('- ${word.word} (${word.english})'),
        ],
      ),
      onTap: () async {
        await selectKoppling(gameKoppling: gameKoppling);
      },
    );
  }
}
