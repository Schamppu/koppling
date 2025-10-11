import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/classes/koppling.dart';
import 'package:client/features/navigation/router/router.dart';
import 'package:client/features/networking/functions/networking.dart';
import 'package:client/features/networking/functions/urls.dart';
import 'package:client/features/words/classes/words.dart';
import 'package:client/widgets/misc/koppling_logo.dart';
import 'package:client/widgets/scaffolds/scaffold_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PageKopplingSelection extends ConsumerWidget {
  const PageKopplingSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldDefault(
      child: Column(
        spacing: 8,
        children: [
          KopplingLogoWidget(),
          Expanded(child: const KopplingListingView(key: Key('d'))),
        ],
      ),
    );
  }
}

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
      queryParameters: {'page': pageKey - 1, 'pageSize': 10},
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
            itemBuilder: (context, item, index) => ListTile(
              title: Text('Koppling ${item.id}'),
              subtitle: Column(
                children: [
                  Text('Created At: ${item.createdAt}'),
                  for (final word in item.words.expand((w) => w.words))
                    Text('- ${word.word} (${word.english})'),
                ],
              ),
              onTap: () {
                router.push('/koppling', extra: item);
              },
            ),
          ),
        ),
  );
}
