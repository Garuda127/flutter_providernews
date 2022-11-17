import 'package:flutter/material.dart';
import 'package:flutter_providernews/src/pages/tabs_page.dart';
import 'package:flutter_providernews/src/services/news_service.dart';
import 'package:flutter_providernews/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const TabsPage(),
        theme: miTema,
      ),
    );
  }
}
