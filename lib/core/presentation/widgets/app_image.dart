import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

enum ImageType {
  network,
  asset,
  file,
}

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.type,
    required this.url,
    this.fit = BoxFit.cover,
  });
  final ImageType type;
  final String url;
  final BoxFit fit;

  const AppImage.network({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
  }) : type = ImageType.network;

  const AppImage.asset({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
  }) : type = ImageType.asset;

  const AppImage.file({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
  }) : type = ImageType.file;

  @override
  Widget build(BuildContext context) => switch (type) {
        ImageType.network => CachedNetworkImage(
            imageUrl: url,
            fit: fit,
            cacheKey: url,
          ),
        ImageType.asset => OctoImage(
            image: AssetImage(url),
            fit: fit,
          ),
        ImageType.file => OctoImage(
            image: FileImage(File(url)),
            fit: fit,
          ),
      };
}
