import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/presentation/pages/cashier_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/home_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/login_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/product_page.dart';
import 'package:mitra_surya_jaya/presentation/widgets/navbar_widget.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavbarWidget(navigationShell);
      },
      branches: [
        /// * First Tab
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),

        /// * Second Tab
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/product',
              builder: (context, state) => const ProductPage(),
            ),
          ],
        ),

        /// * Third Tab
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/cashier',
              builder: (context, state) => const CashierPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);