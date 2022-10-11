import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_page/auth/main_page.dart';
import 'package:login_page/pages/lesson_page.dart';
import 'package:login_page/provider/lessons_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LessonsProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/lesson_page': (context) => const LessonPage(),
        },
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
