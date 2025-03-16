import 'package:flutter/material.dart';
import 'package:flutter_tech_task/posts_bloc/posts_bloc.dart';
import 'package:flutter_tech_task/router.dart';
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
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: AppRouter().config,
    );
  }
}
