import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/constants.dart';
import 'package:flutter_tech_task/repositories/post_repository.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _ListPageState();
}

class _ListPageState extends State<PostListScreen> {
  List<dynamic> posts = [];
  LoadingStatus loadingStatus = LoadingStatus.loading;

  @override
  void initState() {
    super.initState();
  }

  _loadPosts() async {
    // TODO:: replace with global state management
    posts = await PostRepository().getPosts();

    setState(() {
      loadingStatus = LoadingStatus.loaded;
    });

    if (posts == []) {
      loadingStatus = LoadingStatus.failed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List of posts"),
        ),
        body: FutureBuilder<dynamic>(
            future: _loadPosts(),
            builder: (post, response) {
              if (loadingStatus == LoadingStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (loadingStatus == LoadingStatus.failed) {
                // TODO:: Handle failed loading
              }

              return ListView(
                children: posts.map((post) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('details/', arguments: {'id': post['id']});
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(post['body']),
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
            }));
  }
}
