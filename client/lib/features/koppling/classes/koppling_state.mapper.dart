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
      WordMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KopplingState';

  static List<Word> _$words(KopplingState v) => v.words;
  static const Field<KopplingState, List<Word>> _f$words = Field(
    'words',
    _$words,
  );

  @override
  final MappableFields<KopplingState> fields = const {#words: _f$words};

  static KopplingState _instantiate(DecodingData data) {
    return KopplingState(words: data.dec(_f$words));
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
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get words;
  $R call({List<Word>? words});
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
  ListCopyWith<$R, Word, WordCopyWith<$R, Word, Word>> get words =>
      ListCopyWith(
        $value.words,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(words: v),
      );
  @override
  $R call({List<Word>? words}) =>
      $apply(FieldCopyWithData({if (words != null) #words: words}));
  @override
  KopplingState $make(CopyWithData data) =>
      KopplingState(words: data.get(#words, or: $value.words));

  @override
  KopplingStateCopyWith<$R2, KopplingState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _KopplingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

