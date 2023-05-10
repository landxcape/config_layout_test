// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CellData {
  final String type;
  final String ext;
  final String value;
  CellData({
    required this.type,
    required this.ext,
    required this.value,
  });

  CellData copyWith({
    String? type,
    String? ext,
    String? value,
  }) {
    return CellData(
      type: type ?? this.type,
      ext: ext ?? this.ext,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'ext': ext,
      'value': value,
    };
  }

  factory CellData.fromMap(Map<String, dynamic> map) {
    return CellData(
      type: map['type'] as String,
      ext: map['ext'] as String,
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CellData.fromJson(String source) => CellData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CellData(type: $type, ext: $ext, value: $value)';

  @override
  bool operator ==(covariant CellData other) {
    if (identical(this, other)) return true;

    return other.type == type && other.ext == ext && other.value == value;
  }

  @override
  int get hashCode => type.hashCode ^ ext.hashCode ^ value.hashCode;
}

class LayoutConfig {
  final String type;
  final int flex;
  final CellData? data;
  final List<LayoutConfig> children;
  LayoutConfig({
    required this.type,
    required this.flex,
    this.data,
    required this.children,
  });

  LayoutConfig copyWith({
    String? type,
    int? flex,
    CellData? data,
    List<LayoutConfig>? children,
  }) {
    return LayoutConfig(
      type: type ?? this.type,
      flex: flex ?? this.flex,
      data: data ?? this.data,
      children: children ?? this.children,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'flex': flex,
      'data': data?.toMap(),
      'children': children.map((x) => x.toMap()).toList(),
    };
  }

  factory LayoutConfig.fromMap(Map<String, dynamic> map) {
    return LayoutConfig(
      type: map['type'] as String,
      flex: map['flex'] as int,
      data: map['data'] != null ? CellData.fromMap(map['data'] as Map<String, dynamic>) : null,
      children: List<LayoutConfig>.from(
        (map['children'] as List).map<LayoutConfig>(
          (x) => LayoutConfig.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LayoutConfig.fromJson(String source) => LayoutConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LayoutConfig(type: $type, flex: $flex, data: $data, children: $children)';
  }

  @override
  bool operator ==(covariant LayoutConfig other) {
    if (identical(this, other)) return true;

    return other.type == type && other.flex == flex && other.data == data && listEquals(other.children, children);
  }

  @override
  int get hashCode {
    return type.hashCode ^ flex.hashCode ^ data.hashCode ^ children.hashCode;
  }
}
