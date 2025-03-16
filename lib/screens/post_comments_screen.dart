import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/models/comment_model.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';
import 'package:flutter_tech_task/widgets/list_card.dart';

class PostCommentsScreen extends StatefulWidget {
  final int postId;
  const PostCommentsScreen({super.key, required this.postId});

  @override
  State<PostCommentsScreen> createState() => _PostCommentsScreenState();
}

class _PostCommentsScreenState extends State<PostCommentsScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<PostsBloc>()
        .add(ActivePostCommentsRequested(postId: widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Comments"),
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is ActivePostCommentsLoaded) {
              List<CommentModel> comments = state.comments!;
              return ListView(
                children: comments.map((comment) {
                  return ListCard(
                      onTap: () {}, title: comment.name, body: comment.body);
                }).toList(),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
