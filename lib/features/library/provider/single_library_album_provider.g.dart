// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_library_album_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singlelibraryalbumHash() =>
    r'd30ffae356e79e9a51791fbd2a0144a16b37f861';

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
class SinglelibraryalbumFamily extends Family<AsyncValue<LibrarySongModel>> {
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
    extends AutoDisposeFutureProvider<LibrarySongModel> {
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
    FutureOr<LibrarySongModel> Function(SinglelibraryalbumRef provider) create,
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
  AutoDisposeFutureProviderElement<LibrarySongModel> createElement() {
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

mixin SinglelibraryalbumRef on AutoDisposeFutureProviderRef<LibrarySongModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SinglelibraryalbumProviderElement
    extends AutoDisposeFutureProviderElement<LibrarySongModel>
    with SinglelibraryalbumRef {
  _SinglelibraryalbumProviderElement(super.provider);

  @override
  String get id => (origin as SinglelibraryalbumProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
