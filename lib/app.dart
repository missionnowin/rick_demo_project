import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_demo_project/presentation/router/routes_list.dart';

class Application extends StatelessWidget{
  Application({super.key});

  final GoRouter _router = GoRouter(routes: routesList);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick&Morty',
      routerConfig: _router,
    );
  }
}