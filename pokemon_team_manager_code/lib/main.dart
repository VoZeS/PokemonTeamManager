import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pokemon_team_manager_code/screens/main_menu_screen.dart';
import 'package:pokemon_team_manager_code/screens/teams_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/menu',
      routes: {
        '/menu':(_) => const MainMenu(),
        '/teams': (_) => const TeamsListScreen(),
      }
    );
  }
}
