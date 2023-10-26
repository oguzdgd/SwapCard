import 'package:flutter/material.dart';
import 'package:swapcard/pages/card_page.dart';
import 'package:swapcard/pages/leaderBoard_page.dart';
import 'package:swapcard/pages/profile_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SwapCard',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: <Widget>[
      //   Container(
      //     color: Colors.red,
      //   ),
      // ][currentPageIndex],

      bottomNavigationBar: NavigationBar(

        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.leaderboard),
            label: 'Board',
          ),

          NavigationDestination(
            icon: Icon(Icons.swap_horiz_outlined,),
            label: 'Swap',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const LeaderBoardPage(),
        const CardPage(),
        const ProfilePage(),

      ][currentPageIndex],
    );
  }
}
