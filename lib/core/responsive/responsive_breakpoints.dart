import 'package:flutter/widgets.dart';

enum ScreenClass { phone, tablet }

class ResponsiveBreakpoints {
  const ResponsiveBreakpoints._();

  static const double tablet = 720;

  static ScreenClass of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= tablet ? ScreenClass.tablet : ScreenClass.phone;
  }

  static bool isTablet(BuildContext context) {
    return of(context) == ScreenClass.tablet;
  }
}
