import 'package:flutter/material.dart';
import 'package:movietest/provider/get_generos_provider.dart';
import 'package:movietest/provider/get_peliculas_provider.dart';
import 'package:movietest/router/routers.dart';
import 'package:movietest/serices/notification_service.dart';
import 'package:provider/provider.dart';
import 'api/api/AllApi.dart';
import 'api/api/construcion_page.dart';
import 'api/api/splash_auth_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        // --------- provider login --------------
        ChangeNotifierProvider(
            lazy: false, create: (_) => GetPeliculasProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => GetGenerosProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pelis',
        home: const SplashScreenPage(),
        initialRoute: 'HomePage',
        routes: getRutas(),
        scaffoldMessengerKey: NotificationService.msnKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => Construccion());
        },
        theme: ThemeData.dark()
        // theme: ThemeData.light()
        //     .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
        );
  }
}
