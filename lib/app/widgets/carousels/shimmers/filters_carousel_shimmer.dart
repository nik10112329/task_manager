import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMFiltersCarouselShimmer extends StatelessWidget {
  const TMFiltersCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          const SizedBox(width: 50),
          ...List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Shimmer.fromColors(
                baseColor: context.colors.iconDisable,
                highlightColor: context.colors.white,
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    borderRadius: BorderRadius.circular(55),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 34),
        ],
      ),
    );
  }
}
