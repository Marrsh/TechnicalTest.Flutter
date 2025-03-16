part of 'posts_bloc.dart';

@immutable
class PostsState {
  final List<PostModel> posts;

  const PostsState({this.posts = const []});
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  const PostsLoaded({required super.posts});
}

class PostsFailedToLoad extends PostsState {}
