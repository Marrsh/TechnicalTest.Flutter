import 'dart:convert';

import 'package:flutter_tech_task/helpers/network_helper.dart';

class PostRepository {
  getPosts() async {
    var response = await NetworkHelper().get(endpoint: 'posts');

    return jsonDecode(response.body);
  }
}
