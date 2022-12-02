import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    const MyBookApp(),
  );
}

class MyBookApp extends StatelessWidget {
  const MyBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      devices: [
        Apple.iPhone11,
        Samsung.s21ultra,
        Device(
          name: 'Mini web',
          resolution: Resolution.dimensions(
            scaleFactor: 2,
            nativeHeight: 720,
            nativeWidth: 1280,
          ),
          type: DeviceType.desktop,
        ),
      ],
      categories: [],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      appInfo: AppInfo(name: 'Book Of UI'),
    );
  }
}
