import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/models/post_model.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';
import 'package:flutter_tech_task/widgets/list_card.dart';
import 'package:go_router/go_router.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _ListPageState();
}

class _ListPageState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List of posts"),
        ),
        body:
            BlocBuilder<PostsBloc, PostsState>(builder: (context, postsState) {
          if (postsState is PostsFailedToLoad) {
            // TODO:: Handle failed loading
          }

          if (postsState is PostsLoaded) {
            List<PostModel> posts = postsState.posts!;

            return ListView(
              children: posts.map((post) {
                return ListCard(
                    onTap: () {
                      context.go('/details/${post.id}');
                    },
                    title: post.title,
                    body: post.body);
              }).toList(),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
