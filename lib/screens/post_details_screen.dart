import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';

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
          if (state is ActivePostLoaded) {
            return Container(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  Text(
                    state.activePost!.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(height: 10),
                  Text(state.activePost!.body,
                      style: const TextStyle(fontSize: 16))
                ]));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
