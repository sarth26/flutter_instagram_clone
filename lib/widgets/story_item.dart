import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String username;
final String imageUrl;

const StoryItem({
  super.key,
  required this.username,
  required this.imageUrl,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          /// SAME SIZE AS YOUR STORY
          Container(
            padding: const EdgeInsets.all(3),
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xfffeda75),
                  Color(0xfffa7e1e),
                  Color(0xffd62976),
                  Color(0xff962fbf),
                  Color(0xff4f5bd5),
                ],
              ),
            ),

            /// INNER WHITE BORDER
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),

              /// IMAGE
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,

                  placeholder: (context, url) =>
                      Container(color: Colors.grey.shade300),

                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),

          const SizedBox(height: 4),

          SizedBox(
            width: 70,
            child: Text(
              username,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
