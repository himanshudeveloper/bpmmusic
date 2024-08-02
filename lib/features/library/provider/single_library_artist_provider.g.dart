// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_library_artist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singlelibraryartistHash() =>
    r'720c3678d55b7df75ad10f093443ef0e572ad9b4';

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

/// See also [singlelibraryartist].
@ProviderFor(singlelibraryartist)
const singlelibraryartistProvider = SinglelibraryartistFamily();

/// See also [singlelibraryartist].
class SinglelibraryartistFamily
    extends Family<AsyncValue<SingleArtistLibraryModel>> {
  /// See also [singlelibraryartist].
  const SinglelibraryartistFamily();

  /// See also [singlelibraryartist].
  SinglelibraryartistProvider call({
    required String id,
  }) {
    return SinglelibraryartistProvider(
      id: id,
    );
  }

  @override
  SinglelibraryartistProvider getProviderOverride(
    covariant SinglelibraryartistProvider provider,
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
  String? get name => r'singlelibraryartistProvider';
}

/// See also [singlelibraryartist].
class SinglelibraryartistProvider
    extends AutoDisposeFutureProvider<SingleArtistLibraryModel> {
  /// See also [singlelibraryartist].
  SinglelibraryartistProvider({
    required String id,
  }) : this._internal(
          (ref) => singlelibraryartist(
            ref as SinglelibraryartistRef,
            id: id,
          ),
          from: singlelibraryartistProvider,
          name: r'singlelibraryartistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singlelibraryartistHash,
          dependencies: SinglelibraryartistFamily._dependencies,
          allTransitiveDependencies:
              SinglelibraryartistFamily._allTransitiveDependencies,
          id: id,
        );

  SinglelibraryartistProvider._internal(
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
    FutureOr<SingleArtistLibraryModel> Function(SinglelibraryartistRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SinglelibraryartistProvider._internal(
        (ref) => create(ref as SinglelibraryartistRef),
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
  AutoDisposeFutureProviderElement<SingleArtistLibraryModel> createElement() {
    return _SinglelibraryartistProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SinglelibraryartistProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SinglelibraryartistRef
    on AutoDisposeFutureProviderRef<SingleArtistLibraryModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SinglelibraryartistProviderElement
    extends AutoDisposeFutureProviderElement<SingleArtistLibraryModel>
    with SinglelibraryartistRef {
  _SinglelibraryartistProviderElement(super.provider);

  @override
  String get id => (origin as SinglelibraryartistProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
