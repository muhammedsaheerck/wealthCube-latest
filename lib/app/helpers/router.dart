import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealthcube/app/modules/auth/view/login/login_screen.dart';
import 'package:wealthcube/app/modules/on_boarding/view/on_boarding_screen.dart';

import '../modules/auth/view/forgot password/create_new_password_screen.dart';
import '../modules/auth/view/forgot password/forget_password_screen.dart';
import '../modules/auth/view/forgot password/password_changed_success_screen.dart';
import '../modules/auth/view/otp/otp_verification_screen.dart';
import '../modules/auth/view/signup/signup_screen.dart';
import '../modules/widgets/not_found_screen.dart';

class AppRouter {
  static const String initial = '/';
  static const String sliderScreen = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String otpVerificationScreen = '/otpVerificationScreen';
  static const String createNewPasswordScreen = '/createNewPasswordScreen';
  static const String passwordChangedSuccessScreen =
      '/passwordChangedSuccessScreen';
  static const String noInternet = '/noInternet';
  static const String tab = '/tabscreen';

  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundPage();
// GoRouter configuration
  static final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: initial,
        path: initial,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        name: login,
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: register,
        path: register,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        name: forgotPassword,
        path: forgotPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        name: otpVerificationScreen,
        path: otpVerificationScreen,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        name: createNewPasswordScreen,
        path: createNewPasswordScreen,
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),
      GoRoute(
        name: passwordChangedSuccessScreen,
        path: passwordChangedSuccessScreen,
        builder: (context, state) => const PasswordChangedSuccessScreen(),
      ),
      // GoRoute(
      //   name: noInternet,
      //   path: noInternet,
      //   builder: (context, state) => const NoInternetScreen(),
      // ),
      // GoRoute(
      //   name: tab,
      //   path: tab,
      //   builder: (context, state) => const TabScreen(),
      // ),
      // GoRoute(
      //   name: homeScreen,
      //   path: homeScreen,
      //   builder: (context, state) => const HomeScreen(),
      // ),
      // GoRoute(
      //   name: categoryScreen,
      //   path: categoryScreen,
      //   builder: (context, state) => const CategoryScreen(),
      // ),
      // GoRoute(
      //   name: sectionHomeScreen,
      //   path: sectionHomeScreen,
      //   builder: (context, state) => SectionHomeScreen(
      //     categoryid: state.uri.queryParameters['categoryid'] ?? '',
      //     sectionName: state.uri.queryParameters['sectionName'] ?? '',
      //   ),
      // ),
      // GoRoute(
      //   name: vibesHomeScreen,
      //   path: vibesHomeScreen,
      //   builder: (context, state) => const VibesHomeScreen(),
      // ),
      // GoRoute(
      //   name: productListByCategoryScreen,
      //   path: productListByCategoryScreen,
      //   builder: (context, state) => ProductListByCategoryScreen(
      //     categoryid: state.uri.queryParameters['categoryid'] ?? '',
      //     subCategoryId: state.uri.queryParameters['subCategoryId'] ?? '',
      //     categoryname: state.uri.queryParameters['categoryname'] ?? '',
      //     isBrand: state.uri.queryParameters['isBrand'] ?? 'false',
      //     isFromDealsScreen:
      //         state.uri.queryParameters['isFromDealsScreen'] ?? 'false',
      //   ),
      // ),
    ],
  );

  static GoRouter get router => _router;
}
