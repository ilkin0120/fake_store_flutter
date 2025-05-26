abstract class Assets {
  static final icons = _Icons();
  static final images = _Images();
}

class _Icons {
  static const _basePath = 'assets/icons';
  final branding = '$_basePath/branding.svg';
  final home = '$_basePath/home.svg';
  final like = '$_basePath/like.svg';
  final shop = '$_basePath/shop.svg';
  final logout = '$_basePath/logout.svg';
}

class _Images {
  static const _basePath = 'assets/images';
  final welcome = '$_basePath/welcome.png';
}
