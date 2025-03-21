part of 'posts_bloc.dart';

@immutable
class PostsState {
  final List<PostModel>? posts;
  final PostModel? activePost;
  final List<CommentModel>? comments;
  final List<PostModel>? savedPosts;

  const PostsState(
      {this.activePost, this.posts, this.comments, this.savedPosts});
}

class PostsInitial extends PostsState {}

/// Posts

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  const PostsLoaded({required super.posts});
}

class PostsFailedToLoad extends PostsState {}

// Active Post
class ActivePostLoaded extends PostsState {
  const ActivePostLoaded({required super.activePost, super.posts});
}

class ActivePostFailedToLoad extends PostsState {
  const ActivePostFailedToLoad({super.posts});
}

class ActivePostLoading extends PostsState {
  const ActivePostLoading({super.posts, super.activePost});
}

// Active Post Comments
class ActivePostCommentsLoaded extends PostsState {
  const ActivePostCommentsLoaded(
      {required super.comments, super.activePost, super.posts});
}

class ActivePostCommentsFailedToLoad extends PostsState {
  const ActivePostCommentsFailedToLoad({super.posts, super.activePost});
}

class ActivePostCommentsLoading extends PostsState {
  const ActivePostCommentsLoading({super.posts, super.activePost});
}

// Saved posts
class SavedPostsLoaded extends PostsState {
  const SavedPostsLoaded(
      {required super.savedPosts, super.activePost, super.posts});
}
