class PostModel {
  final String username;
  final String profileImage;
  final List<String> images;
  final String caption;

  bool isLiked;
  bool isSaved;

  PostModel({
    required this.username,
    required this.profileImage,
    required this.images,
    required this.caption,
    this.isLiked = false,
    this.isSaved = false,
  });
}