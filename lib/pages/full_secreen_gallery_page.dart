import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullscreenGalleryPage extends StatefulWidget {

  final List<dynamic> images;
  final int initialIndex;

  const FullscreenGalleryPage({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<FullscreenGalleryPage> createState() =>
      _FullscreenGalleryPageState();
}

class _FullscreenGalleryPageState
    extends State<FullscreenGalleryPage> {

  late PageController pageController;

  late int currentIndex;

  @override
  void initState() {

    super.initState();

    currentIndex = widget.initialIndex;

    pageController = PageController(
      initialPage: widget.initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      body: Stack(
        children: [

          PhotoViewGallery.builder(

            pageController: pageController,

            itemCount: widget.images.length,

            onPageChanged: (index) {

              setState(() {
                currentIndex = index;
              });
            },

            builder: (context, index) {

              return PhotoViewGalleryPageOptions(

                imageProvider:
                    NetworkImage(widget.images[index]),

                minScale: 0.8,

                maxScale:3.0,
              );
            },
          ),

          // TOP BAR
          Positioned(
            top: 50,
            left: 20,
            right: 20,

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                GestureDetector(

                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Container(

                    padding:
                        const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color:
                          Colors.black.withOpacity(
                        0.4,
                      ),

                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),

                Container(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color:
                        Colors.black.withOpacity(
                      0.4,
                    ),

                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Text(
                    "${currentIndex + 1} / ${widget.images.length}",

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}