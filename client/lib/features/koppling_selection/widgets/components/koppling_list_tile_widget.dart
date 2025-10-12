import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling_selection/functions/select_koppling.dart';
import 'package:client/features/theme/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KopplingListTileWidget extends ConsumerWidget {
  const KopplingListTileWidget({super.key, required this.gameKoppling});

  final GameKoppling gameKoppling;

  String get formattedDate {
    final date = gameKoppling.createdAt;
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      tileColor: context.theme.colors.cardBackground.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        'Koppling ${gameKoppling.id}',
        style: context.theme.fonts.subTitle,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: context.theme.colors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Builder(
                          builder: (context) {
                            if (gameKoppling.correctGroups.length > i) {
                              return Icon(
                                Icons.star,
                                color: const Color.fromARGB(255, 255, 130, 211),
                                size: 16,
                              );
                            } else {
                              return Icon(
                                Icons.star_border,
                                color: const Color.fromARGB(255, 210, 206, 208),
                                size: 16,
                              );
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.theme.colors.cardBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Builder(
                          builder: (context) {
                            if (gameKoppling.misses > i) {
                              return Icon(
                                Icons.favorite_border,
                                color: const Color.fromARGB(255, 138, 78, 117),
                                size: 16,
                              );
                            } else {
                              return Icon(
                                Icons.favorite,
                                color: const Color.fromARGB(255, 212, 74, 131),
                                size: 16,
                              );
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Text('Published: $formattedDate', style: context.theme.fonts.primary),
        ],
      ),
      onTap: () async {
        await selectKoppling(gameKoppling: gameKoppling);
      },
    );
  }
}
