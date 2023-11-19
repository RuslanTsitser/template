import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppSkeletonContainer extends StatelessWidget {
  const AppSkeletonContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.isWhite = true});
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 20,
      child: CircularProgressIndicator(color: isWhite ? Colors.white : null),
    );
  }
}
