import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String username;
  final String profileImage;
  const PostHeader({
    super.key,
    required this.username,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: profileImage,
                width: 36,
                height: 36,
                fit: BoxFit.cover,

                /// LOADING PLACEHOLDER
                placeholder: (context, url) =>
                    Container(color: Colors.grey.shade300),

                /// ERROR IMAGE
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 20),
              ),
            ),
          ),

          const SizedBox(width: 10),

          Text(
            username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),

          const SizedBox(width: 4),

          const Icon(Icons.verified, color: Colors.blue, size: 16),

          const Spacer(),

          const Icon(Icons.more_vert, size: 22),
        ],
      ),
    );
  }
}
