import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultImageContainer extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const DefaultImageContainer({
    super.key,
    required this.imageUrl,
    this.width = 70,
    this.height = 70,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => SizedBox(
              width: width,
              height: height,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
