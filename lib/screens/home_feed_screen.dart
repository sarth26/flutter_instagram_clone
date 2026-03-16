import 'package:flutter/material.dart';
import 'package:instagram_clone_assignment/widgets/post_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone_assignment/providers/post_provider.dart';
import 'package:instagram_clone_assignment/widgets/instagram_header.dart';
import 'package:instagram_clone_assignment/widgets/post_card.dart';
import 'package:instagram_clone_assignment/widgets/story_list.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {

  if (!scrollController.hasClients) return;

  final maxScroll = scrollController.position.maxScrollExtent;
  final currentScroll = scrollController.position.pixels;

  if (currentScroll >= maxScroll * 0.9) {
    Provider.of<PostProvider>(context, listen: false).loadMorePosts();
  }

});
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          /// INSTAGRAM HEADER
          const SliverToBoxAdapter(child: InstagramHeader()),

          /// STORIES
          const SliverToBoxAdapter(child: StoryList()),

          /// DIVIDER
          const SliverToBoxAdapter(child: Divider(height: 1)),

          /// POSTS
          postProvider.isLoading
              ? SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return const PostShimmer();
                  }, childCount: 3),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final post = postProvider.posts[index];

                    return PostCard(post: post);
                  }, childCount: postProvider.posts.length),
                ),

          // if (postProvider.isLoadingMore)
          //   const SliverToBoxAdapter(
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(vertical: 20),
          //       child: Center(child: CircularProgressIndicator()),
          //     ),
          //   ),

          if (postProvider.isLoadingMore)
  SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    ),
  ),
        ],
      ),
    );
  }
}
