class AppPaths {
  static FontsPaths get fonts => FontsPaths();

  static IconsPaths get icons => IconsPaths();

  static ImagesPaths get images => ImagesPaths();

  static VectorsPaths get vectors => VectorsPaths();
}

class FontsPaths {
  final String spaceMonoBold = 'assets/fonts/spacemono-bold.ttf';
  final String spaceMonoBoldItalic = 'assets/fonts/spacemono-boldItalic.ttf';
  final String spaceMonoItalic = 'assets/fonts/spacemono-italic.ttf';
  final String spaceMonoRegular = 'assets/fonts/spacemono-regular.ttf';
}

class IconsPaths {
  final String adaptiveBackgroundIcon =
      'assets/icons/adaptive-background-icon.png';
  final String adaptiveForegroundIcon =
      'assets/icons/adaptive-foreground-icon.png';
  final String facebookIcon = 'assets/icons/facebook-icon.png';
  final String favIcon = 'assets/icons/favicon.png';
  final String googleIcon = 'assets/icons/google-icon.png';
  final String icon = 'assets/icons/icon.png';
}

class ImagesPaths {
  final String defaultProfilePicture =
      'assets/images/default-profile-picture.png';
}

class VectorsPaths {
  final String closeIcon = 'assets/vectors/close-icon.svg';
  final String languageFlags = 'assets/vectors/language-flags.svg';
}
