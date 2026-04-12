import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

extension NavigationX on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  Future<T?> push<T>(Widget page) {
    return navigator.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushRoute<T>(Route<T> route) => navigator.push(route);

  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (_) => false,
    );
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return navigator.pushNamed<T>(routeName, arguments: arguments);
  }

  void pop<T>([T? result]) => navigator.pop(result);
  void popUntil(RoutePredicate predicate) => navigator.popUntil(predicate);
  bool get canPop => navigator.canPop();
  void maybePop<T>([T? result]) => navigator.maybePop(result);
}

extension ThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  AppColors get appColors => theme.extension<AppColors>()!;

  bool get isDark => theme.brightness == Brightness.dark;
  bool get isLight => theme.brightness == Brightness.light;

  Color get primaryColor => colorScheme.primary;
  Color get accentColor => colorScheme.secondary;
  Color get surfaceColor => colorScheme.surface;
  Color get onSurfaceColor => colorScheme.onSurface;
}

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  double get topPadding => padding.top;
  double get bottomPadding => padding.bottom;
  double get pixelRatio => mediaQuery.devicePixelRatio;
  bool get isKeyboardVisible => viewInsets.bottom > 0;
  bool get isTablet => screenWidth >= 600;
}

extension SnackBarX on BuildContext {
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  void showSnackBar(String message, {Duration duration = const Duration(seconds: 3), SnackBarAction? action, Color? backgroundColor}) {
    messenger
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
  }

  void showErrorSnackBar(String message) => showSnackBar(message, backgroundColor: colorScheme.error);
  void showSuccessSnackBar(String message) => showSnackBar(message, backgroundColor: Colors.green.shade700);
}

extension FocusX on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
}
