import 'package:bmp_music/features/bpm/ui/screens/bpm_settings_screen.dart';
import 'package:bmp_music/features/song/notifiers/song_notifier.dart';
import 'package:bmp_music/features/song/ui/components/songs_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/bpm/ui/components/bpm_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Get.to(
                    () => const BPMSettingsScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(milliseconds: 700),
                  );
                },
                child: const BPMCard()),
            SongsList(songs: ref.watch(songnNotifierprovider).songs),
          ],
        ),
      ),
    );
  }
}
