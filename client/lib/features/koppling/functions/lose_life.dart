import 'package:client/features/koppling/manager/koppling_manager.dart';

Future<void> loseLife() async {
  koppling.update(koppling.state.copyWith(misses: koppling.state.misses + 1));
}
