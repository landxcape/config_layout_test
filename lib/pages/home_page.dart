import 'package:config_layout_test/widgets/config_layout_builder.dart';
import 'package:flutter/material.dart';

import '../data/layout_config_data.dart';
import '../models/layout_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutConfig layoutConfig = LayoutConfig.fromMap(layoutConfigJson);

    return Scaffold(
      body: ConfigLayoutBuilder(layoutConfig: layoutConfig),
    );
  }
}
