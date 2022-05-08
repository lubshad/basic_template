import 'package:basic_template/basic_template.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import '../di.dart';

setupApp() {
  setUrlStrategy(PathUrlStrategy());
  setupLogger();
  DependencyInjection.inject();
}
