part of './theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primaryText;

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color quaternary;
  final Color like;
  final Color error;
  final Color textFieldHintColor;
  final Color textFieldBackgroundColor;
  final Color defaultBorderColor;

  final Color background;

  const ThemeColors({
    required this.primaryText,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quaternary,
    required this.like,
    required this.error,
    required this.background,
    required this.textFieldHintColor,
    required this.textFieldBackgroundColor,
    required this.defaultBorderColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primaryText,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quaternary,
    Color? like,
    Color? error,
    Color? background,
    Color? textFieldHintColor,
    Color? textFieldBackgroundColor,
    Color? defaultBorderColor,
  }) {
    return ThemeColors(
      primaryText: primaryText ?? this.primaryText,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      quaternary: quaternary ?? this.quaternary,
      like: like ?? this.like,
      error: error ?? this.error,
      textFieldHintColor: textFieldHintColor ?? this.textFieldHintColor,
      background: background ?? this.background,
      textFieldBackgroundColor:
          textFieldBackgroundColor ?? this.textFieldBackgroundColor,
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      quaternary: Color.lerp(quaternary, other.quaternary, t)!,
      textFieldHintColor:
          Color.lerp(textFieldHintColor, other.textFieldHintColor, t)!,
      like: Color.lerp(like, other.like, t)!,
      error: Color.lerp(error, other.error, t)!,
      background: Color.lerp(background, other.background, t)!,
      textFieldBackgroundColor:
          Color.lerp(
            textFieldBackgroundColor,
            other.textFieldBackgroundColor,
            t,
          )!,
      defaultBorderColor:
          Color.lerp(defaultBorderColor, other.defaultBorderColor, t)!,
    );
  }

  static get light => const ThemeColors(
    primary: LightModeColors.yellow100,
    primaryText: LightModeColors.base10,
    background: LightModeColors.base100,
    error: LightModeColors.red90,
    like: LightModeColors.red100,
    textFieldHintColor: LightModeColors.gray70,
    quaternary: LightModeColors.gray40,
    secondary: LightModeColors.gray60,
    tertiary: LightModeColors.gray80,
    defaultBorderColor: LightModeColors.base80,
    textFieldBackgroundColor: LightModeColors.base90,
  );
}
