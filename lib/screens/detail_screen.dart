import 'package:flutter/material.dart';
import 'package:wisata_candi_charoline/models/candi.dart';
import 'package:wisata_candi_charoline/widgets/detail_gallery.dart';
import 'package:wisata_candi_charoline/widgets/detail_header.dart';
import 'package:wisata_candi_charoline/widgets/detail_info.dart';
import 'package:wisata_candi_charoline/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;

  const DetailScreen({
    super.key,
    required this.candi,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _isFavorite;
  bool _isDescriptionExpanded = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.candi.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      widget.candi.isFavorite = _isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // di dalam build() DetailScreen
    final isFav = context
        .watch<FavoriteProvider>()
        .isFavorite(candi.name);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DetailHeader(
              imageAsset: widget.candi.imageAsset,
              onBack: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
            DetailInfo(
              candi: widget.candi,
              isFavorite: _isFavorite,
              onFavoritePressed: _toggleFavorite,
              isDescriptionExpanded: _isDescriptionExpanded,
              onDescriptionPressed: () {
                setState(() {
                  _isDescriptionExpanded =
                      !_isDescriptionExpanded;
                });
              },
            ),
            DetailGallery(
              imageUrls: widget.candi.imageUrls,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}