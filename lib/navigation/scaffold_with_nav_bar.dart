import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/navigation/route_name.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) {
          _onItemTapped(index, context);
        },
      ),
    );
  }

  _calculateSelectedIndex(context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/users')) {
      return 0;
    }
    if (location.startsWith('/profile')) {
      return 1;
    }
    return 0;
  }

  _onItemTapped(index, context) {
    switch (index) {
      case 0:
        GoRouter.of(context).goNamed(RouteName.users);
      case 1:
        GoRouter.of(context).goNamed(RouteName.profile);
      default:
        GoRouter.of(context).goNamed(RouteName.users);
    }
  }
}
