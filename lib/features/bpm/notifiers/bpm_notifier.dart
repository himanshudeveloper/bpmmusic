import 'package:bmp_music/features/bpm/services/bpm_check.dart';
import 'package:bmp_music/features/bpm/services/read_bpm.dart';
import 'package:bmp_music/features/bpm/services/save_bpm.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bmpNotifierprovider = ChangeNotifierProvider((ref) => BPMNotifier());

class BPMNotifier extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  int sfbpm = 0;
  int get sfvalue => sfbpm;
  bool _checked = true;

  bool get checked => _checked;

  Future<void> init() async {
    _checked = await readCheck() ?? false;
    _value = await readBPM() ?? 70;
    notifyListeners();
  }

  Future<void> updateValue(int newValue) async {
    _value = newValue;
    await saveBPM(newValue);
    notifyListeners();
  }

  Future<void> updateSpValue(int newValue) async {
    sfbpm = newValue;
    // await saveBPM(newValue);
    notifyListeners();
  }

  void updateChecked() {
    _checked = !_checked;
    saveCheck(_checked);
    notifyListeners();
  }
}
