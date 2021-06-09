import 'package:appnation_demo_project/core/init/cache/locale_manager.dart';
import 'package:appnation_demo_project/core/init/notifier/provider_list.dart';
import 'package:appnation_demo_project/core/init/notifier/theme_notifier.dart';
import 'package:appnation_demo_project/ui/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  runApp(MultiProvider(providers: [...ApplicationProvider.instance!.dependItems], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: HomePage(),
    );
  }
}

