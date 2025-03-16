// router.dart
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/screens/post_details_screen.dart';
import 'package:flutter_tech_task/screens/post_list_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter config = GoRouter(
    initialLocation: '/list/',
    routes: [
      GoRoute(
        path: '/list',
        builder: (BuildContext context, GoRouterState state) {
          return const PostListScreen();
        },
      ),
      GoRoute(
        path: '/details/:id',
        builder: (BuildContext context, GoRouterState state) {
          final int postId = int.parse(state.pathParameters['id'] ?? '0');
          return PostDetailsScreen(postId: postId);
        },
      ),
    ],
  );
}
