import 'package:flutter/material.dart';
import 'package:instagram_clone_assignment/models/post_model.dart';
import 'package:instagram_clone_assignment/services/post_repository.dart';

class PostProvider extends ChangeNotifier {

  final PostRepository repository = PostRepository();

  List<PostModel> posts = [];

  bool isLoading = true;
  bool isLoadingMore = false;

  int currentPage = 1;

  Future<void> loadPosts() async {

    isLoading = true;
    notifyListeners();

    posts = await repository.fetchPosts(currentPage);

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMorePosts() async {

    if(isLoadingMore) return;

    isLoadingMore = true;
    notifyListeners();

    currentPage++;

    final newposts = await repository.fetchPosts(currentPage);

    posts.addAll(newposts);

    isLoadingMore = false;
    notifyListeners();
  }

  void toggleLike(PostModel post){
    post.isLiked = !post.isLiked;
    notifyListeners();
  }

  void toggleSave(PostModel post){
    post.isSaved = !post.isSaved;
    notifyListeners();
  }

}