import 'package:flutter/material.dart';

class LayoutStepsModel {
  final String title;
  final Widget content;

  const LayoutStepsModel({
    required this.title,
    required this.content,
  });

  static const LayoutStepsModel empty = LayoutStepsModel(
    title: '',
    content: SizedBox(),
  );
}
