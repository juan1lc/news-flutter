import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/page/transit_page.dart';
import 'package:news_app/provider/user_info.dart';
import 'package:news_app/route/routes.dart';
import 'package:news_app/util/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => UserInfoProvider(),),
];

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const MyNewsApp(),
  ));
}

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'未来社区',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const TransitPage(),
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
      //home: const Login(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
      ],
      supportedLocales: const [
        Locale("zh", "CH"),
        Locale("en", "US")
      ],
    );
  }

}

