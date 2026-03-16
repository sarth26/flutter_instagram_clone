import 'package:flutter/material.dart';
import 'package:instagram_clone_assignment/models/post_model.dart';
import 'package:instagram_clone_assignment/widgets/post_action.dart';
import 'post_header.dart';
import 'post_image_slider.dart';

class PostCard extends StatelessWidget {

  final PostModel post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// HEADER
        PostHeader(
          username: post.username,
          profileImage: post.profileImage,
        ),

        /// IMAGE SLIDER
        PostImageSlider(
          images: post.images,
        ),

        /// ACTIONS
        PostAction(post: post),

        /// LIKES
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "Liked by aditya_narayan_ and others",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),

        const SizedBox(height: 4),

        /// CAPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${post.username} ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: post.caption,
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 6),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "2 hours ago",
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}