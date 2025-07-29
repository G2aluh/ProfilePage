import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
              const Positioned(
                top: 40,
                left: 16,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              // Tombol share
              const Positioned(
                top: 40,
                right: 16,
                child: Icon(Icons.share, color: Colors.white),
              ),
              // Avatar di tengah bawah cover
              const Positioned(
                top: 140,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: AssetImage('assets/images/Profile.png'),
                    ),
                    SizedBox(height: 8),
                    Text("Change Picture",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          // Spacer agar konten tidak ketimpa avatar
          const SizedBox(height: avatarRadius + 16),

          // Konten form (statis)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _StaticTextField(label: 'Name', value: 'Alexander Hamilton'),
                _StaticTextField(label: 'Age', value: '18'),
                _StaticTextField(
                    label: 'Email', value: 'alexanderhlm@gmail.com'),
                _StaticTextField(label: 'Bio', value: 'Junior Web Developer'),
                _StaticTextField(
                    label: 'Skill', value: 'UI Designer, Web Developer'),
                _StaticTextField(
                  label: 'Experience',
                  value:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                _StaticTextField(
                  label: 'About Me',
                  value:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                SizedBox(height: 24),
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
                    onPressed: null, // Tidak ada fungsi
                    child: Text('Update',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
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

// Widget kecil untuk textfield statis
class _StaticTextField extends StatelessWidget {
  final String label;
  final String value;

  const _StaticTextField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: TextEditingController(text: value),
            maxLines: (label == 'Experience' || label == 'About Me') ? 4 : 1,
            readOnly: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
