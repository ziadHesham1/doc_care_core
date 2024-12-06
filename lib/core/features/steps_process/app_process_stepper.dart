import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theming/app_colors.dart';

class AppProcessStepper extends StatelessWidget {
  final List<String> steps;
  final int currentStep;
  const AppProcessStepper({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double lineLength = steps.length == 2
        ? width / 2
        : steps.length == 3
            ? width / 6
            : 40;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: EasyStepper(
          activeStepBackgroundColor: AppColors.primary,
          activeStepTextColor: AppColors.secondary,
          activeStep: currentStep,
          stepShape: StepShape.circle,
          activeStepBorderType: BorderType.normal,
          defaultStepBorderType: BorderType.normal,
          stepBorderRadius: 11,
          borderThickness: 3,
          stepRadius: 20,
          activeStepIconColor: AppColors.primary,
          unreachedStepBorderColor: Colors.grey.shade300,
          showLoadingAnimation: false,
          internalPadding: 14,
          padding: EdgeInsets.all(14.h),
          lineStyle: LineStyle(
            lineType: LineType.normal,
            activeLineColor: AppColors.primary,
            lineThickness: 2,
            unreachedLineColor: Colors.grey.shade300,
            lineLength: lineLength,
          ),
          steps: List.generate(
            steps.length,
            (index) => EasyStep(
              customStep: Text(
                '${index + 1}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: currentStep == index
                      ? AppColors.secondary
                      : currentStep < index + 1
                          ? AppColors.grey
                          : Colors.white,
                ),
              ),
              enabled: false,
              customTitle: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    steps[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.2,
                    ),
                    textScaleFactor: 0.8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
