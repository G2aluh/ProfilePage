import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 50;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Bagian atas: Cover + tombol + avatar
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Cover image
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Tombol back
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              // Tombol tiga titik (more options)
              Positioned(
                top: 40,
                right: 16,
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onSelected: (String value) {
                    // Handle menu item selection
                    switch (value) {
                      case 'Settings':
                        // TODO: Implement Settings action
                        break;
                      case 'Help':
                        // TODO: Implement Help action
                        break;
                      case 'Logout':
                        // TODO: Implement Logout action
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Settings',
                      child: Text('Settings'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Help',
                      child: Text('Help'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Logout',
                      child: Text('Logout'),
                    ),
                  ],
                ),
              ),
              // Avatar di tengah bawah cover
              Positioned(
                top: 140,
                child: Column(
                  children: [
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _isHovered = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _isHovered = false;
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4), // tebal border
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // White border
                            ),
                            child: CircleAvatar(
                              radius: avatarRadius,
                              backgroundColor: _isHovered ? Colors.grey.shade400 : Colors.transparent,
                              backgroundImage:
                                  const AssetImage('assets/images/Profile.png'),
                            ),
                          ),
                          if (_isHovered)
                            Container(
                              width: avatarRadius * 2, // Match avatar size
                              height: avatarRadius * 2, // Match avatar size
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              child: const Icon(
                                Icons.photo,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Change Picture",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Spacer agar konten tidak ketimpa avatar
          const SizedBox(height: avatarRadius + 16),

          // Konten form (statis)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const _StaticInfoField(label: 'Name', value: 'Alexander Hamilton'),
                const _StaticInfoField(label: 'Age', value: '18'),
                const _StaticInfoField(
                    label: 'Email', value: 'alexanderhlm@gmail.com'),
                const _StaticInfoField(label: 'Bio', value: 'Junior Web Developer'),
                const _StaticInfoField(
                    label: 'Skill', value: 'UI Designer, Web Developer'),
                const _StaticInfoField(
                  label: 'Experience',
                  value:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  maxLines: 4,
                ),
                const _StaticInfoField(
                  label: 'About Me',
                  value:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  maxLines: 4,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black87),
                      padding: MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget kecil untuk menampilkan info statis tanpa controller
class _StaticInfoField extends StatelessWidget {
  final String label;
  final String value;
  final int maxLines;

  const _StaticInfoField({
    required this.label,
    required this.value,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              value,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}