import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tech_task/helpers/network_helper.dart';
import 'package:flutter_tech_task/models/post_model.dart';

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

  getPostCommentsById({required int postId}) {}
}
