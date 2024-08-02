import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ArtistArtworkView extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  const ArtistArtworkView({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    String finalUrl = url!
        .replaceAll('{w}', '${width.toInt()}')
        .replaceAll('{h}', '${height.toInt()}');

    print("Filnalurlfffff   $finalUrl");
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
      ),
      child: url == null
          ? const SizedBox.shrink()
          : ClipRRect(
              borderRadius: BorderRadius.circular(26.0),
              child: FadeInImage(
                height: height,
                width: width,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.memory(kTransparentImage);

                  // MemoryImage(kTransparentImage);
                },
                image: NetworkImage(finalUrl),
                placeholder: MemoryImage(kTransparentImage),
                fadeInDuration: const Duration(milliseconds: 700),
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
