// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpm_song_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bpmSongProviderHash() => r'c748f8ec336e3e80aa31676bab613ec6ea35f329';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$BpmSongProvider
    extends BuildlessAutoDisposeAsyncNotifier<AudioDetail> {
  late final String id;

  FutureOr<AudioDetail> build(
    String id,
  );
}

/// See also [BpmSongProvider].
@ProviderFor(BpmSongProvider)
const bpmSongProviderProvider = BpmSongProviderFamily();

/// See also [BpmSongProvider].
class BpmSongProviderFamily extends Family<AsyncValue<AudioDetail>> {
  /// See also [BpmSongProvider].
  const BpmSongProviderFamily();

  /// See also [BpmSongProvider].
  BpmSongProviderProvider call(
    String id,
  ) {
    return BpmSongProviderProvider(
      id,
    );
  }

  @override
  BpmSongProviderProvider getProviderOverride(
    covariant BpmSongProviderProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bpmSongProviderProvider';
}

/// See also [BpmSongProvider].
class BpmSongProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BpmSongProvider, AudioDetail> {
  /// See also [BpmSongProvider].
  BpmSongProviderProvider(
    String id,
  ) : this._internal(
          () => BpmSongProvider()..id = id,
          from: bpmSongProviderProvider,
          name: r'bpmSongProviderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bpmSongProviderHash,
          dependencies: BpmSongProviderFamily._dependencies,
          allTransitiveDependencies:
              BpmSongProviderFamily._allTransitiveDependencies,
          id: id,
        );

  BpmSongProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<AudioDetail> runNotifierBuild(
    covariant BpmSongProvider notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(BpmSongProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: BpmSongProviderProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BpmSongProvider, AudioDetail>
      createElement() {
    return _BpmSongProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BpmSongProviderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BpmSongProviderRef on AutoDisposeAsyncNotifierProviderRef<AudioDetail> {
  /// The parameter `id` of this provider.
  String get id;
}

class _BpmSongProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BpmSongProvider,
        AudioDetail> with BpmSongProviderRef {
  _BpmSongProviderProviderElement(super.provider);

  @override
  String get id => (origin as BpmSongProviderProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
