import 'package:bmp_music/features/bpm/ui/components/bpm_change_card.dart';
import 'package:bmp_music/features/bpm/notifiers/bpm_notifier.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/color_utils.dart';

class BPMSettingsScreen extends ConsumerStatefulWidget {
  const BPMSettingsScreen({super.key});

  @override
  ConsumerState<BPMSettingsScreen> createState() => _BPMSettingsScreenState();
}

class _BPMSettingsScreenState extends ConsumerState<BPMSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final bmp = ref.watch(bmpNotifierprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("BPMの変更"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const BPMChangeCard(),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                Text(
                  "消費カロリー",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.lightBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorUtils.lightGrey,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 32.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            (bmp.value * 5).toString(),
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "kcal/時間",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: ColorUtils.lightBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  checkColor: Colors.white,
                  activeColor: ColorUtils.lightRed,
                  value: bmp.checked,
                  onChanged: (c) {
                    if (c == false) {
                      ref.read(bmpNotifierprovider).updateValue((100).toInt());
                      ref
                          .read(selectedMusicProvider.notifier)
                          .setplackrate(1.0);
                    }
                    ref.read(bmpNotifierprovider).updateChecked();
                  },
                ),
                Text(
                  "上記BPM値を再生時に反映する",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorUtils.lightBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
