import 'package:bmp_music/features/song/providers/search_music_provider.dart';
import 'package:bmp_music/features/song/ui/components/album_list_view.dart';
import 'package:bmp_music/features/song/ui/components/artists_list_view.dart';
import 'package:bmp_music/features/song/ui/components/songs_list_view.dart';
import 'package:bmp_music/features/song/ui/components/top_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});
  final List<Widget> list = const [
    Tab(text: "Top Results"),
    Tab(text: "Artists"),
    Tab(text: "Albums"),
    Tab(text: "Song"),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final songNotifier = ref.watch(songnNotifierprovider);
    // bool loading = songNotifier.loading;
    final searchmusic = ref.watch(searchMusicProvider);
    final controller = useTextEditingController();
    final tabcontroller = useTabController(initialLength: 4);
    final loading = useState(false);
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: TextField(
            controller: controller,
            autofocus: false,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
            ),
            onSubmitted: (value) async {
              loading.value = true;
              await ref.read(searchMusicProvider.notifier).search(value);
              loading.value = false;

              //  songNotifier.serachSong(value);
            },
            onChanged: (value) {
              // Clear the result list and perform a new search when the input changes
              //  setState(() {});
            },
          ),
          actions: [
            // Display a close button if the search input is not empty
            if (controller.text.trim().isNotEmpty)
              IconButton(
                onPressed: () {
                  // Clear the search input and result list
                  //  setState(() {
                  controller.clear();
                  // });
                },
                icon: const Icon(Icons.close),
              ),
          ],
        ),
        body: searchmusic.when(
            data: (data) {
              return loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : data.results == null
                      ? const SizedBox()
                      : Column(
                          children: [
                            // if (loading) CircularProgressIndicator(),
                            TabBar(
                                tabAlignment: TabAlignment.start,
                                indicatorSize: TabBarIndicatorSize.label,
                                padding: const EdgeInsets.all(0),
                                isScrollable: true,
                                unselectedLabelStyle:
                                    const TextStyle(color: Colors.black),
                                controller: tabcontroller,
                                tabs: list),
                            Expanded(
                              child: TabBarView(
                                  controller: tabcontroller,
                                  children: [
                                    TopResultView(
                                        topresults: data.results!.topResults ==
                                                null
                                            ? []
                                            : data.results!.topResults!.data!),
                                    ArtistsListView(
                                        artists: data.results!.artists == null
                                            ? []
                                            : data.results!.artists!.data!),
                                    AlbumListView(
                                        albums: data.results!.albums == null
                                            ? []
                                            : data.results!.albums!.data!),
                                    SongsList(
                                        songs: data.results!.songs == null
                                            ? []
                                            : data.results!.songs!.data!)
                                  ]),
                            ),
                          ],
                        );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
