import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/data/db/auth_repository.dart';
import 'package:mitra_surya_jaya/presentation/pages/cashier_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/auth-pages/forgot_password_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/home_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/auth-pages/login_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/product_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/auth-pages/register_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/auth-pages/reset_password_confirmation_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/auth-pages/verification_page.dart';
import 'package:mitra_surya_jaya/presentation/pages/splash_screen.dart';
import 'package:mitra_surya_jaya/presentation/providers/auth_provider.dart';
import 'package:mitra_surya_jaya/presentation/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();
final authProvider = AuthProvider(AuthRepository());

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              path: 'register',
              builder: (context, state) => const RegisterPage(),
              routes: [
                GoRoute(
                  path: 'verification',
                  builder: (context, state) => const VerificationPage(),
                ),
              ],
            ),
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) => const ForgotPasswordPage(),
              routes: [
                GoRoute(
                  path: 'reset-confirmation',
                  builder: (context, state) =>
                      const ResetPasswordConfirmationPage(),
                ),
              ],
            ),
          ],
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
          initialLocation: '/home',
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
              redirect: (context, state) async {
                final isLoggedIn =
                    await context.read<AuthProvider>().userLoggedIn();

                return isLoggedIn ? '/home' : '/login';
              },
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
