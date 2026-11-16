import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:task_manager/app/models/app_meta_data.dart';
import 'package:task_manager/app/theme/app_theme_extensions.dart';
import 'package:task_manager/app/widgets/app_version.dart';
import 'package:task_manager/app/widgets/shaders/shader_mask_widget.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.splashBackground,
      body: Center(
        child: Column(
          children: [
            const Spacer(),

            ShaderMaskWidget(
              shaderFile: 'shaders/gradient_flow.frag',
              child: Column(
                children: [
                  Text(
                    'Task',
                    style: context.styles.textStyle.copyWith(
                      fontSize: 40,
                      color: context.colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Manager',
                    style: context.styles.textStyle.copyWith(
                      fontSize: 40,
                      color: context.colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),


            const SizedBox(height: 40),

            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AppVersion(
                    metaData: AppMetaData(
                      version: snapshot.data!.version,
                      buildNumber: snapshot.data!.buildNumber,
                    ),
                  );
                }
                return const AppVersion(
                  metaData: AppMetaData(version: '', buildNumber: ''),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
