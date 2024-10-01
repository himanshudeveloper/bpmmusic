// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_album_song_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$multialbumsongHash() => r'5efa1cd60dddd799059ef134c5e6cc927b9b81bd';

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

/// See also [multialbumsong].
@ProviderFor(multialbumsong)
const multialbumsongProvider = MultialbumsongFamily();

/// See also [multialbumsong].
class MultialbumsongFamily extends Family<AsyncValue<LibrarySongModel>> {
  /// See also [multialbumsong].
  const MultialbumsongFamily();

  /// See also [multialbumsong].
  MultialbumsongProvider call({
    required String ids,
  }) {
    return MultialbumsongProvider(
      ids: ids,
    );
  }

  @override
  MultialbumsongProvider getProviderOverride(
    covariant MultialbumsongProvider provider,
  ) {
    return call(
      ids: provider.ids,
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
  String? get name => r'multialbumsongProvider';
}

/// See also [multialbumsong].
class MultialbumsongProvider
    extends AutoDisposeFutureProvider<LibrarySongModel> {
  /// See also [multialbumsong].
  MultialbumsongProvider({
    required String ids,
  }) : this._internal(
          (ref) => multialbumsong(
            ref as MultialbumsongRef,
            ids: ids,
          ),
          from: multialbumsongProvider,
          name: r'multialbumsongProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$multialbumsongHash,
          dependencies: MultialbumsongFamily._dependencies,
          allTransitiveDependencies:
              MultialbumsongFamily._allTransitiveDependencies,
          ids: ids,
        );

  MultialbumsongProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ids,
  }) : super.internal();

  final String ids;

  @override
  Override overrideWith(
    FutureOr<LibrarySongModel> Function(MultialbumsongRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MultialbumsongProvider._internal(
        (ref) => create(ref as MultialbumsongRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ids: ids,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LibrarySongModel> createElement() {
    return _MultialbumsongProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MultialbumsongProvider && other.ids == ids;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ids.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MultialbumsongRef on AutoDisposeFutureProviderRef<LibrarySongModel> {
  /// The parameter `ids` of this provider.
  String get ids;
}

class _MultialbumsongProviderElement
    extends AutoDisposeFutureProviderElement<LibrarySongModel>
    with MultialbumsongRef {
  _MultialbumsongProviderElement(super.provider);

  @override
  String get ids => (origin as MultialbumsongProvider).ids;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
