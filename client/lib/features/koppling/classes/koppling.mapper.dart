// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'koppling.dart';

class KopplingMapper extends ClassMapperBase<Koppling> {
  KopplingMapper._();

  static KopplingMapper? _instance;
  static KopplingMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KopplingMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Koppling';

  static int _$id(Koppling v) => v.id;
  static const Field<Koppling, int> _f$id = Field('id', _$id);
  static List<int> _$words(Koppling v) => v.words;
  static const Field<Koppling, List<int>> _f$words = Field('words', _$words);
  static DateTime _$createdAt(Koppling v) => v.createdAt;
  static const Field<Koppling, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static int _$misses(Koppling v) => v.misses;
  static const Field<Koppling, int> _f$misses = Field(
    'misses',
    _$misses,
    opt: true,
    def: 0,
  );
  static bool _$completed(Koppling v) => v.completed;
  static const Field<Koppling, bool> _f$completed = Field(
    'completed',
    _$completed,
    opt: true,
    def: false,
  );
  static bool _$solved(Koppling v) => v.solved;
  static const Field<Koppling, bool> _f$solved = Field(
    'solved',
    _$solved,
    opt: true,
    def: false,
  );
  static List<int> _$correctGroups(Koppling v) => v.correctGroups;
  static const Field<Koppling, List<int>> _f$correctGroups = Field(
    'correctGroups',
    _$correctGroups,
  );

  @override
  final MappableFields<Koppling> fields = const {
    #id: _f$id,
    #words: _f$words,
    #createdAt: _f$createdAt,
    #misses: _f$misses,
    #completed: _f$completed,
    #solved: _f$solved,
    #correctGroups: _f$correctGroups,
  };

  static Koppling _instantiate(DecodingData data) {
    return Koppling(
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

  static Koppling fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Koppling>(map);
  }

  static Koppling fromJson(String json) {
    return ensureInitialized().decodeJson<Koppling>(json);
  }
}

mixin KopplingMappable {
  String toJson() {
    return KopplingMapper.ensureInitialized().encodeJson<Koppling>(
      this as Koppling,
    );
  }

  Map<String, dynamic> toMap() {
    return KopplingMapper.ensureInitialized().encodeMap<Koppling>(
      this as Koppling,
    );
  }

  KopplingCopyWith<Koppling, Koppling, Koppling> get copyWith =>
      _KopplingCopyWithImpl<Koppling, Koppling>(
        this as Koppling,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return KopplingMapper.ensureInitialized().stringifyValue(this as Koppling);
  }

  @override
  bool operator ==(Object other) {
    return KopplingMapper.ensureInitialized().equalsValue(
      this as Koppling,
      other,
    );
  }

  @override
  int get hashCode {
    return KopplingMapper.ensureInitialized().hashValue(this as Koppling);
  }
}

extension KopplingValueCopy<$R, $Out> on ObjectCopyWith<$R, Koppling, $Out> {
  KopplingCopyWith<$R, Koppling, $Out> get $asKoppling =>
      $base.as((v, t, t2) => _KopplingCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KopplingCopyWith<$R, $In extends Koppling, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get words;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get correctGroups;
  $R call({
    int? id,
    List<int>? words,
    DateTime? createdAt,
    int? misses,
    bool? completed,
    bool? solved,
    List<int>? correctGroups,
  });
  KopplingCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _KopplingCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Koppling, $Out>
    implements KopplingCopyWith<$R, Koppling, $Out> {
  _KopplingCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Koppling> $mapper =
      KopplingMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get words => ListCopyWith(
    $value.words,
    (v, t) => ObjectCopyWith(v, $identity, t),
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
    List<int>? words,
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
  Koppling $make(CopyWithData data) => Koppling(
    id: data.get(#id, or: $value.id),
    words: data.get(#words, or: $value.words),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    misses: data.get(#misses, or: $value.misses),
    completed: data.get(#completed, or: $value.completed),
    solved: data.get(#solved, or: $value.solved),
    correctGroups: data.get(#correctGroups, or: $value.correctGroups),
  );

  @override
  KopplingCopyWith<$R2, Koppling, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _KopplingCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

