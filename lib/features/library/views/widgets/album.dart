import 'package:bmp_music/features/library/provider/library_album_provider.dart';
import 'package:bmp_music/features/library/views/page/single_album_page.dart';
import 'package:bmp_music/shared/ui/components/artwork_view.dart';
import 'package:bmp_music/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Album extends ConsumerWidget {
  const Album({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albums = ref.watch(libraryalbumProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text("Library"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Albums",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: albums.when(
                data: (data) {
                  return GridView.builder(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.9,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SingleAlbumPage(
                                  id: data.data![index].id.toString());
                            }));
                          },
                          child: Column(
                            children: [
                              ArtWorkView(
                                  url: data
                                      .data![index].attributes!.artwork!.url
                                      .toString(),
                                  height: 160,
                                  width: 160),
                              Text(
                                Utils.stringwithdot(
                                    data.data![index].attributes!.name
                                        .toString(),
                                    20),
                              ),
                              Text(
                                Utils.stringwithdot(
                                    data.data![index].attributes!.artistName
                                        .toString(),
                                    20),
                              ),
                            ],
                          ),
                        );
                      });
                },
                error: (err, _) => Text(err.toString()),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )),
          )
        ],
      ),
    );
  }
}
