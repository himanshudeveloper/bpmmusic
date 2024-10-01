import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ArtWorkView extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  const ArtWorkView({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    String finalUrl = '';

    if (url!.contains("{w}")) {
      finalUrl = url!
          .replaceAll('{w}', '${width.toInt()}')
          .replaceAll('{h}', '${height.toInt()}');
    } else if (url!.contains("mzstatic.com")) {
      finalUrl = "$url";
    } else {
      finalUrl =
          "https://is1-ssl.mzstatic.com/image/thumb/$url/${width.toInt()}x${height.toInt()}bb.jpg";
    }

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
              borderRadius: BorderRadius.circular(16.0),
              child: FadeInImage(
                height: height,
                width: width,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.memory(kTransparentImage);
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

class ArtWorkView2 extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  const ArtWorkView2({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    String finalUrl = '';

    if (url!.contains("{w}")) {
      finalUrl = url!
          .replaceAll('{w}', '${width.toInt()}')
          .replaceAll('{h}', '${height.toInt()}');
    } else if (url!.contains("mzstatic.com")) {
      finalUrl = "$url";
    } else {
      finalUrl =
          "https://is1-ssl.mzstatic.com/image/thumb/$url/${width.toInt()}x${height.toInt()}bb.jpg";
    }

    return CircleAvatar(
        radius: 42,
        child: url == null
            ? const SizedBox.shrink()
            : CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(finalUrl),
              ));
  }
}
