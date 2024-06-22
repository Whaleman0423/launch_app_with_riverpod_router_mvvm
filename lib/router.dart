part of './constants/values.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LaunchListPage(),
    ),
    GoRoute(
      path: '/launch/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return LaunchDetailPage(id: id);
      },
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) {
        final url = state.extra as String;
        return WebViewPage(url: url);
      },
    ),
  ],
);
