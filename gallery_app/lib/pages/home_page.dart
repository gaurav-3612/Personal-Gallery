import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/gallery/album_page.dart';
import 'package:gallery_app/main.dart';
import 'package:gallery_app/pages/login_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    if (Platform.isIOS) {
      if (await Permission.photos.request().isGranted ||
          await Permission.storage.request().isGranted) {
        loadAllAlbum();
      }
    } else if (Platform.isAndroid) {
      if (await Permission.photos.request().isGranted ||
          await Permission.storage.request().isGranted &&
              await Permission.videos.request().isGranted) {
        loadAllAlbum();
      }
    }
  }

  List<Album> album = [];
  loadAllAlbum() async {
    album = await PhotoGallery.listAlbums();

    album.forEach((element) {
      print(element.name);
    });

    setState(() {
      album;
    });
  }

  Future<void> signUserOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(
            onTap: () {},
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: const Text(
          "Gallery",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: signUserOut,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: mq.width * .04,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .75,
          ),
          itemBuilder: (BuildContext context, int index) {
            Album albumName = album[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AlbumPage(album: albumName),
                  ),
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: mq.width * .3,
                        height: mq.width * .3,
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: AlbumThumbnailProvider(
                            album: albumName,
                            highQuality: true,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        albumName.name.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Count: ${albumName.count.toString()}",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: album.length,
        ),
      ),
    );
  }
}
