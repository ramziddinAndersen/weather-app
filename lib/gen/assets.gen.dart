/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/clear.svg
  SvgGenImage get clear => const SvgGenImage('assets/icons/clear.svg');

  $AssetsIconsWeatherGen get weather => const $AssetsIconsWeatherGen();

  /// List of all assets
  List<SvgGenImage> get values => [clear];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.jpg
  AssetGenImage get logoJpg => const AssetGenImage('assets/images/logo.jpg');

  /// File path: assets/images/logo.png
  AssetGenImage get logoPng => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoJpg, logoPng];
}

class $AssetsIconsWeatherGen {
  const $AssetsIconsWeatherGen();

  /// File path: assets/icons/weather/w01d.png
  AssetGenImage get w01d => const AssetGenImage('assets/icons/weather/w01d.png');

  /// File path: assets/icons/weather/w01n.png
  AssetGenImage get w01n => const AssetGenImage('assets/icons/weather/w01n.png');

  /// File path: assets/icons/weather/w02d.png
  AssetGenImage get w02d => const AssetGenImage('assets/icons/weather/w02d.png');

  /// File path: assets/icons/weather/w02n.png
  AssetGenImage get w02n => const AssetGenImage('assets/icons/weather/w02n.png');

  /// File path: assets/icons/weather/w03d.png
  AssetGenImage get w03d => const AssetGenImage('assets/icons/weather/w03d.png');

  /// File path: assets/icons/weather/w03n.png
  AssetGenImage get w03n => const AssetGenImage('assets/icons/weather/w03n.png');

  /// File path: assets/icons/weather/w04d.png
  AssetGenImage get w04d => const AssetGenImage('assets/icons/weather/w04d.png');

  /// File path: assets/icons/weather/w04n.png
  AssetGenImage get w04n => const AssetGenImage('assets/icons/weather/w04n.png');

  /// File path: assets/icons/weather/w09d.png
  AssetGenImage get w09d => const AssetGenImage('assets/icons/weather/w09d.png');

  /// File path: assets/icons/weather/w09n.png
  AssetGenImage get w09n => const AssetGenImage('assets/icons/weather/w09n.png');

  /// File path: assets/icons/weather/w10d.png
  AssetGenImage get w10d => const AssetGenImage('assets/icons/weather/w10d.png');

  /// File path: assets/icons/weather/w10n.png
  AssetGenImage get w10n => const AssetGenImage('assets/icons/weather/w10n.png');

  /// File path: assets/icons/weather/w11d.png
  AssetGenImage get w11d => const AssetGenImage('assets/icons/weather/w11d.png');

  /// File path: assets/icons/weather/w11n.png
  AssetGenImage get w11n => const AssetGenImage('assets/icons/weather/w11n.png');

  /// File path: assets/icons/weather/w13d.png
  AssetGenImage get w13d => const AssetGenImage('assets/icons/weather/w13d.png');

  /// File path: assets/icons/weather/w13n.png
  AssetGenImage get w13n => const AssetGenImage('assets/icons/weather/w13n.png');

  /// File path: assets/icons/weather/w50d.png
  AssetGenImage get w50d => const AssetGenImage('assets/icons/weather/w50d.png');

  /// File path: assets/icons/weather/w50n.png
  AssetGenImage get w50n => const AssetGenImage('assets/icons/weather/w50n.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        w01d,
        w01n,
        w02d,
        w02n,
        w03d,
        w03n,
        w04d,
        w04n,
        w09d,
        w09n,
        w10d,
        w10n,
        w11d,
        w11n,
        w13d,
        w13n,
        w50d,
        w50n
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
