import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ModelOptions {
  const ModelOptions({this.fileName = '', this.modelLabels = ''});

  /// The name of the model file when using custom object detection.
  final String fileName;

  /// The name of the label file when using custom object detection.
  final String modelLabels;
}

class TimerOptions {
  const TimerOptions({this.allowed, this.enabled, this.duration});

  /// Whether the timerButton is shown or hidden.
  final bool? allowed;

  /// Whether automatically capturing of images is enabled. Only available when using a custom object detection model.
  final bool? enabled;

  /// The duration of the interval (in seconds) in which images are automatically captured, should be a float.
  final num? duration;
}

class Dimensions {
  const Dimensions(this.width, this.height);

  /// To add extra horizontal padding to the cropped image.
  final num? width;

  /// To add extra vertical padding to the cropped image.
  final num? height;
}

class SuccessOptions {
  const SuccessOptions({this.message = '', this.previewDuration});

  /// After capture, show a checkmark preview with this success message, instead of a preview of the image.
  final String message;

  /// The amount of seconds the success message should be visible for, should be a float.
  final num? previewDuration;
}

enum DefaultColor { original, grayscale }

class ShutterButton {
  const ShutterButton({this.allowshutterButton, this.hideShutterButton});

  /// Whether to allow or disallow the shutter button to work (can only be disabled if a model is supplied)
  final bool? allowshutterButton;

  /// Whether the shutter button should be hidden (only works if allowShutterButton is false)
  final bool? hideShutterButton;
}

class CameraConfig {
  CameraConfig({
    this.allowMultipleDocuments,
    this.defaultMultipleDocuments,
    this.defaultCrop,
    this.moveCloserMessage = '',
    this.imageMovingMessage = '',
    this.imageMaxWidth,
    this.imageMaxHeight,
    this.imageMaxQuality,
    this.previewDuration,
    this.imageLimit,
    this.imageLimitReachedMessage = '',
    this.model = const ModelOptions(),
    this.timer = const TimerOptions(),
    this.cropPadding = const Dimensions(0, 0),
    this.success = const SuccessOptions(),
    this.shutterButton = const ShutterButton(),
    this.storagePath = '',
    this.defaultColor,
    this.outputFileName = '',
    this.imageMovingSensitivityAndroid,
    this.imageTooBrightMessage = '',
    this.imagetooDarkMessage = '',
    this.primaryColor,
    this.accentColor,
    this.overlayColor,
    this.warningBackgroundColor,
    this.warningTextColor,
    this.overlayColorAlpha,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.reviewIconColor,
    this.isViewFinderEnabled,
    this.imageMovingSensitivityiOS,
    this.storeImagesToCameraRol,
  });

  /// Global options.

  /// Whether to show the icon to enable "multi-document"mode".
  final bool? allowMultipleDocuments;

  /// Whethe the "multi-document-mode" should be enabled by default.
  final bool? defaultMultipleDocuments;

  /// Whether the crop mode (auto edge detection) should be enabled by default.
  final bool? defaultCrop;

  /// The warning message when someone should move closer to a document.
  final String moveCloserMessage;

  /// The warning message when the camera preview has to much motion to be able to automatically take a photo.
  final String imageMovingMessage;

  /// The max width of the result image.
  final num? imageMaxWidth;

  /// The max height of the result image.
  final num? imageMaxHeight;

  /// Set the quality (between 0-100) of the jpg encoder. Default is 100.
  final num? imageMaxQuality;

  /// The amount of seconds the preview should be visible for, should be a float.
  final num? previewDuration;

  /// To limit the amount of images that can be taken.
  final num? imageLimit;

  /// The message to display when the limit has reached
  final String imageLimitReachedMessage;

  /// If you would like to use a custom model for object detection. Model + labels file should be packaged in your bundle.
  final ModelOptions model;

  /// If you would like to enable automatic capturing of images.
  final TimerOptions timer;

  /// To add extra horizontal and / or vertical padding to the cropped image.
  final Dimensions cropPadding;

  /// After capture, show a checkmark preview with this success message, instead of a preview of the image.
  final SuccessOptions success;

  /// Whether to disable/hide the shutterbutton (only works if a model is supplied).
  final ShutterButton shutterButton;

  /// Android Options

  /// Where to put the image results
  final String storagePath;

