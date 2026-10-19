import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailGallery extends StatelessWidget {
  final List<String> imageUrls;

  const DetailGallery({
    super.key,
    required this.imageUrls,
  });

  void _showImage(BuildContext context, String imageUrl) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const SizedBox(
                    height: 240,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const SizedBox(
                    height: 240,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton.filledTonal(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.deepPurple.shade100),
          const SizedBox(height: 8),
          const Text(
            'Galeri',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      _showImage(context, imageUrls[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple.shade100,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrls[index],
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Container(
                            width: 120,
                            height: 120,
                            color: Colors.deepPurple[50],
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.image_outlined,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Container(
                            width: 120,
                            height: 120,
                            color: Colors.deepPurple[50],
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.broken_image_outlined,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Tap untuk memperbesar',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}