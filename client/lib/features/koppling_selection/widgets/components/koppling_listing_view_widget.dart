import 'package:client/features/authentication/manager/auth_manager.dart';
import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/classes/koppling.dart';
import 'package:client/features/koppling_selection/widgets/components/koppling_list_tile_widget.dart';
import 'package:client/features/networking/functions/networking.dart';
import 'package:client/features/networking/functions/urls.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class KopplingListingView extends ConsumerStatefulWidget {
  const KopplingListingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _KopplingListingViewState();
}

class _KopplingListingViewState extends ConsumerState<KopplingListingView> {
  Future<List<GameKoppling>> fetchKopplings(int pageKey) async {
    final response = await net.get(
      kopplingsLoadEndpoint,
      queryParameters: {
        'user': auth.state.username,
        'page': pageKey - 1,
        'pageSize': 10,
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> kopplingsData = response.data['kopplings'];
      final List<dynamic> wordsData = response.data['words'];
      final kopplings = kopplingsData
          .map((json) => KopplingMapper.fromJson(json))
          .toList();
      final words = wordsData
          .map((json) => WordsMapper.fromJson(json))
          .toList();
      hasNextPage = kopplingsData.length == 10;
      final List<GameKoppling> gameKopplings = [];
      for (final koppling in kopplings) {
        final kopplingWords = koppling.words
            .map((wordId) => words.firstWhere((word) => word.id == wordId))
            .toList();
        gameKopplings.add(
          GameKoppling(
            id: koppling.id,
            words: kopplingWords,
            createdAt: koppling.createdAt,
            misses: koppling.misses,
            completed: koppling.completed,
            solved: koppling.solved,
            correctGroups: koppling.correctGroups,
          ),
        );
      }
      return gameKopplings;
    } else {
      throw Exception('Failed to load kopplings');
    }
  }

  bool hasNextPage = true;

  late final _pagingController = PagingController<int, GameKoppling>(
    getNextPageKey: (state) => !hasNextPage ? null : state.nextIntPageKey,
    fetchPage: (pageKey) => fetchKopplings(pageKey),
  );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PagingListener(
    controller: _pagingController,
    builder: (context, state, fetchNextPage) =>
        PagedListView<int, GameKoppling>(
          shrinkWrap: true,
          state: state,
          fetchNextPage: fetchNextPage,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: KopplingListTileWidget(gameKoppling: item),
            ),
          ),
        ),
  );
}
