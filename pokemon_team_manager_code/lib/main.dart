import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pokemon_team_manager_code/screens/main_menu_screen.dart';
import 'package:pokemon_team_manager_code/screens/teams_screen.dart';
import 'package:provider/provider.dart';
//import 'package:pokemon_team_manager_code/widgets/auth_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
    // const AuthGate(
    //   app: MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserID(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final userid = snapshot.data!;
        return Provider.value(
          value: userid,
          child: MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (_) => const MainMenu(),
              '/teams': (_) => const TeamsListScreen(),
            },
          ),
        );
      },
    );
  }
}

Future<String> getUserID() async {
  final pref = await SharedPreferences.getInstance();
  String? userid = pref.getString('userid');
  if (userid == null) {
    final db = FirebaseFirestore.instance;
    final doc = await db.collection("/users").add({
      'createdAt': Timestamp.now(),
    });
    await pref.setString('userid', doc.id);
    userid = doc.id;
  }

  // userid ready
  return userid;
}

Future<void> createTeam(String userid, int numTeam, int r, int g, int b) async {
  final db = FirebaseFirestore.instance;

  db.collection("/users/$userid/teams").add({
    'hintTitle': "Team $numTeam",
    'teamName': "Team $numTeam",
    'r': r,
    'g': g,
    'b': b,
  });
}
