import 'package:flutter/material.dart';

import '../models/layout_config.dart';
import '../utils/config_layout_builder_utils.dart';

class ConfigLayoutBuilder extends StatelessWidget {
  const ConfigLayoutBuilder({
    super.key,
    required this.layoutConfig,
    this.isFirst = true,
  });

  final LayoutConfig layoutConfig;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return isFirst
        ? _getWidgetList(layoutConfig)
        : Expanded(
            flex: layoutConfig.flex,
            child: _getWidgetList(layoutConfig),
          );
  }

  Widget _getWidgetList(LayoutConfig layoutConfig) {
    return layoutConfig.type == 'Col'
        ? Column(
            children: _getChildren(layoutConfig.children),
          )
        : Row(
            children: _getChildren(layoutConfig.children),
          );
  }

  List<Widget> _getChildren(List<LayoutConfig> children) {
    return layoutConfig.children.isEmpty
        ? [
            _getCellWidget(),
          ]
        : layoutConfig.children.map(
            (child) {
              return Utils.layoutConfigBuilder(child, isFirst: false);
            },
          ).toList();
  }

  Widget _getCellWidget() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(layoutConfig.data?.type ?? ''),
              Text('Flex: ${layoutConfig.flex}'),
            ],
          ),
        ),
      ),
    );
  }
}
