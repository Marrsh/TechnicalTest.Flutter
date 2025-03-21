import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';
import 'package:flutter_tech_task/repositories/post_repository.dart';
import 'package:go_router/go_router.dart';

class PostDetailsScreen extends StatefulWidget {
  final int postId;
  const PostDetailsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetailsScreen> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<PostDetailsScreen> {
  dynamic post;

  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(ActivePostRequested(postId: widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post details'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is ActivePostFailedToLoad) {
            // TODO:: handle failed state to user
          }
          if (state.activePost != null) {
            return Container(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  Text(
                    state.activePost!.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(state.activePost!.body,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        context.push('/details/${widget.postId}/comments');
                      },
                      child: const Text('See Comments')),
                  ElevatedButton(
                      onPressed: () {
                        PostRepository().savePost(state.activePost!);

                        // TODO:: add bloc
                      },
                      child: const Text('Save Post'))
                ]));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
