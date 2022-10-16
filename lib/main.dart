import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:test2/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // #docregion build
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Startup Name Generator',
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
// #enddocregion build
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: const Center(
          child: Text(
        "String",
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 40,
        ),
      )),
      drawer: const DrawerDetails(),
      bottomNavigationBar: const Navigation(),
    );
  }
}

class DrawerDetails extends StatelessWidget {
  const DrawerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text("Drawer Header"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Page 1"),
          ),
          AboutListTile(
            icon: Icon(
              Icons.info,
            ),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'My Cool App',
            applicationVersion: '1.0.25',
            applicationLegalese: '© 2019 Company',
            child: Text('About app'),
          ),
        ],
      ),
    );
  }
}

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: [
      IconButton(
        icon: const Icon(Icons.access_time),
        onPressed: () {},
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.people),
      ),
    ]);
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginPage();
            }
          },
        ),
      );
}
