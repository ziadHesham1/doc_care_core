import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/buttons/app_elevated_button.dart';
import 'app_process_stepper.dart';
import '../../widgets/buttons/app_text_button.dart';
import 'step_process_interface.dart';

class StepsScreen extends StatefulWidget {
  final List<StepProcess> steps;
  const StepsScreen({
    super.key,
    required this.steps,
  });

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  int currentStepIndex = 1;

  @override
  Widget build(BuildContext context) {
    var currentStep = widget.steps[currentStepIndex - 1];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SizedBox(
              height: 100.h,
              child: AppProcessStepper(
                currentStep: currentStepIndex - 1,
                steps:
                    widget.steps.map((e) => e.content(context).title).toList(),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                SizedBox(height: 20.h),
                currentStep.content(context).content,
              ],
            ))),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            if (currentStep.onBack(context))
              Expanded(
                flex: 1,
                child: AppTextButton(
                  onPressed: _onBackButtonPressed,
                  label: currentStep.backText() ?? 'back',
                ),
              ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: AppElevatedButton(
                onPressed: _onActionButtonPressed,
                label: currentStep.nextText() ?? 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onActionButtonPressed() {
    var onNext = widget.steps[currentStepIndex - 1].onNext(context);
    if (onNext && currentStepIndex < widget.steps.length) {
      setState(() {
        currentStepIndex++;
      });
    }
  }

  _onBackButtonPressed() {
    if (currentStepIndex > 1) {
      setState(() {
        currentStepIndex--;
      });
    }
  }
}
