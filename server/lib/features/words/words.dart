import 'package:dart_mappable/dart_mappable.dart';
part 'words.mapper.dart';

@MappableClass()
class Words with WordsMappable {
  Words({
    required this.id,
    required this.koppling,
    required this.words,
  });

  final int id;
  final String koppling;
  final List<Word> words;
}

@MappableClass()
class Word with WordMappable {
  Word({
    required this.word,
    required this.forms,
    required this.english,
  });

  final String word;
  final List<String> forms;
  final String english;
}
