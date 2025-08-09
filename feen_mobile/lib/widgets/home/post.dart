import 'package:flutter/material.dart';
import 'package:flutter_image_carousel_slider/flutter_image_slider.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final List<String> imageList = [
    'https://picsum.photos/id/237/200/300',
    'https://picsum.photos/seed/picsum/200/300',
    'https://picsum.photos/200/300?grayscale',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Missing person's carousel pictures
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ImageListView(imageList: imageList);
                  },
                ),
              );
            },
            child: ImageCarouselSlider(
              items: imageList,
              imageHeight: 300,
              dotColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
