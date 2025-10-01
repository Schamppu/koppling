// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'words.dart';

class WordsMapper extends ClassMapperBase<Words> {
  WordsMapper._();

  static WordsMapper? _instance;
  static WordsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WordsMapper._());
      WordMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Words';

  static int _$id(Words v) => v.id;
  static const Field<Words, int> _f$id = Field('id', _$id);
  static String _$koppling(Words v) => v.koppling;
  static const Field<Words, String> _f$koppling = Field('koppling', _$koppling);
  static List<Word> _$words(Words v) => v.words;
  static const Field<Words, List<Word>> _f$words = Field('words', _$words);

  @override
  final MappableFields<Words> fields = const {
    #id: _f$id,
    #koppling: _f$koppling,
    #words: _f$words,
  };

  static Words _instantiate(DecodingData data) {
    return Words(
      id: data.dec(_f$id),
      koppling: data.dec(_f$koppling),
      words: data.dec(_f$words),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Words fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Words>(map);
  }

  static Words fromJson(String json) {
    return ensureInitialized().decodeJson<Words>(json);
  }
}

mixin WordsMappable {
  String toJson() {
    return WordsMapper.ensureInitialized().encodeJson<Words>(this as Words);
  }

  Map<String, dynamic> toMap() {
    return WordsMapper.ensureInitialized().encodeMap<Words>(this as Words);
  }

  WordsCopyWith<Words, Words, Words> get copyWith =>
      _WordsCopyWithImpl<Words, Words>(this as Words, $identity, $identity);
  @override
  String toString() {
    return WordsMapper.ensureInitialized().stringifyValue(this as Words);
  }

  @override
  bool operator ==(Object other) {
    return WordsMapper.ensureInitialized().equalsValue(this as Words, other);
  }

  @override
  int get hashCode {
    return WordsMapper.ensureInitialized().hashValue(this as Words);
  }
}

extension WordsValueCopy<$R, $Out> on ObjectCopyWith<$R, Words, $Out> {
  WordsCopyWith<$R, Words, $Out> get $asWords =>
      $base.as((v, t, t2) => _WordsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WordsCopyWith<$R, $In extends Words, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get words;
  $R call({int? id, String? koppling, List<Word>? words});
  WordsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WordsCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Words, $Out>
    implements WordsCopyWith<$R, Words, $Out> {
  _WordsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Words> $mapper = WordsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get words =>
      ListCopyWith(
        $value.words,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(words: v),
      );
  @override
  $R call({int? id, String? koppling, List<Word>? words}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (koppling != null) #koppling: koppling,
      if (words != null) #words: words,
    }),
  );
  @override
  Words $make(CopyWithData data) => Words(
    id: data.get(#id, or: $value.id),
    koppling: data.get(#koppling, or: $value.koppling),
    words: data.get(#words, or: $value.words),
  );

  @override
  WordsCopyWith<$R2, Words, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WordsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class WordMapper extends ClassMapperBase<Word> {
  WordMapper._();

  static WordMapper? _instance;
  static WordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WordMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Word';

  static String _$word(Word v) => v.word;
  static const Field<Word, String> _f$word = Field('word', _$word);
  static List<String> _$forms(Word v) => v.forms;
  static const Field<Word, List<String>> _f$forms = Field('forms', _$forms);
  static String _$english(Word v) => v.english;
  static const Field<Word, String> _f$english = Field('english', _$english);

  @override
  final MappableFields<Word> fields = const {
    #word: _f$word,
    #forms: _f$forms,
    #english: _f$english,
  };

  static Word _instantiate(DecodingData data) {
    return Word(
      word: data.dec(_f$word),
      forms: data.dec(_f$forms),
      english: data.dec(_f$english),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Word fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Word>(map);
  }

  static Word fromJson(String json) {
    return ensureInitialized().decodeJson<Word>(json);
  }
}

mixin WordMappable {
  String toJson() {
    return WordMapper.ensureInitialized().encodeJson<Word>(this as Word);
  }

  Map<String, dynamic> toMap() {
    return WordMapper.ensureInitialized().encodeMap<Word>(this as Word);
  }

  WordCopyWith<Word, Word, Word> get copyWith =>
      _WordCopyWithImpl<Word, Word>(this as Word, $identity, $identity);
  @override
  String toString() {
    return WordMapper.ensureInitialized().stringifyValue(this as Word);
  }

  @override
  bool operator ==(Object other) {
    return WordMapper.ensureInitialized().equalsValue(this as Word, other);
  }

  @override
  int get hashCode {
    return WordMapper.ensureInitialized().hashValue(this as Word);
  }
}

extension WordValueCopy<$R, $Out> on ObjectCopyWith<$R, Word, $Out> {
  WordCopyWith<$R, Word, $Out> get $asWord =>
      $base.as((v, t, t2) => _WordCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WordCopyWith<$R, $In extends Word, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get forms;
  $R call({String? word, List<String>? forms, String? english});
  WordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WordCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Word, $Out>
    implements WordCopyWith<$R, Word, $Out> {
  _WordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Word> $mapper = WordMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get forms =>
      ListCopyWith(
        $value.forms,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(forms: v),
      );
  @override
  $R call({String? word, List<String>? forms, String? english}) => $apply(
    FieldCopyWithData({
      if (word != null) #word: word,
      if (forms != null) #forms: forms,
      if (english != null) #english: english,
    }),
  );
  @override
  Word $make(CopyWithData data) => Word(
    word: data.get(#word, or: $value.word),
    forms: data.get(#forms, or: $value.forms),
    english: data.get(#english, or: $value.english),
  );

  @override
  WordCopyWith<$R2, Word, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _WordCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

