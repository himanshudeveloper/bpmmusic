import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router_controller.g.dart';

@Riverpod(keepAlive: true)
class RouterController extends _$RouterController {
  @override
  String build() {
    return '';
  }

  void change(String value) {
    state = value;
  }

  // Add methods to mutate the state
}
