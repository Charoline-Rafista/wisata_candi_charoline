import 'package:flutter/material.dart';
import 'package:wisata_candi_charoline/models/candi.dart';

class DetailInfo extends StatelessWidget {
  final Candi candi;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final bool isDescriptionExpanded;
  final VoidCallback onDescriptionPressed;

  const DetailInfo({
    super.key,
    required this.candi,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.isDescriptionExpanded,
    required this.onDescriptionPressed,
  });

  Widget _infoRow({
    required IconData icon,
    required Color color,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 8),
          SizedBox(
            width: 76,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  candi.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                tooltip: isFavorite
                    ? 'Hapus dari favorit'
                    : 'Tambah ke favorit',
                onPressed: onFavoritePressed,
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: isFavorite ? Colors.red : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _infoRow(
            icon: Icons.place,
            color: Colors.red,
            label: 'Lokasi',
            value: candi.location,
          ),
          _infoRow(
            icon: Icons.calendar_month,
            color: Colors.blue,
            label: 'Dibangun',
            value: candi.built,
          ),
          _infoRow(
            icon: Icons.house,
            color: Colors.green,
            label: 'Tipe',
            value: candi.type,
          ),
          const SizedBox(height: 6),
          Divider(color: Colors.deepPurple.shade100),
          const SizedBox(height: 16),
          const Text(
            'Deskripsi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            candi.description,
            maxLines: isDescriptionExpanded ? null : 4,
            overflow: isDescriptionExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onDescriptionPressed,
              child: Text(
                isDescriptionExpanded
                    ? 'Lebih sedikit'
                    : 'Baca selengkapnya',
              ),
            ),
          ),
        ],
      ),
    );
  }
}