// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_song_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$librarysongHash() => r'621c917cdf7297b3e88894b43a16937c107ced57';

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

/// See also [librarysong].
@ProviderFor(librarysong)
const librarysongProvider = LibrarysongFamily();

/// See also [librarysong].
class LibrarysongFamily extends Family<AsyncValue<LibrarySongModel>> {
  /// See also [librarysong].
  const LibrarysongFamily();

  /// See also [librarysong].
  LibrarysongProvider call({
    required String index,
  }) {
    return LibrarysongProvider(
      index: index,
    );
  }

  @override
  LibrarysongProvider getProviderOverride(
    covariant LibrarysongProvider provider,
  ) {
    return call(
      index: provider.index,
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
  String? get name => r'librarysongProvider';
}

/// See also [librarysong].
class LibrarysongProvider extends AutoDisposeFutureProvider<LibrarySongModel> {
  /// See also [librarysong].
  LibrarysongProvider({
    required String index,
  }) : this._internal(
          (ref) => librarysong(
            ref as LibrarysongRef,
            index: index,
          ),
          from: librarysongProvider,
          name: r'librarysongProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$librarysongHash,
          dependencies: LibrarysongFamily._dependencies,
          allTransitiveDependencies:
              LibrarysongFamily._allTransitiveDependencies,
          index: index,
        );

  LibrarysongProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final String index;

  @override
  Override overrideWith(
    FutureOr<LibrarySongModel> Function(LibrarysongRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LibrarysongProvider._internal(
        (ref) => create(ref as LibrarysongRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LibrarySongModel> createElement() {
    return _LibrarysongProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LibrarysongProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LibrarysongRef on AutoDisposeFutureProviderRef<LibrarySongModel> {
  /// The parameter `index` of this provider.
  String get index;
}

class _LibrarysongProviderElement
    extends AutoDisposeFutureProviderElement<LibrarySongModel>
    with LibrarysongRef {
  _LibrarysongProviderElement(super.provider);

  @override
  String get index => (origin as LibrarysongProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
