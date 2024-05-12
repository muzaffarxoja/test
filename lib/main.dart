import 'package:flutter/material.dart';
import 'package:helloworld/utils/shared_prefs.dart';
import 'package:go_router/go_router.dart';
import 'package:helloworld/pages/authorization.dart';
import 'package:helloworld/pages/home.dart';
import 'package:helloworld/pages/registraion.dart';

const String registration = "/registration";
const String authorization = '/authorization';
const String home = '/home';

final _router = GoRouter(
  initialLocation: authorization,
  routes: [
    GoRoute(
      path: authorization,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: registration,
      builder: (context, state) => MyForm(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) => const Home(),
    ),
  ],
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
