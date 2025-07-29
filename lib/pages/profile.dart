import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'number_widget.dart';
import 'edit_profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Utama(),
    );
  }
}

class Utama extends StatefulWidget {
  @override
  _UtamaState createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  int currentIndex = 0; // index untuk navigasi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
   
    );
  }

 
  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
         Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
      'Alexander Hamilton',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(width: 8),
    IconButton(
      icon: const Icon(Icons.edit, size: 20),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfilePage()),
        );
      },
    ),
  ],
),
          const SizedBox(height: 8),
          Text(
            'Junior Web Developer',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.slack),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.github),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.twitter),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.linkedin),
            ],
          ),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 16),
          NumbersWidget(),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 16),
          buildAbout(),
          const SizedBox(height: 32),
        ],
      );

  Widget buildAbout() => Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const ListTile(
          title: Text(
            'About Me',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Im a passionate web developer skilled in crafting dynamic, user-friendly websites and applications, with expertise in modern frameworks, responsive design, and delivering seamless digital experiences! 🚀💻',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      );

  Widget buildTop() {
    final bawah = profileHeight / 2;
    final atas = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bawah),
          child: buildCoverImage(),
        ),
        // Tombol like di kanan atas
        Positioned(
          top: 40,
          right: 16,
          child: buildLikeButton(),
        ),
        Positioned(
          top: atas,
          child: buildProfileImage(),
        ),
      ],
    );
  }

 Widget buildLikeButton() => Stack(
  clipBehavior: Clip.none,
  children: [
    CircleAvatar(
      radius: 22,
      backgroundColor: Colors.grey.shade100,
      child: FaIcon(
        FontAwesomeIcons.solidHeart,
        color: Colors.red,
        size: 20,
      ),
    ),
  
  ],
);


  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => Container(
        width: profileHeight,
        height: profileHeight,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage(
            'assets/images/Profile.png',
          ),
        ),
      );

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Center(child: Icon(icon, size: 32)),
      );
}
