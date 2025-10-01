import 'package:dart_mappable/dart_mappable.dart';
part 'koppling.mapper.dart';

@MappableClass()
class Koppling with KopplingMappable {
  Koppling({
    required this.id,
    required this.words,
    required this.createdAt,
  });

  final int id;
  final List<int> words;
  final DateTime createdAt;
}
