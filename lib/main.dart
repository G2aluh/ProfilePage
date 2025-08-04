import 'package:flutter/material.dart';
import 'pages/profile.dart'; // import file profile.dart

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: Utama(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  // List halaman yang akan ditampilkan sesuai index BottomNavigationBar
  final List<Widget> pages = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Search Page', style: TextStyle(fontSize: 24))),
    Utama(), // Halaman profil yang diambil dari profile.dart
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
     
    );
  }
}
