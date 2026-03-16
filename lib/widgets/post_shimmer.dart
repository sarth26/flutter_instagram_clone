import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(radius: 18, backgroundColor: Colors.white),
                const SizedBox(width: 10),
                Container(
                  width: 120,
                  height: 12,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          /// IMAGE PLACEHOLDER
          Container(
            height: 380,
            width: double.infinity,
            color: Colors.white,
          ),

          const SizedBox(height: 10),

          /// ACTIONS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Container(width: 24, height: 24, color: Colors.white),
                const SizedBox(width: 16),
                Container(width: 24, height: 24, color: Colors.white),
                const SizedBox(width: 16),
                Container(width: 24, height: 24, color: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// CAPTION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              width: 200,
              height: 12,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}