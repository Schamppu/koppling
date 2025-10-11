import 'package:client/features/authentication/widgets/pages/page_auth.dart';
import 'package:client/features/koppling/classes/game_koppling.dart';
import 'package:client/features/koppling/widgets/pages/page_koppling.dart';
import 'package:client/features/koppling_selection/widgets/pages/page_koppling_selection.dart';
import 'package:go_router/go_router.dart';

GoRouter get router => KopplingRouter().router;

/// Router for Koppling
class KopplingRouter {
  KopplingRouter._privateConstructor();

  static final KopplingRouter _instance = KopplingRouter._privateConstructor();

  factory KopplingRouter() {
    return _instance;
  }

  final router = GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(path: '/auth', builder: (context, state) => PageAuth()),
      GoRoute(
        path: '/selection',
        builder: (context, state) => PageKopplingSelection(),
      ),
      GoRoute(
        path: '/koppling',
        builder: (context, state) =>
            PageKoppling(koppling: state.extra as GameKoppling),
      ),
    ],
  );
}
