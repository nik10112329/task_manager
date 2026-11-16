// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $ConfigsGen {
  const $ConfigsGen();

  /// Directory path: .configs/dev
  $ConfigsDevGen get dev => const $ConfigsDevGen();

  /// Directory path: .configs/prod
  $ConfigsProdGen get prod => const $ConfigsProdGen();
}

class $ConfigsDevGen {
  const $ConfigsDevGen();

  /// File path: .configs/dev/configs.env
  String get configs => '.configs/dev/configs.env';

  /// List of all assets
  List<String> get values => [configs];
}

class $ConfigsProdGen {
  const $ConfigsProdGen();

  /// File path: .configs/prod/configs.env
  String get configs => '.configs/prod/configs.env';

  /// List of all assets
  List<String> get values => [configs];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/card_background.svg
  String get cardBackground => 'assets/images/card_background.svg';

  /// List of all assets
  List<String> get values => [cardBackground];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/circle_logo.png
  AssetGenImage get circleLogo =>
      const AssetGenImage('assets/logos/circle_logo.png');

  /// File path: assets/logos/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logos/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [circleLogo, logo];
}

class Assets {
  const Assets._();

  static const $ConfigsGen configs = $ConfigsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
