import 'package:flutter/material.dart';
import 'package:practice/home_page.dart';
import 'package:practice/profile_page.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Georgia',
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        )
      ),
      home: const Root(),
    );
  }
}


class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentPage = 0;
  List<Widget> pages = const [HomePage(), ProfilePage()];
  final player = AudioPlayer();

  void startPlay(){
    player.resume();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('BETTERSOUND'),
        leading: Icon(Icons.music_note),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.purple,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