  /// What the default color conversion will be (grayscale, original)
  final DefaultColor? defaultColor;

  /// The filename to be given to the image results.
  final String outputFileName;

  /// The threshold of how sensitive the motion detection is. (lower value is higher sensitivity, default 50)
  final num? imageMovingSensitivityAndroid;

  /// iOS Options

  /// The warning message when the camera result is too bright.
  final String imageTooBrightMessage;

  /// The warning message when the camera result is too dark.
  final String imagetooDarkMessage;

  /// The primary color of the interface, should be a hex RGB color string.
  final Color? primaryColor;

  /// The accent color of the interface, should be a hex RGB color string.
  final Color? accentColor;

  /// The overlay color (when using document detection), should be a hex RGB color string.
  final Color? overlayColor;

  /// The color of the background of the warning message, should be a hex RGB color string.
  final Color? warningBackgroundColor;

  /// The color of the text of the warning message, should be a hex RGB color string.
  final Color? warningTextColor;

  /// The amount of opacity for the overlay, should be a float.
  final num? overlayColorAlpha;

  /// The color of the menu icons when they are enabled, should be a hex RGB color string.
  final Color? iconEnabledColor;

  /// The color of the menu icons when they are enabled, should be a hex RGB color string.
  final Color? iconDisabledColor;

  /// The color of the menu icons of the screen where you can review/edit the images, should be a hex RGB color string.
  final Color? reviewIconColor;

  /// Whether the camera has a view finder overlay (a helper grid so the user knows where the document should be), should be a Boolean.
  final bool? isViewFinderEnabled;

  /// The threshold sensitive the motion detection is. (lower value is higher sensitivity, default 200).
  final num? imageMovingSensitivityiOS;

  /// Whether the camera automatically saves the images to the camera roll. Default true. (iOS version 0.4.2 and up only)
  final bool? storeImagesToCameraRol;
}

/// A helper to convert flutter Color to a hex ARGB.
class KIVHexColor {
  /// Convert the given Flutter [color] object to a hex ARGB string. With our without a leading hash sign based on [leadingHashSign].
  static String flutterColorToHex(Color color, bool leadingHashSign) {
    return '${leadingHashSign ? '#' : ''}'
        '${color.alpha.toRadixString(16).padLeft(2, '0')}'
        '${color.red.toRadixString(16).padLeft(2, '0')}'
        '${color.green.toRadixString(16).padLeft(2, '0')}'
        '${color.blue.toRadixString(16).padLeft(2, '0')}';
  }
}

class KlippaScannerSdk {
  static const MethodChannel _channel =
      const MethodChannel('klippa_scanner_sdk');

