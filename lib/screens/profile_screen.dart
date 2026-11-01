import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_charoline/providers/auth_provider.dart';
import 'package:wisata_candi_charoline/providers/favorite_provider.dart';
import 'package:wisata_candi_charoline/screens/sign_in_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final favoriteCount = context.watch<FavoriteProvider>().count;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Stack(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 105),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/placeholder_image.png'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _profileRow(
                    icon: Icons.lock,
                    color: Colors.amber,
                    label: 'Pengguna',
                    value: auth.isSignedIn ? auth.username : 'Belum Sign In',
                  ),
                  const SizedBox(height: 12),
                  _profileRow(
                    icon: Icons.person,
                    color: Colors.blue,
                    label: 'Nama',
                    value: auth.isSignedIn ? auth.username : '-',
                  ),
                  const SizedBox(height: 12),
                  _profileRow(
                    icon: Icons.favorite,
                    color: Colors.red,
                    label: 'Favorit',
                    value: '$favoriteCount',
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: auth.isSignedIn
                        ? ElevatedButton(
                            onPressed: () {
                              context.read<AuthProvider>().signOut();
                              context.read<FavoriteProvider>().clearAll();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Sign Out'),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignInScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Sign In'),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _profileRow({
    required IconData icon,
    required Color color,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        SizedBox(
          width: 85,
          child: Text(
            label,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Text(': $value', style: const TextStyle(fontSize: 17)),
        ),
      ],
    );
  }
}