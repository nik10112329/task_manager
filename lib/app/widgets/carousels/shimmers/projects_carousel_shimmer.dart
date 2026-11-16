import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMProjectsCarouselShimmer extends StatelessWidget {
  const TMProjectsCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          const SizedBox(width: 50),
          ...List.generate(2, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Shimmer.fromColors(
                baseColor: context.colors.iconDisable,
                highlightColor: context.colors.white,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
