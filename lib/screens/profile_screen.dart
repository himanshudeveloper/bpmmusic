// import 'package:bmp_music/features/auth/services/apple_auth_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:bmp_music/utils/color_utils.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: _buildProfile(),
//           ),
//           _otherSettings(),
//         ],
//       ),
//     );
//   }

//   // Widget _audioItems(List<Item> items) {
//   //   return Padding(
//   //     padding: const EdgeInsets.only(
//   //       top: 16.0,
//   //     ),
//   //     child: SizedBox(
//   //       height: MediaQuery.of(context).size.height * 0.3,
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: [
//   //           const Padding(
//   //             padding: EdgeInsets.only(left: 8.0),
//   //             child: Text(
//   //               "を聞いて",
//   //               style: TextStyle(
//   //                 fontWeight: FontWeight.bold,
//   //                 fontSize: 16,
//   //               ),
//   //             ),
//   //           ),
//   //           Expanded(
//   //             child: ListView.builder(
//   //               scrollDirection: Axis.horizontal,
//   //               physics: const BouncingScrollPhysics(),
//   //               itemCount: items.length,
//   //               itemBuilder: (context, index) {
//   //                 return Padding(
//   //                   padding: const EdgeInsets.all(8.0),
//   //                   child: SizedBox(
//   //                     width: MediaQuery.of(context).size.width * 0.6,
//   //                     child: Column(
//   //                       crossAxisAlignment: CrossAxisAlignment.start,
//   //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //                       children: [
//   //                         ClipRRect(
//   //                           borderRadius: BorderRadius.circular(8.0),
//   //                           child: SizedBox(
//   //                             height: MediaQuery.of(context).size.width * 0.4,
//   //                             child: Image.asset(
//   //                               items[index].image,
//   //                               fit: BoxFit.cover,
//   //                             ),
//   //                           ),
//   //                         ),
//   //                         Text(items[index].title),
//   //                         Text(
//   //                           items[index].artist,
//   //                           style: TextStyle(
//   //                             fontWeight: FontWeight.bold,
//   //                             color: ColorUtils.lightRed,
//   //                             fontSize: 16,
//   //                           ),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _otherSettings() {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: ColorUtils.lightGrey,
//           ),
//         ),
//       ),
//       child: ListTile(
//         onTap: () async {
//           await AppleAuthServices.signOut();
//         },
//         leading: Icon(
//           Icons.logout_rounded,
//           color: ColorUtils.lightRed,
//         ),
//         title: const Text(
//           "ログアウト",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfile() {
//     User? user = FirebaseAuth.instance.currentUser;

//     String photo = user?.photoURL ?? "";
//     String name = user?.displayName ?? "";
//     String email = user?.email ?? "";

//     return Container(
//       color: ColorUtils.lightGrey,
//       child: Text(
//         "ID :  $email",
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: ColorUtils.lightBlack,
//         ),
//       ),
//     );
//   }
// }
