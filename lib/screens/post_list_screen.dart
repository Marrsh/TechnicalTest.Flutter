import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/models/post_model.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';
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
                return InkWell(
                  onTap: () {
                    context.go('/details/${post.id}');
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(post.body),
                        Container(height: 10),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
