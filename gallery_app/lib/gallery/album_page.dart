import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/view_page.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class AlbumPage extends StatefulWidget {
  final Album album;

  const AlbumPage({super.key, required this.album});
  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    super.initState();

    loadMediaFiles();
  }

  List<Medium> mediaList = [];

  loadMediaFiles() async {
    MediaPage mediaPage = await this.widget.album.listMedia();

    mediaList = mediaPage.items;

    setState(() {
      mediaList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.pink.shade100,
        title: Text(
          this.widget.album.name.toString(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: mq.width * .04),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            Medium medium = mediaList[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ViewPage(medium);
                }));
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: mq.width * .3,
                      height: mq.width * .3,
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: ThumbnailProvider(
                          mediumId: medium.id,
                          mediumType: medium.mediumType,
                          highQuality: true,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: mediaList.length,
        ),
      ),
    );
  }
}
