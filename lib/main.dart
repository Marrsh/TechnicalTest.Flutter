import 'package:flutter/material.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';
import 'package:flutter_tech_task/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PostsBloc())],
      child: const MyApp()));
}

// TODO:: create new post list screen to show offline posts

// TODO:: set up tabbed pages

// TODO:: ADD badge to tabbed page

// TODO:: Upgrade Android gradle plugins for building to Android
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRouter().config,
    );
  }
}
