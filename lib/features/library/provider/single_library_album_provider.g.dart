// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_library_album_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singlelibraryalbumHash() =>
    r'7f71258eb1b37d2c658da32fac597eb6fa00d92a';

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

/// See also [singlelibraryalbum].
@ProviderFor(singlelibraryalbum)
const singlelibraryalbumProvider = SinglelibraryalbumFamily();

/// See also [singlelibraryalbum].
class SinglelibraryalbumFamily
    extends Family<AsyncValue<SingleAlbumtLibraryModel>> {
  /// See also [singlelibraryalbum].
  const SinglelibraryalbumFamily();

  /// See also [singlelibraryalbum].
  SinglelibraryalbumProvider call({
    required String id,
  }) {
    return SinglelibraryalbumProvider(
      id: id,
    );
  }

  @override
  SinglelibraryalbumProvider getProviderOverride(
    covariant SinglelibraryalbumProvider provider,
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
  String? get name => r'singlelibraryalbumProvider';
}

/// See also [singlelibraryalbum].
class SinglelibraryalbumProvider
    extends AutoDisposeFutureProvider<SingleAlbumtLibraryModel> {
  /// See also [singlelibraryalbum].
  SinglelibraryalbumProvider({
    required String id,
  }) : this._internal(
          (ref) => singlelibraryalbum(
            ref as SinglelibraryalbumRef,
            id: id,
          ),
          from: singlelibraryalbumProvider,
          name: r'singlelibraryalbumProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singlelibraryalbumHash,
          dependencies: SinglelibraryalbumFamily._dependencies,
          allTransitiveDependencies:
              SinglelibraryalbumFamily._allTransitiveDependencies,
          id: id,
        );

  SinglelibraryalbumProvider._internal(
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
    FutureOr<SingleAlbumtLibraryModel> Function(SinglelibraryalbumRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SinglelibraryalbumProvider._internal(
        (ref) => create(ref as SinglelibraryalbumRef),
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
  AutoDisposeFutureProviderElement<SingleAlbumtLibraryModel> createElement() {
    return _SinglelibraryalbumProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SinglelibraryalbumProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SinglelibraryalbumRef
    on AutoDisposeFutureProviderRef<SingleAlbumtLibraryModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SinglelibraryalbumProviderElement
    extends AutoDisposeFutureProviderElement<SingleAlbumtLibraryModel>
    with SinglelibraryalbumRef {
  _SinglelibraryalbumProviderElement(super.provider);

  @override
  String get id => (origin as SinglelibraryalbumProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
