/*   
*    LightPlan is an open source app created with the intent of helping users keep track of tasks.
*    Copyright (C) 2020-2021 LightPlan Team
*
*    This program is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with this program. If not, see https://www.gnu.org/licenses/.
*
*    Contact the authors at: contact@lightplanx.com
*/

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lighthouse_planner/theme_handler.dart';

import 'models/task.dart';
import 'route_generator.dart';
import 'ui/screens/main_page.dart';
import 'ui/screens/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init hive boxes
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeHandler theme = ThemeHandler();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lightplan',
      //theme: ,
      initialRoute: '/',
      routes: {
        '/': (_) => MainPage(),
        '/settings': (_) => SettingsPage(),
      },
      onUnknownRoute: RouteGenerator.generateRoute,
      //* GenerateRoute is currently bugged and doesn't have browser history and doesn't pass route names to url
      // onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
