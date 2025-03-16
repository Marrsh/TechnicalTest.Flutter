import 'package:bloc/bloc.dart';
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

    on<ActivePostRequested>((event, emit) {});
  }
}
