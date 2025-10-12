import 'package:dart_mappable/dart_mappable.dart';
part 'koppling.mapper.dart';

@MappableClass()
class Koppling with KopplingMappable {
  Koppling({
    required this.id,
    required this.words,
    required this.createdAt,
    this.correctGroups = const [],
    this.misses = 0,
    this.completed = false,
    this.solved = false,
  });

  final int id;
  final List<int> words;
  final DateTime createdAt;
  final int misses;
  final bool completed;
  final bool solved;
  final List<int> correctGroups;
}
