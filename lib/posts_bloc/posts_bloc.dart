import 'package:bloc/bloc.dart';
import 'package:flutter_tech_task/models/comment_model.dart';
import 'package:flutter_tech_task/models/post_model.dart';
import 'package:flutter_tech_task/repositories/post_repository.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PostsRequested>((event, emit) async {
      emit(PostsLoading());
      try {
        List<PostModel> posts = await PostRepository().getPosts();

        emit(PostsLoaded(posts: posts));
      } catch (e) {
        // TODO:: handle error logging
        emit(PostsFailedToLoad());
      }
    });

    on<ActivePostRequested>((event, emit) async {
      List<PostModel> posts = state.posts ?? [];
      emit(ActivePostLoading(posts: posts));
      try {
        PostModel activePost =
            await PostRepository().getPostById(postId: event.postId);

        emit(ActivePostLoaded(posts: posts, activePost: activePost));
      } catch (e) {
        // TODO:: handle error logging
        emit(const ActivePostFailedToLoad());
      }
    });

    on<ActivePostCommentsRequested>((event, emit) async {
      List<PostModel>? posts = state.posts;
      PostModel? post = state.activePost;
      emit(ActivePostCommentsLoading(posts: posts, activePost: post));
      try {
        List<CommentModel> comments =
            await PostRepository().getPostCommentsById(postId: event.postId);

        emit(ActivePostCommentsLoaded(
            posts: posts, activePost: post, comments: comments));
      } catch (e) {
        // TODO:: handle error logging
        emit(const ActivePostCommentsFailedToLoad());
      }
    });

    on<SavedPostsRequested>((event, emit) async {
      List<PostModel>? posts = state.posts;
      PostModel? post = state.activePost;

      emit(PostsLoading());
      try {
        List<PostModel> posts = await PostRepository().getPosts();

        emit(PostsLoaded(posts: posts));
      } catch (e) {
        // TODO:: handle error logging
        emit(PostsFailedToLoad());
      }
    });
  }
}
