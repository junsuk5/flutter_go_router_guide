import 'package:flutter/material.dart';
import 'package:flutter_go_route_guide/presentation/main_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.go('/today');
              },
              child: const Text('입장'),
            ),
          ),
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          currentPageIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: '/today',
                builder: (context, state) {
                  return const Center(
                    child: Text('Today'),
                  );
                }),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/hourly',
              builder: (context, state) {
                return const Center(
                  child: Text('Hourly'),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/10day',
              builder: (context, state) {
                return const Center(
                  child: Text('10day'),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/radar',
              builder: (context, state) {
                return const Center(
                  child: Text('Radar'),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) {
                return const Center(
                  child: Text('Settings'),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
