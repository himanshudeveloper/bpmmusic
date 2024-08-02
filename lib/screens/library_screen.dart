import 'package:bmp_music/features/library/views/widgets/album.dart';
import 'package:bmp_music/features/library/views/widgets/artist.dart';
import 'package:bmp_music/features/library/views/widgets/playlist.dart';
import 'package:bmp_music/features/library/views/widgets/song.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  // final List<CategoryModel> _categories = [
  //   CategoryModel(
  //     title: "アルバム",
  //     icon: Icons.album_rounded,
  //   ),
  //   CategoryModel(
  //     title: "プレイリスト",
  //     icon: Icons.playlist_play_rounded,
  //   ),
  //   CategoryModel(
  //     title: "お気に入り",
  //     icon: Icons.favorite_rounded,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Playlist();
                }));
              },
              leading: Icon(
                Icons.queue_music_sharp,
                size: 30,
              ),
              title: Text(
                "playlists",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Album();
                }));
              },
              leading: Icon(
                Icons.copy,
                size: 30,
              ),
              title: Text(
                "Album",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Artist();
                }));
              },
              leading: Icon(
                Icons.my_library_music_rounded,
                size: 30,
              ),
              title: Text(
                "Artists",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Song();
                }));
              },
              leading: Icon(
                Icons.music_note,
                size: 30,
              ),
              title: Text(
                "Songs",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   // body: Column(
    //   //   children: [
    //   //     _buildCategories(),
    //   //     Flexible(
    //   //       child: activeCategory == "曲"
    //   //           ? const SongsCategoryItems()
    //   //           : activeCategory == "アルバム"
    //   //               ? const AlbumsCategoryItems()
    //   //               : activeCategory == "プレイリスト"
    //   //                   ? const PlaylistsCategoryItems()
    //   //                   : const FavoriteCategoryItems(),
    //   //     ),
    //   //   ],
    //   // ),
    // );
  }

  Widget _buildAlbums() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("アルバム"),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.3,
        //   width: double.infinity,
        //   child: const AlbumsListView(),
        // ),
      ],
    );
  }
}
