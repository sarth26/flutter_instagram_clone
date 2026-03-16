import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone_assignment/models/post_model.dart';
import 'package:instagram_clone_assignment/providers/post_provider.dart';
import 'package:provider/provider.dart';

class PostAction extends StatelessWidget {

  final PostModel post;

  const PostAction({
    super.key,
    required this.post
  });

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<PostProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [

          /// LIKE
          IconButton(
            iconSize: 26,
            icon: FaIcon(
              post.isLiked
                  ? FontAwesomeIcons.solidHeart
                  : FontAwesomeIcons.heart,
              color: post.isLiked ? Colors.red : Colors.black,
            ),
            onPressed: (){
              provider.toggleLike(post);
            },
          ),

          /// COMMENT
          IconButton(
            iconSize: 24,
            icon: const FaIcon(FontAwesomeIcons.comment),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Now you are commenting on this post"),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 4),
                )
              );
            },
          ),

          /// SHARE
          IconButton(
            iconSize: 24,
            icon: const FaIcon(FontAwesomeIcons.paperPlane),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Now you are sharing this post"),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 4),
                )
              );
            },
          ),

          const Spacer(),

          /// SAVE
          IconButton(
            iconSize: 24,
            icon: FaIcon(
              post.isSaved
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
            ),
            onPressed: (){
              provider.toggleSave(post);
            },
          ),
        ],
      ),
    );
  }
}