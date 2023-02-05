import 'logger.dart';
import 'dart:io' show File, Directory;

extension ListExtension on List {
  void addLine(String value) {
    if (!(value.contains('Usama Azad') ||
        value.contains('[flutter_asset_manager]') ||
        value.contains('PLEASE DO NOT EDIT MANUALLY'))) {
      add(value);
    }
  }

  void addComments() {
    add('');
    add('  # Usama Azad <https://github.com/Usama-Azad>');
    add('  # Generate by [flutter_asset_manager](https://github.com/Usama-Azad/flutter_asset_manager) library.');
    add('  # PLEASE DO NOT EDIT MANUALLY.');
  }
}

class AssetManager {
  final String cwdPath;
  final List<String> args;
  List<String>? assetsDirs;

  AssetManager({required this.args, required this.cwdPath}) {
    Logger.initLogger();
    assetsDirs = _getAssetsDirectories();
  }

  List<String>? _getAssetsDirectories() {
    if (args.isNotEmpty && args[0] == '--no-default') {
      if (args.length == 1) {
        Logger.log(
            'with "--no-default" flag you must provide directories name you want to create. e.g "--no-default fonts images"',
            colorCode: ColorCode.red);
        return null;
      }
      return args.sublist(1);
    }
    return [
      'audios',
      'fonts',
      'icons',
      'images',
      'translations',
      'videos',
      ...args
    ];
  }

  void createAssetsDirectories() {
    if (assetsDirs == null) return;

    final assetsDirPath = '$cwdPath/assets';
    Directory(assetsDirPath).createSync();

    for (final dir in assetsDirs!) {
      final myDir = Directory('$assetsDirPath/$dir');
      if (myDir.existsSync()) {
        Logger.log('* Directory: "${myDir.path}" already exists.',
            colorCode: ColorCode.blue);
      } else {
        Logger.log('* Creating Directory: "${myDir.path}" ...',
            colorCode: ColorCode.green);
        myDir.createSync();
      }
    }
  }

  void registerAssetsInPubspecFile() {
    if (assetsDirs == null) return;

    Logger.log('');
    Logger.log('Registering assets directories in "pubspec.yaml"',
        colorCode: ColorCode.magenta);

    final pubFile = File('$cwdPath/pubspec.yaml');
    if (!pubFile.existsSync()) pubFile.createSync();

    final newPubLines = [];
    final pubLines = pubFile.readAsLinesSync();

    if (pubLines.contains('flutter:')) {
      if (pubLines.contains('  assets:')) {
        for (final line in pubLines) {
          // Remove conflict of commented assets tag in flutter project.
          if (line.contains('  # assets:')) continue;

          if (line.contains('assets:')) {
            newPubLines.addComments();
            newPubLines.addLine(line);
            for (final dir in assetsDirs!) {
              if (!pubLines.contains('    - assets/$dir/')) {
                newPubLines.add('    - assets/$dir/');
              }
            }
          } else {
            newPubLines.addLine(line);
          }
        }
        newPubLines.add('');
      } else {
        for (final line in pubLines) {
          newPubLines.addLine(line);

          // Remove conflict of flutter tag under dependencies.
          if (line.contains('  flutter:')) continue;

          if (line.contains('flutter:')) {
            newPubLines.addComments();
            newPubLines.add('  assets:');
            for (final dir in assetsDirs!) {
              newPubLines.add('    - assets/$dir/');
            }
            newPubLines.add('');
          }
        }
      }
    } else {
      if (pubLines.isNotEmpty) pubLines.add('');
      pubLines.add('# The following section is specific to Flutter packages.');
      pubLines.add('flutter:');
      pubLines.addComments();
      pubLines.add('  assets:');
      for (final dir in assetsDirs!) {
        pubLines.add('    - assets/$dir/');
      }
      pubLines.add('');
    }

    pubFile.writeAsStringSync(
        (newPubLines.isNotEmpty ? newPubLines : pubLines).join('\n'));

    Logger.log('');
    Logger.log('Completed!', colorCode: ColorCode.green);
  }
}
