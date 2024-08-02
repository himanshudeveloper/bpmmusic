// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artistHash() => r'f47141fe0f72902249335a0ee53845f845b300e6';

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

/// See also [artist].
@ProviderFor(artist)
const artistProvider = ArtistFamily();

/// See also [artist].
class ArtistFamily extends Family<AsyncValue<ArtistModel>> {
  /// See also [artist].
  const ArtistFamily();

  /// See also [artist].
  ArtistProvider call({
    required String id,
  }) {
    return ArtistProvider(
      id: id,
    );
  }

  @override
  ArtistProvider getProviderOverride(
    covariant ArtistProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'artistProvider';
}

/// See also [artist].
class ArtistProvider extends AutoDisposeFutureProvider<ArtistModel> {
  /// See also [artist].
  ArtistProvider({
    required String id,
  }) : this._internal(
          (ref) => artist(
            ref as ArtistRef,
            id: id,
          ),
          from: artistProvider,
          name: r'artistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artistHash,
          dependencies: ArtistFamily._dependencies,
          allTransitiveDependencies: ArtistFamily._allTransitiveDependencies,
          id: id,
        );

  ArtistProvider._internal(
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
  Override overrideWith(
    FutureOr<ArtistModel> Function(ArtistRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtistProvider._internal(
        (ref) => create(ref as ArtistRef),
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
  AutoDisposeFutureProviderElement<ArtistModel> createElement() {
    return _ArtistProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtistProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArtistRef on AutoDisposeFutureProviderRef<ArtistModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ArtistProviderElement
    extends AutoDisposeFutureProviderElement<ArtistModel> with ArtistRef {
  _ArtistProviderElement(super.provider);

  @override
  String get id => (origin as ArtistProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
