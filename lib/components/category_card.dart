import 'package:bmp_music/notifiers/category_notifier.dart';
import 'package:bmp_music/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryCard extends ConsumerWidget {
  final String title;
  final IconData icon;
  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isActive = ref.watch(categoryNotifierprovider).activeCategory == title;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            ref.read(categoryNotifierprovider).updateCategory(title);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isActive ? ColorUtils.lightRed : ColorUtils.lightGrey,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isActive ? Colors.white : null,
                    ),
                  ),
                  Icon(
                    icon,
                    color: isActive ? Colors.white : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
