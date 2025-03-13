import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('CustomNavigationBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 24,
                    spreadRadius: -14,
                    offset: Offset(0, 9)
                )
              ]
          ),
          child: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Characters',
                icon: Icon(Icons.people),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
            currentIndex: navigationShell.currentIndex,
            onTap: (int index) => _onTap(index),
          ),
        )
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}