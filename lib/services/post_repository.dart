import 'package:instagram_clone_assignment/models/post_model.dart';
import 'package:instagram_clone_assignment/utils/dummy_data.dart';

class PostRepository {

Future<List<PostModel>> fetchPosts(int page) async {

  await Future.delayed(
    const Duration(seconds: 2),
  );

  const int limit = 5;

  final int startIndex = (page - 1) * limit;
  final int endIndex = startIndex + limit;

  if(startIndex >= dummyPosts.length){
    return [];
  }

  final paginatedPosts = dummyPosts.sublist(
    startIndex,
    endIndex > dummyPosts.length ? dummyPosts.length : endIndex,
  );

  return paginatedPosts.map((post){
    return PostModel(
      username: post.username,
      profileImage: post.profileImage,
      images: post.images,
      caption: post.caption,
    );
  }).toList();
}

}