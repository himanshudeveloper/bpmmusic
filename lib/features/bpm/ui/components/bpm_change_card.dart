import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../notifiers/bpm_notifier.dart';
import '../../../../utils/color_utils.dart';

class BPMChangeCard extends ConsumerWidget {
  const BPMChangeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bmp = ref.watch(bmpNotifierprovider);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorUtils.lightGrey,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  "BPMs",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.lightBlack,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                bmp.value.toString(),
                style: const TextStyle(
                  fontSize: 96,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Slider(
                  min: 0.0,
                  max: 2.0,
                  thumbColor: ColorUtils.darkRed,
                  activeColor: ColorUtils.lightRed,
                  value: (bmp).value / 100,
                  onChanged: (c) {
                    ref
                        .read(bmpNotifierprovider)
                        .updateValue((c * 100).toInt());
                    ref.read(selectedMusicProvider.notifier).setplackrate(c);
                    print("jjjdjdjj$c");

                    //double speed = c;
                    //ref.read(bmpNotifierprovider).songHandler.setSpeed(speed);
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Text(
              //   "only ui",
              //   style: TextStyle(
              //     fontSize: 12,
              //     fontWeight: FontWeight.bold,
              //     color: ColorUtils.lightBlack,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 4.0),
              //   child: Slider(
              //     min: 0.0,
              //     max: 2.0,
              //     thumbColor: ColorUtils.darkRed,
              //     activeColor: ColorUtils.lightRed,
              //     value: (bmp).value / 100,
              //     onChanged: (c) {
              //       ref
              //           .read(bmpNotifierprovider)
              //           .updateValue((c * 100).toInt());
              //       // ref.read(selectedMusicProvider.notifier).setplackrate(c);
              //       print("jjjdjdjj$c");

              //       //double speed = c;
              //       //ref.read(bmpNotifierprovider).songHandler.setSpeed(speed);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
