// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_state.dart';

class AuthStateMapper extends ClassMapperBase<AuthState> {
  AuthStateMapper._();

  static AuthStateMapper? _instance;
  static AuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthState';

  static bool _$authenticated(AuthState v) => v.authenticated;
  static const Field<AuthState, bool> _f$authenticated = Field(
    'authenticated',
    _$authenticated,
    opt: true,
    def: false,
  );
  static String? _$username(AuthState v) => v.username;
  static const Field<AuthState, String> _f$username = Field(
    'username',
    _$username,
    opt: true,
  );
  static String? _$password(AuthState v) => v.password;
  static const Field<AuthState, String> _f$password = Field(
    'password',
    _$password,
    opt: true,
  );
  static bool _$initialized(AuthState v) => v.initialized;
  static const Field<AuthState, bool> _f$initialized = Field(
    'initialized',
    _$initialized,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<AuthState> fields = const {
    #authenticated: _f$authenticated,
    #username: _f$username,
    #password: _f$password,
    #initialized: _f$initialized,
  };

  static AuthState _instantiate(DecodingData data) {
    return AuthState(
      authenticated: data.dec(_f$authenticated),
      username: data.dec(_f$username),
      password: data.dec(_f$password),
      initialized: data.dec(_f$initialized),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthState>(map);
  }

  static AuthState fromJson(String json) {
    return ensureInitialized().decodeJson<AuthState>(json);
  }
}

mixin AuthStateMappable {
  String toJson() {
    return AuthStateMapper.ensureInitialized().encodeJson<AuthState>(
      this as AuthState,
    );
  }

  Map<String, dynamic> toMap() {
    return AuthStateMapper.ensureInitialized().encodeMap<AuthState>(
      this as AuthState,
    );
  }

  AuthStateCopyWith<AuthState, AuthState, AuthState> get copyWith =>
      _AuthStateCopyWithImpl<AuthState, AuthState>(
        this as AuthState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthStateMapper.ensureInitialized().stringifyValue(
      this as AuthState,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthStateMapper.ensureInitialized().equalsValue(
      this as AuthState,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthStateMapper.ensureInitialized().hashValue(this as AuthState);
  }
}

extension AuthStateValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthState, $Out> {
  AuthStateCopyWith<$R, AuthState, $Out> get $asAuthState =>
      $base.as((v, t, t2) => _AuthStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthStateCopyWith<$R, $In extends AuthState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    bool? authenticated,
    String? username,
    String? password,
    bool? initialized,
  });
  AuthStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthState, $Out>
    implements AuthStateCopyWith<$R, AuthState, $Out> {
  _AuthStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthState> $mapper =
      AuthStateMapper.ensureInitialized();
  @override
  $R call({
    bool? authenticated,
    Object? username = $none,
    Object? password = $none,
    bool? initialized,
  }) => $apply(
    FieldCopyWithData({
      if (authenticated != null) #authenticated: authenticated,
      if (username != $none) #username: username,
      if (password != $none) #password: password,
      if (initialized != null) #initialized: initialized,
    }),
  );
  @override
  AuthState $make(CopyWithData data) => AuthState(
    authenticated: data.get(#authenticated, or: $value.authenticated),
    username: data.get(#username, or: $value.username),
    password: data.get(#password, or: $value.password),
    initialized: data.get(#initialized, or: $value.initialized),
  );

  @override
  AuthStateCopyWith<$R2, AuthState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

