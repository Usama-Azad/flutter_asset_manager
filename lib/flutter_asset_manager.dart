library flutter_asset_manager;

import 'dart:io' show Directory;
import 'package:flutter_asset_manager/src/assets_manager.dart';

void main(List<String> args) {
  // Get Current Working Directory Path
  final cwdPath = Directory.current.path;

  // Initilize AssetsManager
  final assetsManager = AssetManager(args: args, cwdPath: cwdPath);

  // Create All Assets Directories (if not exists)
  assetsManager.createAssetsDirectories();

  // Register Assets In Pubspec.yaml File
  assetsManager.registerAssetsInPubspecFile();
}
