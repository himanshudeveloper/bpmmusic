import 'package:bmp_music/features/song/ui/components/player_deck.dart';
import 'package:bmp_music/shared/ui/screens/home_screen.dart';
import 'package:bmp_music/screens/library_screen.dart';
import 'package:bmp_music/screens/profile_screen.dart';
import 'package:bmp_music/screens/search_screen.dart';
import 'package:bmp_music/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatefulHookConsumerWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final int _selectedIndex = 0;

  final controller = PersistentTabController();

  final List<CustomNavBarScreen> _screens = const [
    CustomNavBarScreen(screen: HomeScreen()),
    CustomNavBarScreen(screen: LibraryScreen()),
    CustomNavBarScreen(screen: SearchScreen()),
    CustomNavBarScreen(screen: ProfileScreen()),
  ];

  @override
  void initState() {
    // Future.delayed(
    //   const Duration(milliseconds: 100),
    //   () {
    //     // Provider.of<SongNotifier>(context, listen: false).loadSongs();
    //     // Provider.of<AlbumNotifier>(context, listen: false).loadAlbums();
    //   },
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: ColorUtils.systemNavigationBarColor(context),
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text("音楽ペースメーカー"),
        ),
        body: PersistentTabView.custom(
          context,
          customWidget: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                const SizedBox(height: 100, child: PlayerDeck()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          controller.jumpToTab(0);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.home_outlined,
                            ),
                            Text(
                              "Home",
                            ),
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          controller.jumpToTab(1);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.library_music_outlined,
                            ),
                            Text(
                              "Library",
                            ),
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          controller.jumpToTab(2);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.search_rounded,
                            ),
                            Text(
                              "Search",
                            ),
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          controller.jumpToTab(3);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                            ),
                            Text(
                              "Me",
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          screens: _screens,
          controller: controller,
          itemCount: 4,
          // screens: _buildScreens(),
          // items: _navBarsItems(),
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
          stateManagement: false, // Default is true.
          hideNavigationBarWhenKeyboardAppears: true,

          // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
          //  padding: const EdgeInsets.only(top: 8),
          backgroundColor: Colors.grey.shade900,
          isVisible: true,

          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              // Navigation Bar's items animation properties.
              //  duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              // Screen transition animation on change of selected tab.
              // animateTabTransition: true,
              // duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: 150.toDouble(),
          // navBarStyle:
          //     NavBarStyle.style7 , // Choose the nav bar style with this property

          // Column(
          //   children: [
          //     Expanded(
          //       child: IndexedStack(
          //         index: _selectedIndex,
          //         children: const [
          //           HomeScreen(),
          //           LibraryScreen(),
          //           SearchScreen(),
          //           ProfileScreen(),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(height: 100, child: PlayerDeck()),
          //   ],
        ),
        // bottomNavigationBar: NavigationBar(
        //   selectedIndex: _selectedIndex,
        //   onDestinationSelected: (value) => setState(() {
        //     _selectedIndex = value;
        //   }),
        //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        //   destinations: const [],
        // ),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const LibraryScreen(),
      const SearchScreen(),
      const ProfileScreen(),
    ];
  }
}
