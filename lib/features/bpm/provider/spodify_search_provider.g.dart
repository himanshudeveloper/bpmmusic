// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spodify_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchSpodifyMusicHash() =>
    r'8112f074b164ed20381faa7a3d3e0b2d6ed11c74';

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

abstract class _$SearchSpodifyMusic
    extends BuildlessAutoDisposeAsyncNotifier<SpodifySearchModel> {
  late final String text;

  FutureOr<SpodifySearchModel> build(
    String text,
  );
}

/// See also [SearchSpodifyMusic].
@ProviderFor(SearchSpodifyMusic)
const searchSpodifyMusicProvider = SearchSpodifyMusicFamily();

/// See also [SearchSpodifyMusic].
class SearchSpodifyMusicFamily extends Family<AsyncValue<SpodifySearchModel>> {
  /// See also [SearchSpodifyMusic].
  const SearchSpodifyMusicFamily();

  /// See also [SearchSpodifyMusic].
  SearchSpodifyMusicProvider call(
    String text,
  ) {
    return SearchSpodifyMusicProvider(
      text,
    );
  }

  @override
  SearchSpodifyMusicProvider getProviderOverride(
    covariant SearchSpodifyMusicProvider provider,
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
  String? get name => r'searchSpodifyMusicProvider';
}

/// See also [SearchSpodifyMusic].
class SearchSpodifyMusicProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SearchSpodifyMusic, SpodifySearchModel> {
  /// See also [SearchSpodifyMusic].
  SearchSpodifyMusicProvider(
    String text,
  ) : this._internal(
          () => SearchSpodifyMusic()..text = text,
          from: searchSpodifyMusicProvider,
          name: r'searchSpodifyMusicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchSpodifyMusicHash,
          dependencies: SearchSpodifyMusicFamily._dependencies,
          allTransitiveDependencies:
              SearchSpodifyMusicFamily._allTransitiveDependencies,
          text: text,
        );

  SearchSpodifyMusicProvider._internal(
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
  FutureOr<SpodifySearchModel> runNotifierBuild(
    covariant SearchSpodifyMusic notifier,
  ) {
    return notifier.build(
      text,
    );
  }

  @override
  Override overrideWith(SearchSpodifyMusic Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchSpodifyMusicProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<SearchSpodifyMusic,
      SpodifySearchModel> createElement() {
    return _SearchSpodifyMusicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchSpodifyMusicProvider && other.text == text;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchSpodifyMusicRef
    on AutoDisposeAsyncNotifierProviderRef<SpodifySearchModel> {
  /// The parameter `text` of this provider.
  String get text;
}

class _SearchSpodifyMusicProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SearchSpodifyMusic,
        SpodifySearchModel> with SearchSpodifyMusicRef {
  _SearchSpodifyMusicProviderElement(super.provider);

  @override
  String get text => (origin as SearchSpodifyMusicProvider).text;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
