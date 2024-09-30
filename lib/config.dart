enum Flavor {
  dev,
  preprod,
  prod,
}

class AppConfig {
  final Flavor flavor;
  final String baseUrl;

  AppConfig({
    required this.flavor,
    required this.baseUrl,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrl;
//TODO add urls
    switch (flavor) {
      case Flavor.dev:
        baseUrl = 'https://';
        break;
      case Flavor.preprod:
        baseUrl = 'https://';
        break;
      case Flavor.prod:
        baseUrl = 'https://';
        break;
    }

    return AppConfig(
      flavor: flavor,
      baseUrl: baseUrl,
    );
  }
}
