import 'package:bmp_music/features/bpm/services/read_token.dart';
import 'package:bmp_music/features/bpm/services/save_music.dart';
import 'package:bmp_music/features/bpm/services/save_token.dart';
import 'package:bmp_music/features/song/providers/selected_music_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'token_provider.g.dart';

@riverpod
class TokenProvider extends _$TokenProvider {
  @override
  Future<String> build() {
    return readtoken();
  }

  checktoken(String id, String email) async {
    String token = await ref.read(selectedMusicProvider.notifier).devtoken();
    String musictoken =
        await ref.read(selectedMusicProvider.notifier).usertoken(token);

    if (musictoken.isEmpty) {
      Fluttertoast.showToast(msg: "not mtoken");
    }
    saveToken(token);
    saveMusic(musictoken);
    print("tokenuser: $token");

    final userDocRef = FirebaseFirestore.instance.collection("users").doc(id);
    // Check if the user document exists
    final userDocSnapshot = await userDocRef.get();

    // if (userDocSnapshot.exists == false) {
    // User doesn't exist, create new document
    await userDocRef.set(
      {
        'id': id,
        'email': email,
        'musicUserToken': musictoken,
        "devtoken": token,
        'expirationTime': null,
      },
    ).then((value) {
      print("saved tokenenenn");
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return const HomeScreen();
      //     },
      //   ),
      // );
    });
    // }
  }
}
