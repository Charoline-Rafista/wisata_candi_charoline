import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_charoline/models/candi.dart';
import 'package:wisata_candi_charoline/providers/favorite_provider.dart';
import 'package:wisata_candi_charoline/screens/profile_screen.dart';
import 'package:wisata_candi_charoline/widgets/detail_gallery.dart';
import 'package:wisata_candi_charoline/widgets/detail_header.dart';
import 'package:wisata_candi_charoline/widgets/detail_info.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;

  const DetailScreen({
    super.key,
    required this.candi,
  });

  @override
  Widget build(BuildContext context) {
    final isFav = context.watch<FavoriteProvider>().isFavorite(candi.name);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DetailHeader(
              imageAsset: candi.imageAsset,
              onBack: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
            DetailInfo(
              candi: candi,
              isFavorite: isFav,
              onFavoritePressed: () {
                context.read<FavoriteProvider>().toggle(candi.name);
              },
            ),
            DetailGallery(imageUrls: candi.imageUrls),
            const SizedBox(height: 24),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Buka Profil',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ProfileScreen(),
            ),
          );
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
