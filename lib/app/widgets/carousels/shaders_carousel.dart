import 'package:flutter/material.dart';
import 'package:task_manager/app/widgets/shaders/shader_widget.dart';
import 'package:task_manager/app/widgets/wrappers/clickable.dart';

class TMShadersCarousel extends StatelessWidget {
  const TMShadersCarousel({
    // required this.selectIndex,
    // required this.tags,
    // required this.onTapTask,
    super.key,
  });

  // final List<String> tags;
  // final int selectIndex;
  // final Function(int index) onTapTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 50),
          ...List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Clickable(
                onTap: () {
                  // onTapTask(index);
                },
                child: const SizedBox(
                  width: 300,
                  height: 300,
                  child: ShaderWidget(
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
