// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'koppling_state.dart';

class KopplingStateMapper extends ClassMapperBase<KopplingState> {
  KopplingStateMapper._();

  static KopplingStateMapper? _instance;
  static KopplingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KopplingStateMapper._());
      GameKopplingMapper.ensureInitialized();
      WordMapper.ensureInitialized();
      WordsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KopplingState';

  static GameKoppling? _$gameKoppling(KopplingState v) => v.gameKoppling;
  static const Field<KopplingState, GameKoppling> _f$gameKoppling = Field(
    'gameKoppling',
    _$gameKoppling,
    opt: true,
  );
  static List<Word> _$words(KopplingState v) => v.words;
  static const Field<KopplingState, List<Word>> _f$words = Field(
    'words',
    _$words,
  );
  static List<Word> _$selectedWords(KopplingState v) => v.selectedWords;
  static const Field<KopplingState, List<Word>> _f$selectedWords = Field(
    'selectedWords',
    _$selectedWords,
  );
  static List<Words> _$completedWords(KopplingState v) => v.completedWords;
  static const Field<KopplingState, List<Words>> _f$completedWords = Field(
    'completedWords',
    _$completedWords,
  );
  static int _$misses(KopplingState v) => v.misses;
  static const Field<KopplingState, int> _f$misses = Field('misses', _$misses);
  static int _$id(KopplingState v) => v.id;
  static const Field<KopplingState, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<KopplingState> fields = const {
    #gameKoppling: _f$gameKoppling,
    #words: _f$words,
    #selectedWords: _f$selectedWords,
    #completedWords: _f$completedWords,
    #misses: _f$misses,
    #id: _f$id,
  };

  static KopplingState _instantiate(DecodingData data) {
    return KopplingState(
      gameKoppling: data.dec(_f$gameKoppling),
      words: data.dec(_f$words),
      selectedWords: data.dec(_f$selectedWords),
      completedWords: data.dec(_f$completedWords),
      misses: data.dec(_f$misses),
      id: data.dec(_f$id),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static KopplingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KopplingState>(map);
  }

  static KopplingState fromJson(String json) {
    return ensureInitialized().decodeJson<KopplingState>(json);
  }
}

mixin KopplingStateMappable {
  String toJson() {
    return KopplingStateMapper.ensureInitialized().encodeJson<KopplingState>(
      this as KopplingState,
    );
  }

  Map<String, dynamic> toMap() {
    return KopplingStateMapper.ensureInitialized().encodeMap<KopplingState>(
      this as KopplingState,
    );
  }

  KopplingStateCopyWith<KopplingState, KopplingState, KopplingState>
  get copyWith => _KopplingStateCopyWithImpl<KopplingState, KopplingState>(
    this as KopplingState,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return KopplingStateMapper.ensureInitialized().stringifyValue(
      this as KopplingState,
    );
  }

  @override
  bool operator ==(Object other) {
    return KopplingStateMapper.ensureInitialized().equalsValue(
      this as KopplingState,
      other,
    );
  }

  @override
  int get hashCode {
    return KopplingStateMapper.ensureInitialized().hashValue(
      this as KopplingState,
    );
  }
}

extension KopplingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KopplingState, $Out> {
  KopplingStateCopyWith<$R, KopplingState, $Out> get $asKopplingState =>
      $base.as((v, t, t2) => _KopplingStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KopplingStateCopyWith<$R, $In extends KopplingState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  GameKopplingCopyWith<$R, GameKoppling, GameKoppling>? get gameKoppling;
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get words;
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get selectedWords;
  ListCopyWith<$R, Words, WordsCopyWith<$R, Words, Words>> get completedWords;
  $R call({
    GameKoppling? gameKoppling,
    List<Word>? words,
    List<Word>? selectedWords,
    List<Words>? completedWords,
    int? misses,
    int? id,
  });
  KopplingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _KopplingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KopplingState, $Out>
    implements KopplingStateCopyWith<$R, KopplingState, $Out> {
  _KopplingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KopplingState> $mapper =
      KopplingStateMapper.ensureInitialized();
  @override
  GameKopplingCopyWith<$R, GameKoppling, GameKoppling>? get gameKoppling =>
      $value.gameKoppling?.copyWith.$chain((v) => call(gameKoppling: v));
  @override
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get words =>
      ListCopyWith(
        $value.words,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(words: v),
      );
  @override
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get selectedWords =>
      ListCopyWith(
        $value.selectedWords,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(selectedWords: v),
      );
  @override
  ListCopyWith<$R, Words, WordsCopyWith<$R, Words, Words>> get completedWords =>
      ListCopyWith(
        $value.completedWords,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(completedWords: v),
      );
  @override
  $R call({
    Object? gameKoppling = $none,
    List<Word>? words,
    List<Word>? selectedWords,
    List<Words>? completedWords,
    int? misses,
    int? id,
  }) => $apply(
    FieldCopyWithData({
      if (gameKoppling != $none) #gameKoppling: gameKoppling,
      if (words != null) #words: words,
      if (selectedWords != null) #selectedWords: selectedWords,
      if (completedWords != null) #completedWords: completedWords,
      if (misses != null) #misses: misses,
      if (id != null) #id: id,
    }),
  );
  @override
  KopplingState $make(CopyWithData data) => KopplingState(
    gameKoppling: data.get(#gameKoppling, or: $value.gameKoppling),
    words: data.get(#words, or: $value.words),
    selectedWords: data.get(#selectedWords, or: $value.selectedWords),
    completedWords: data.get(#completedWords, or: $value.completedWords),
    misses: data.get(#misses, or: $value.misses),
    id: data.get(#id, or: $value.id),
  );

  @override
  KopplingStateCopyWith<$R2, KopplingState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _KopplingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

