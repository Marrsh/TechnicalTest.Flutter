import 'package:flutter/material.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';
import 'package:flutter_tech_task/screens/post_details_screen.dart';
import 'package:flutter_tech_task/screens/post_list_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PostsBloc())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'list/',
      routes: {
        "list/": (context) => const PostListScreen(),
        "details/": (context) => const PostDetailsScreen(),
      },
    );
  }
}
