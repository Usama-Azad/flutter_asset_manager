# 👑 flutter_asset_manager
### This package is brought to you by [Usama Azad](https://github.com/Usama-Azad) 😎

<br>

A command-line tool which auto generates asset directories and register them in pubspec.yaml

<br>

## Features

* Auto Generates Assets Directories
* Auto Register Directories In pubspec.yaml
* Auto Generate Dart File For Assets (coming soon 🔜)

<br>

## Installation

<hr><br>

## 1. Use this package as an executable

<br>

## Install it
You can install the package from the command line:

```
dart pub global activate flutter_asset_manager
```
OR
```
dart pub global activate --source git https://github.com/Usama-Azad/flutter_asset_manager.git
```

## Use it
The package has the following executables:
```
assetX
```

<hr><br>

## 2. Use this package as a library

<br>

## Run command

##### With Dart:

```
dart pub add flutter_asset_manager
```

##### With Flutter:

```
flutter pub add flutter_asset_manager
```

<br>

## Add as a Dev Dependency in `pubspec.yaml`

```yaml
dev_dependencies: 
  flutter_asset_manager: "^0.0.1"
```
OR
```yaml
dev_dependencies: 
  flutter_asset_manager:
    git:
      url: https://github.com/Usama-Azad/flutter_asset_manager.git
```

After adding as a *dev dependency* run `flutter pub get`

<br>

## Usage

After adding as a *dev_dependency* in `pubspec.yaml`, all that is left to do is run the package.

<hr><br>

### 1. Default Directories

- If you don't specify any command-line arguments then it creates default directories

- Default directories are [audios fonts icons images translations videos](README.md).

[*if globally activated*](README.md)
```
assetX
```

[*if dev dependency*](README.md)
```
dart run flutter_asset_manager
```
OR
```
flutter pub run flutter_asset_manager
```
<hr><br>

### 2. Specific Directories with `--no-default` Argument

- If you provide `--no-default` argument then it don't create default directories

- But with `--no-default` argument you must provide directories name you want to create.

[*if globally activated*](README.md)
```
assetX --no-default images icons
```

[*if dev dependency*](README.md)
```
dart run flutter_asset_manager --no-default images icons
```
OR
```
flutter pub run flutter_asset_manager --no-default images icons
```
<hr><br>

### 3. Both Default & Specific Directories

- You can generate both default & specific directories by skipping `--no-default` argument.

[*if globally activated*](README.md)
```
assetX svgs
```

[*if dev dependency*](README.md)
```
dart run flutter_asset_manager svgs
```
OR
```
flutter pub run flutter_asset_manager svgs
```

<hr>