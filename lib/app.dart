import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_fschmatz/pages/home.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Color topOverlayColor = Theme.of(context).appBarTheme.backgroundColor!;
    final Brightness iconBrightness = Theme.of(context).primaryColorBrightness;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: iconBrightness,
          systemNavigationBarColor: topOverlayColor,
          statusBarColor: topOverlayColor,
          systemStatusBarContrastEnforced: false,
          systemNavigationBarIconBrightness: iconBrightness,
        ),
        child: const SafeArea(child: Home())
    );
  }
}