  static Future<Map> startSession(
      final CameraConfig config, String license) async {
    Map<String, dynamic> parameters = {};
    parameters['License'] = license;

    /// Global options.

    if (config.allowMultipleDocuments != null) {
      parameters["AllowMultipleDocuments"] = config.allowMultipleDocuments;
    }

    if (config.defaultMultipleDocuments != null) {
      parameters["DefaultMultipleDocuments"] = config.defaultMultipleDocuments;
    }

    if (config.defaultCrop != null) {
      parameters["DefaultCrop"] = config.defaultCrop;
    }

    if (config.moveCloserMessage.isNotEmpty) {
      parameters["MoveCloserMessage"] = config.moveCloserMessage;
    }

    if (config.imageMovingMessage.isNotEmpty) {
      parameters["ImageMovingMessage"] = config.imageMovingMessage;
    }

    if (config.imageMaxWidth != null) {
      parameters["ImageMaxWidth"] = config.imageMaxWidth;
    }

    if (config.imageMaxHeight != null) {
      parameters["ImageMaxHeight"] = config.imageMaxHeight;
    }

    if (config.imageMaxQuality != null) {
      parameters["ImageMaxQuality"] = config.imageMaxQuality;
    }

    if (config.previewDuration != null) {
      parameters["PreviewDuration"] = config.previewDuration;
    }

    if (config.model.fileName.isNotEmpty) {
      parameters["Model.fileName"] = config.model.fileName;
    }
    if (config.model.modelLabels.isNotEmpty) {
      parameters["Model.modelLabels"] = config.model.modelLabels;
    }

    if (config.timer.allowed != null) {
      parameters["Timer.allowed"] = config.timer.allowed;
    }
    if (config.timer.enabled != null) {
      parameters["Timer.enabled"] = config.timer.enabled;
    }
    if (config.timer.duration != null) {
      parameters["Timer.duration"] = config.timer.duration;
    }

    if (config.cropPadding.height != null) {
      parameters["CropPadding.height"] = config.cropPadding.height;
    }
    if (config.cropPadding.width != null) {
      parameters["CropPadding.width"] = config.cropPadding.width;
    }

    if (config.success.previewDuration != null) {
      parameters["Success.previewDuration"] = config.success.previewDuration;
    }
    if (config.success.message.isNotEmpty) {
      parameters["Success.message"] = config.success.message;
    }

    if (config.shutterButton.allowshutterButton != null) {
      parameters["ShutterButton.allowShutterButton"] =
          config.shutterButton.allowshutterButton;
    }
    if (config.shutterButton.hideShutterButton != null) {
      parameters["ShutterButton.hideShutterButton"] =
          config.shutterButton.hideShutterButton;
    }

    if (config.imageLimit != null) {
      parameters["ImageLimit"] = config.imageLimit;
    }

    if (config.imageLimitReachedMessage.isNotEmpty) {
      parameters["ImageLimitReachedMessage"] = config.imageLimitReachedMessage;
    }

    /// Android only

    if (config.storagePath.isNotEmpty) {
      parameters["StoragePath"] = config.storagePath;
    }

    if (config.defaultColor != null) {
      parameters["DefaultColor"] = describeEnum(config.defaultColor!);
    }

    if (config.outputFileName.isNotEmpty) {
      parameters["OutputFilename"] = config.outputFileName;
    }

    if (config.imageMovingSensitivityAndroid != null) {
      parameters["ImageMovingSensitivityAndroid"] =
          config.imageMovingSensitivityAndroid;
    }

    /// iOS only

    if (config.imageTooBrightMessage.isNotEmpty) {
      parameters["ImageTooBrightMessage"] = config.imageTooBrightMessage;
    }

    if (config.imagetooDarkMessage.isNotEmpty) {
      parameters["ImageTooDarkMessage"] = config.imagetooDarkMessage;
    }

    if (config.primaryColor != null) {
      parameters["PrimaryColor"] =
          KIVHexColor.flutterColorToHex(config.primaryColor!, true);
    }

    if (config.accentColor != null) {
      parameters["AccentColor"] =
          KIVHexColor.flutterColorToHex(config.accentColor!, true);
    }

    if (config.overlayColor != null) {
      parameters["OverlayColor"] =
          KIVHexColor.flutterColorToHex(config.overlayColor!, true);
    }

    if (config.overlayColorAlpha != null) {
      parameters["OverlayColorAlpha"] = config.overlayColorAlpha;
    }

    if (config.warningBackgroundColor != null) {
      parameters["WarningBackgroundColor"] =
          KIVHexColor.flutterColorToHex(config.warningBackgroundColor!, true);
    }

    if (config.warningTextColor != null) {
      parameters["WarningTextColor"] =
          KIVHexColor.flutterColorToHex(config.warningTextColor!, true);
    }

    if (config.iconEnabledColor != null) {
      parameters["IconEnabledColor"] =
          KIVHexColor.flutterColorToHex(config.iconEnabledColor!, true);
    }

    if (config.iconDisabledColor != null) {
      parameters["IconDisabledColor"] =
          KIVHexColor.flutterColorToHex(config.iconDisabledColor!, true);
    }

    if (config.reviewIconColor != null) {
      parameters["ReviewIconColor"] =
          KIVHexColor.flutterColorToHex(config.reviewIconColor!, true);
    }

    if (config.isViewFinderEnabled != null) {
      parameters["IsViewFinderEnabled"] = config.isViewFinderEnabled;
    }

    if (config.imageMovingSensitivityiOS != null) {
      parameters["ImageMovingSensitivityiOS"] =
          config.imageMovingSensitivityiOS;
    }

    if (config.storeImagesToCameraRol != null) {
      parameters["StoreImagesToCameraRoll"] = config.storeImagesToCameraRol;
    }

    final Map startSessionResult =
        await _channel.invokeMethod('startSession', parameters);
    return startSessionResult;
  }
}
