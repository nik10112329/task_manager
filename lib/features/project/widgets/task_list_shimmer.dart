import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';

class TMTaskListShimmer extends StatelessWidget {
  const TMTaskListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ).copyWith(bottom: 20),
          child: DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [context.colors.standardShadow],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                color: context.colors.secondary,
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Название
                    Shimmer.fromColors(
                      baseColor: context.colors.iconDisable,
                      highlightColor: context.colors.secondary,
                      period: const Duration(seconds: 2),
                      child: Container(
                        height: 24,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        decoration: BoxDecoration(
                          color: context.colors.iconDisable,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: context.colors.iconDisable,
                      highlightColor: context.colors.secondary,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _avatarCircle(context, alpha: 0.3),
                          Transform.translate(
                            offset: const Offset(-11, 0),
                            child: _avatarCircle(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _avatarCircle(BuildContext context, {double? alpha = 1}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: context.colors.iconDisable.withValues(alpha: alpha),
        shape: BoxShape.circle,
        border: Border.all(
          color: context.colors.secondary.withValues(alpha: alpha),
          width: 2,
        ),
      ),
    );
  }
}
