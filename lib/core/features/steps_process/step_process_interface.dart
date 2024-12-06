import 'package:doc_care_core/core/features/steps_process/layout_steps_model.dart';
import 'package:flutter/material.dart';

abstract class StepProcess {
  LayoutStepsModel content(BuildContext context);
  bool onNext(BuildContext context);
  bool onBack(BuildContext context);
  // Widget? nextIcon = const Icon(Icons.arrow_forward);
  String? nextText() => null;
  // Widget? backIcon = const Icon(Icons.arrow_back);
  String? backText() => null;
}
