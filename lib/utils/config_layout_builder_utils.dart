import 'package:config_layout_test/models/layout_config.dart';
import 'package:flutter/material.dart' show Widget;

import '../widgets/config_layout_builder.dart';

class Utils {
  static Widget layoutConfigBuilder(LayoutConfig layoutConfig, {bool isFirst = true}) {
    return ConfigLayoutBuilder(layoutConfig: layoutConfig, isFirst: isFirst);
  }
}
