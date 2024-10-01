import 'package:bmp_music/features/auth/screens/apple_auth_screen.dart';
import 'package:bmp_music/features/auth/services/apple_auth_services.dart';
import 'package:bmp_music/features/bpm/services/save_music.dart';
import 'package:bmp_music/features/bpm/services/save_token.dart';
import 'package:bmp_music/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: _buildProfile(),
        ),
        _otherSettings(context),
      ],
    );
  }

  _launchURL(String newurl) async {
    final Uri url = Uri.parse(newurl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $newurl');
    }
  }

  Widget _otherSettings(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: ColorUtils.lightGrey,
          ),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () async {
              await AppleAuthServices.signOut();
              Get.offAll(const AppleAuthScreen());
            },
            leading: Icon(
              Icons.logout_rounded,
              color: ColorUtils.lightRed,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () async {
              User? user = FirebaseAuth.instance.currentUser;
              await AppleAuthServices.showdialog(context, user!.uid);
              saveMusic("");
              saveToken("");
              Fluttertoast.showToast(msg: "Account Deleted Successfully");

              Get.offAll(const AppleAuthScreen());
            },
            leading: Icon(
              Icons.delete_rounded,
              color: ColorUtils.lightRed,
            ),
            title: const Text(
              "Delete Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () async {
              _launchURL(
                  "https://sites.google.com/view/beatchanertermofservice/home");
            },
            leading: Icon(
              Icons.verified_user_rounded,
              color: ColorUtils.lightRed,
            ),
            title: const Text(
              "Terms of Service",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () async {
              _launchURL(
                  "https://sites.google.com/view/beatchangerprivacy/home");
            },
            leading: Icon(
              Icons.privacy_tip_sharp,
              color: ColorUtils.lightRed,
            ),
            title: const Text(
              "Privacy policy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    User? user = FirebaseAuth.instance.currentUser;

    String photo = user?.photoURL ?? "";
    String name = user?.displayName ?? "";
    String email = user?.email ?? "";

    return Container(
      color: ColorUtils.lightGrey,
      child: Text(
        "ID :  $email",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ColorUtils.lightBlack,
        ),
      ),
    );
  }
}
