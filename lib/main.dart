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
// // #enddocregion MyApp
//
// // #docregion RWS-var
// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _saved = <WordPair>{};
//   final _biggerFont = const TextStyle(fontSize: 18);
//   // #enddocregion RWS-var
//
//   void _pushSaved() {
//     Navigator.of(context).push(
//       // Add lines from here...
//       MaterialPageRoute<void>(
//         builder: (context) {
//           final tiles = _saved.map(
//                 (pair) {
//               return ListTile(
//                 title: Text(
//                   pair.asPascalCase,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final divided = tiles.isNotEmpty
//               ? ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList()
//               : <Widget>[];
//
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Saved Suggestions'),
//             ),
//             body: ListView(children: divided),
//           );
//         },
//       ), // ...to here.
//     );
//   }
//
//   // #docregion RWS-build
//   @override
//   Widget build(BuildContext context) {
//     // #docregion itemBuilder
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Startup Name Generator"),
//         actions: [
//           IconButton(
//             onPressed: _pushSaved,
//             icon: const Icon(Icons.list),
//             tooltip: 'Saved Suggestions',
//           )
//         ],
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: /*1*/ (context, i) {
//           if (i.isOdd) return const Divider(); /*2*/
//
//           final index = i ~/ 2; /*3*/
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//           }
//
//           final alreadySaved = _saved.contains(_suggestions[index]);
//
//           // #docregion listTile
//           return ListTile(
//             title: Text(
//               _suggestions[index].asPascalCase,
//               style: _biggerFont,
//             ),
//             trailing: Icon(
//               alreadySaved ? Icons.favorite : Icons.favorite_border,
//               color: alreadySaved ? Colors.red : null,
//               semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
//             ),
//             onTap: () {
//               setState(() {
//                 alreadySaved
//                     ? _saved.remove(_suggestions[index])
//                     : _saved.add(_suggestions[index]);
//               });
//             },
//           );
//           // #enddocregion listTile
//         },
//       ),
//     );
//
//     // #enddocregion itemBuilder
//   }
//
//
// // #enddocregion RWS-build
// // #docregion RWS-var
// }
// // #enddocregion RWS-var
//
// class RandomWords extends StatefulWidget {
//   const RandomWords({super.key});
//
//   @override
//   State<RandomWords> createState() => _RandomWordsState();
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.green,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
