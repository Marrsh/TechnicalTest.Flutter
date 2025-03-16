part of 'posts_bloc.dart';

@immutable
class PostsState {
  final List<PostModel>? posts;
  final PostModel? activePost;

  const PostsState({this.activePost, this.posts});
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
  const ActivePostLoading({super.posts});
}
