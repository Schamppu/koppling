// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_koppling.dart';

class GameKopplingMapper extends ClassMapperBase<GameKoppling> {
  GameKopplingMapper._();

  static GameKopplingMapper? _instance;
  static GameKopplingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameKopplingMapper._());
      WordsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameKoppling';

  static int _$id(GameKoppling v) => v.id;
  static const Field<GameKoppling, int> _f$id = Field('id', _$id);
  static List<Words> _$words(GameKoppling v) => v.words;
  static const Field<GameKoppling, List<Words>> _f$words = Field(
    'words',
    _$words,
  );
  static DateTime _$createdAt(GameKoppling v) => v.createdAt;
  static const Field<GameKoppling, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static int _$misses(GameKoppling v) => v.misses;
  static const Field<GameKoppling, int> _f$misses = Field(
    'misses',
    _$misses,
    opt: true,
    def: 0,
  );
  static bool _$completed(GameKoppling v) => v.completed;
  static const Field<GameKoppling, bool> _f$completed = Field(
    'completed',
    _$completed,
    opt: true,
    def: false,
  );
  static bool _$solved(GameKoppling v) => v.solved;
  static const Field<GameKoppling, bool> _f$solved = Field(
    'solved',
    _$solved,
    opt: true,
    def: false,
  );
  static List<int> _$correctGroups(GameKoppling v) => v.correctGroups;
  static const Field<GameKoppling, List<int>> _f$correctGroups = Field(
    'correctGroups',
    _$correctGroups,
  );

  @override
  final MappableFields<GameKoppling> fields = const {
    #id: _f$id,
    #words: _f$words,
    #createdAt: _f$createdAt,
    #misses: _f$misses,
    #completed: _f$completed,
    #solved: _f$solved,
    #correctGroups: _f$correctGroups,
  };

  static GameKoppling _instantiate(DecodingData data) {
    return GameKoppling(
      id: data.dec(_f$id),
      words: data.dec(_f$words),
      createdAt: data.dec(_f$createdAt),
      misses: data.dec(_f$misses),
      completed: data.dec(_f$completed),
      solved: data.dec(_f$solved),
      correctGroups: data.dec(_f$correctGroups),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GameKoppling fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameKoppling>(map);
  }

  static GameKoppling fromJson(String json) {
    return ensureInitialized().decodeJson<GameKoppling>(json);
  }
}

mixin GameKopplingMappable {
  String toJson() {
    return GameKopplingMapper.ensureInitialized().encodeJson<GameKoppling>(
      this as GameKoppling,
    );
  }

  Map<String, dynamic> toMap() {
    return GameKopplingMapper.ensureInitialized().encodeMap<GameKoppling>(
      this as GameKoppling,
    );
  }

  GameKopplingCopyWith<GameKoppling, GameKoppling, GameKoppling> get copyWith =>
      _GameKopplingCopyWithImpl<GameKoppling, GameKoppling>(
        this as GameKoppling,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GameKopplingMapper.ensureInitialized().stringifyValue(
      this as GameKoppling,
    );
  }

  @override
  bool operator ==(Object other) {
    return GameKopplingMapper.ensureInitialized().equalsValue(
      this as GameKoppling,
      other,
    );
  }

  @override
  int get hashCode {
    return GameKopplingMapper.ensureInitialized().hashValue(
      this as GameKoppling,
    );
  }
}

extension GameKopplingValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GameKoppling, $Out> {
  GameKopplingCopyWith<$R, GameKoppling, $Out> get $asGameKoppling =>
      $base.as((v, t, t2) => _GameKopplingCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GameKopplingCopyWith<$R, $In extends GameKoppling, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Words, WordsCopyWith<$R, Words, Words>> get words;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get correctGroups;
  $R call({
    int? id,
    List<Words>? words,
    DateTime? createdAt,
    int? misses,
    bool? completed,
    bool? solved,
    List<int>? correctGroups,
  });
  GameKopplingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameKopplingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameKoppling, $Out>
    implements GameKopplingCopyWith<$R, GameKoppling, $Out> {
  _GameKopplingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameKoppling> $mapper =
      GameKopplingMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Words, WordsCopyWith<$R, Words, Words>> get words =>
      ListCopyWith(
        $value.words,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(words: v),
      );
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get correctGroups =>
      ListCopyWith(
        $value.correctGroups,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(correctGroups: v),
      );
  @override
  $R call({
    int? id,
    List<Words>? words,
    DateTime? createdAt,
    int? misses,
    bool? completed,
    bool? solved,
    List<int>? correctGroups,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (words != null) #words: words,
      if (createdAt != null) #createdAt: createdAt,
      if (misses != null) #misses: misses,
      if (completed != null) #completed: completed,
      if (solved != null) #solved: solved,
      if (correctGroups != null) #correctGroups: correctGroups,
    }),
  );
  @override
  GameKoppling $make(CopyWithData data) => GameKoppling(
    id: data.get(#id, or: $value.id),
    words: data.get(#words, or: $value.words),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    misses: data.get(#misses, or: $value.misses),
    completed: data.get(#completed, or: $value.completed),
    solved: data.get(#solved, or: $value.solved),
    correctGroups: data.get(#correctGroups, or: $value.correctGroups),
  );

  @override
  GameKopplingCopyWith<$R2, GameKoppling, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GameKopplingCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

