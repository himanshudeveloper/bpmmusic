import 'package:bmp_music/features/bpm/ui/screens/bpm_settings_screen.dart';
import 'package:bmp_music/features/library/views/widgets/album.dart';
import 'package:bmp_music/features/library/views/widgets/artist.dart';
import 'package:bmp_music/features/library/views/widgets/playlist.dart';
import 'package:bmp_music/features/library/views/widgets/song.dart';
import 'package:bmp_music/features/song/notifiers/song_notifier.dart';
import 'package:bmp_music/features/song/ui/components/player_deck.dart';
import 'package:bmp_music/features/song/ui/components/songs_list_view.dart';
import 'package:bmp_music/shared/ui/components/serch_post.dart';
import 'package:bmp_music/shared/ui/screens/profile_screen.dart';
import 'package:bmp_music/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/bpm/ui/components/bpm_card.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                icon: const Icon(Icons.menu),
              ),
              IconButton(
                onPressed: () async {
                  await showSearch(
                    context: context,
                    delegate: SearchPost(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          //    const SizedBox(height: 10),
          InkWell(
              onTap: () {
                Get.to(
                  () => const BPMSettingsScreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: const BPMCard()),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          index.value = 0;
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: index.value == 0
                                  ? ColorUtils.darkRed
                                  : ColorUtils.lightGrey,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              "Playlist",
                              style: TextStyle(
                                  color: index.value == 0
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16),
                            )),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          index.value = 1;
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: index.value == 1
                                  ? ColorUtils.darkRed
                                  : ColorUtils.lightGrey,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              "Artist",
                              style: TextStyle(
                                  color: index.value == 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          index.value = 2;
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: index.value == 2
                                  ? ColorUtils.darkRed
                                  : ColorUtils.lightGrey,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              "Song",
                              style: TextStyle(
                                  color: index.value == 2
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16),
                            )),
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                )
              ],
            ),
          ),
          IndexedStack(
            index: index.value,
            children: const [
              Playlist(),
              Artist(),
              Song(),
            ],
          )

          //   SongsList(songs: ref.watch(songnNotifierprovider).songs),
        ],
      ),
    );
  }
}
