// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_music_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMusicHash() => r'15b911edf86dc849ba9d3013072aeaebb2c30a4d';

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

abstract class _$SearchMusic
    extends BuildlessAutoDisposeAsyncNotifier<SearchSongResponse> {
  late final String text;

  FutureOr<SearchSongResponse> build(
    String text,
  );
}

/// See also [SearchMusic].
@ProviderFor(SearchMusic)
const searchMusicProvider = SearchMusicFamily();

/// See also [SearchMusic].
class SearchMusicFamily extends Family<AsyncValue<SearchSongResponse>> {
  /// See also [SearchMusic].
  const SearchMusicFamily();

  /// See also [SearchMusic].
  SearchMusicProvider call(
    String text,
  ) {
    return SearchMusicProvider(
      text,
    );
  }

  @override
  SearchMusicProvider getProviderOverride(
    covariant SearchMusicProvider provider,
  ) {
    return call(
      provider.text,
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
  String? get name => r'searchMusicProvider';
}

/// See also [SearchMusic].
class SearchMusicProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchMusic, SearchSongResponse> {
  /// See also [SearchMusic].
  SearchMusicProvider(
    String text,
  ) : this._internal(
          () => SearchMusic()..text = text,
          from: searchMusicProvider,
          name: r'searchMusicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchMusicHash,
          dependencies: SearchMusicFamily._dependencies,
          allTransitiveDependencies:
              SearchMusicFamily._allTransitiveDependencies,
          text: text,
        );

  SearchMusicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
  }) : super.internal();

  final String text;

  @override
  FutureOr<SearchSongResponse> runNotifierBuild(
    covariant SearchMusic notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(SearchMusic Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchMusicProvider._internal(
        () => create()..text = text,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SearchMusic, SearchSongResponse>
      createElement() {
    return _SearchMusicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMusicProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchMusicRef
    on AutoDisposeAsyncNotifierProviderRef<SearchSongResponse> {
  /// The parameter `text` of this provider.
  String get text;
}

class _SearchMusicProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchMusic,
        SearchSongResponse> with SearchMusicRef {
  _SearchMusicProviderElement(super.provider);

  @override
  String get text => (origin as SearchMusicProvider).text;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
