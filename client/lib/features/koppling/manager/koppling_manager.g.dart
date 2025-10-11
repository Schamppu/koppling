// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'koppling_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Koppling)
const kopplingProvider = KopplingProvider._();

final class KopplingProvider
    extends $NotifierProvider<Koppling, KopplingState> {
  const KopplingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kopplingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kopplingHash();

  @$internal
  @override
  Koppling create() => Koppling();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KopplingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KopplingState>(value),
    );
  }
}

String _$kopplingHash() => r'317a35ece21e8abc03a19210fd4dc324916d4a68';

abstract class _$Koppling extends $Notifier<KopplingState> {
  KopplingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<KopplingState, KopplingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<KopplingState, KopplingState>,
              KopplingState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
