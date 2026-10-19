import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  final String imageAsset;
  final VoidCallback onBack;

  const DetailHeader({
    super.key,
    required this.imageAsset,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageAsset,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  color: Colors.deepPurple.shade50,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.temple_buddhist,
                    size: 72,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[100]?.withValues(
                alpha: 0.8,
              ),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              tooltip: 'Kembali',
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ],
    );
  }
}