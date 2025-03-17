import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/helpers/network_helper.dart';
import 'package:flutter_tech_task/models/comment_model.dart';
import 'package:flutter_tech_task/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    var response = await NetworkHelper().get(endpoint: 'posts');

    try {
      List<dynamic> decodedResponse = jsonDecode(response.body);

      List<PostModel> posts = decodedResponse.map((post) {
        return PostModel.fromJson(post);
      }).toList();

      return posts;
    } catch (e) {
      debugPrint(e.toString());
      // TODO:: log error when converting to post model (malformed response)
    }

    return [];
  }

  getPostById({required int postId}) async {
    var response = await NetworkHelper().get(endpoint: 'posts/$postId');

    try {
      var decodedResponse = jsonDecode(response.body);

      PostModel post = PostModel.fromJson(decodedResponse);

      return post;
    } catch (e) {
      debugPrint(e.toString());
      // TODO:: log error when converting to post model (malformed response)
    }
  }

  Future<List<CommentModel>> getPostCommentsById({required int postId}) async {
    var response =
        await NetworkHelper().get(endpoint: 'posts/$postId/comments');

    try {
      List<dynamic> decodedResponse = jsonDecode(response.body);

      List<CommentModel> comments = decodedResponse.map((comment) {
        return CommentModel.fromJson(comment);
      }).toList();

      return comments;
    } catch (e) {
      debugPrint(e.toString());
      // TODO:: log error when converting to post model (malformed response)
    }
    return [];
  }

  static const String _postKey = 'post_key';

  savePost(PostModel post) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      List<PostModel> posts = await getSavedPosts() ?? [];

      List<Map<String, dynamic>> postsJson =
          posts.map((post) => post.toJson()).toList();

      postsJson.add(post.toJson()); // Add new post to existing list

      String stringifiedPosts = jsonEncode(postsJson);

      await prefs.setString(_postKey, stringifiedPosts);
    } catch (e) {
      // TODO:: Handle error
      debugPrint(e.toString());
    }
  }

  getSavedPosts() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? postJson = prefs.getString(_postKey);

      if (postJson != null) {
        var decodedPosts = jsonDecode(postJson);

        List<PostModel> posts = List<PostModel>.from(decodedPosts.map((post) {
          return PostModel.fromJson(post);
        }));

        return posts;
      }
    } catch (e) {
      //TODO:: Handle error
      debugPrint(e.toString());
    }
  }
}
