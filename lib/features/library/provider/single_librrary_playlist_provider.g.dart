// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_librrary_playlist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singlelibraryplaylistHash() =>
    r'2760b64be0d514192eac47ec283be7018d37a647';

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

/// See also [singlelibraryplaylist].
@ProviderFor(singlelibraryplaylist)
const singlelibraryplaylistProvider = SinglelibraryplaylistFamily();

/// See also [singlelibraryplaylist].
class SinglelibraryplaylistFamily
    extends Family<AsyncValue<SinglePlaylistLibraryModel>> {
  /// See also [singlelibraryplaylist].
  const SinglelibraryplaylistFamily();

  /// See also [singlelibraryplaylist].
  SinglelibraryplaylistProvider call({
    required String id,
  }) {
    return SinglelibraryplaylistProvider(
      id: id,
    );
  }

  @override
  SinglelibraryplaylistProvider getProviderOverride(
    covariant SinglelibraryplaylistProvider provider,
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
  String? get name => r'singlelibraryplaylistProvider';
}

/// See also [singlelibraryplaylist].
class SinglelibraryplaylistProvider
    extends AutoDisposeFutureProvider<SinglePlaylistLibraryModel> {
  /// See also [singlelibraryplaylist].
  SinglelibraryplaylistProvider({
    required String id,
  }) : this._internal(
          (ref) => singlelibraryplaylist(
            ref as SinglelibraryplaylistRef,
            id: id,
          ),
          from: singlelibraryplaylistProvider,
          name: r'singlelibraryplaylistProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singlelibraryplaylistHash,
          dependencies: SinglelibraryplaylistFamily._dependencies,
          allTransitiveDependencies:
              SinglelibraryplaylistFamily._allTransitiveDependencies,
          id: id,
        );

  SinglelibraryplaylistProvider._internal(
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
    FutureOr<SinglePlaylistLibraryModel> Function(
            SinglelibraryplaylistRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SinglelibraryplaylistProvider._internal(
        (ref) => create(ref as SinglelibraryplaylistRef),
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
  AutoDisposeFutureProviderElement<SinglePlaylistLibraryModel> createElement() {
    return _SinglelibraryplaylistProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SinglelibraryplaylistProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SinglelibraryplaylistRef
    on AutoDisposeFutureProviderRef<SinglePlaylistLibraryModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SinglelibraryplaylistProviderElement
    extends AutoDisposeFutureProviderElement<SinglePlaylistLibraryModel>
    with SinglelibraryplaylistRef {
  _SinglelibraryplaylistProviderElement(super.provider);

  @override
  String get id => (origin as SinglelibraryplaylistProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
