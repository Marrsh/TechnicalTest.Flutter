part of 'posts_bloc.dart';

@immutable
class PostsEvent {}

class PostsRequested extends PostsEvent {}

class ActivePostRequested extends PostsEvent {}
