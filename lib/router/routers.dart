import 'package:flutter/material.dart';

import '../api/api/construcion_page.dart';
import '../api/api/splash_auth_layout.dart';
import '../pages/detalle_page.dart';
import '../pages/generos_page.dart';
import '../pages/home_page.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'splas': (BuildContext context) => SplashScreenPage(),
    'GenerosPages': (BuildContext context) => GenerosPages(),
    'HomePage': (BuildContext context) => HomePage(),
    'DetallePage': (BuildContext context) => DetallePage(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
