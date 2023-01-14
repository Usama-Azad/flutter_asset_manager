enum ColorCode {
  red,
  cyan,
  blue,
  black,
  green,
  white,
  reset,
  yellow,
  magenta,
}

class Logger {
  static const _colorCodes = <ColorCode, String>{
    ColorCode.red: '\x1B[31m',
    ColorCode.cyan: '\x1B[36m',
    ColorCode.blue: '\x1B[34m',
    ColorCode.reset: '\x1B[0m',
    ColorCode.white: '\x1B[37m',
    ColorCode.black: '\x1B[30m',
    ColorCode.green: '\x1B[32m',
    ColorCode.yellow: '\x1B[33m',
    ColorCode.magenta: '\x1B[35m',
  };

  static void initLogger() {
    logs(
      [
        '***** ',
        'This Package Is Brought To You By Usama Azad <',
        'https://github.com/Usama-Azad',
        '>',
        ' *****'
      ],
      colorCodes: [
        ColorCode.white,
        ColorCode.yellow,
        ColorCode.blue,
        ColorCode.yellow,
        ColorCode.white
      ],
      endsWithNewLine: true,
    );
    log('Script started at: ${DateTime.now()}',
        colorCode: ColorCode.green, endsWithNewLine: true);
  }

  static void log(String text,
      {ColorCode colorCode = ColorCode.white, bool endsWithNewLine = false}) {
    print(
        '${_colorCodes[colorCode]}$text${_colorCodes[ColorCode.reset]}${endsWithNewLine ? '\n' : ''}');
  }

  static void logs(List<String> texts,
      {List<ColorCode> colorCodes = const [ColorCode.white],
      bool endsWithNewLine = false}) {
    final buffer = StringBuffer();
    for (int i = 0; i < texts.length; i++) {
      buffer.write(
          '${_colorCodes[colorCodes[texts.length == colorCodes.length ? i : 0]]}${texts[i]}${_colorCodes[ColorCode.reset]}');
    }
    if (endsWithNewLine) buffer.write('\n');
    print(buffer.toString());
  }
}
