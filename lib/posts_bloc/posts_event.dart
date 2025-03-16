part of 'posts_bloc.dart';

@immutable
class PostsEvent {}

class PostsRequested extends PostsEvent {}

class ActivePostRequested extends PostsEvent {
  final int postId;

  ActivePostRequested({required this.postId});
}

class ActivePostCommentsRequested extends PostsEvent {
  final int postId;

  ActivePostCommentsRequested({required this.postId});
}
