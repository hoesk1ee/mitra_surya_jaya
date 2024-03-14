import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/presentation/pages/cashier_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/forgot_password_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/home_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/login_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/product_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/register_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/reset_password_confirmation_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/verification_page.dart';
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
      routes: [
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: 'forgot-password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: 'verification',
          builder: (context, state) => const VerificationPage(),
        ),
        GoRoute(
          path: 'reset-confirmation',
          builder: (context, state) => const ResetPasswordConfirmationPage(),
        ),
      ],
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
