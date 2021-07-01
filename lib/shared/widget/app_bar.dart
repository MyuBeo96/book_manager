// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
// Project imports:

class ApplicationBar extends StatelessWidget {
  final List<String> listTitle;
  final int currentStep;
  final double? width;
  final Color textColorActive;
  final Color textColor;
  final Color currentStepActiveColor;
  final Color currentStepColor;
  final Color titleColorActive;
  final Color titleColor;
  final Color boxCricleColorActive;
  final Color boxCricleColor;
  final double? textSize;
  final double? titleSize;

  const ApplicationBar({
    this.currentStep = 0,
    required this.listTitle,
    this.width,
    this.textColorActive = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF8E8E93),
    this.currentStepActiveColor = const Color(0xFFEB0D1E),
    this.currentStepColor = const Color(0xFFE5E5EA),
    this.titleColorActive = const Color(0xFFEB0D1E),
    this.titleColor = const Color(0xFF636366),
    this.boxCricleColorActive = const Color(0xFFEB0D1E),
    this.boxCricleColor = const Color(0xFFF7F7FC),
    this.textSize = 12.0,
    this.titleSize = 10.0,
  });

  List<Widget> generateStepRow(
    List<String> listTitle,
    int currentStep,
    double screenWidth,
  ) {
    List<Widget> listDesired = [];

    final completedStepDecor = BoxDecoration(
      color: currentStepActiveColor,
      shape: BoxShape.circle,
      border: Border.all(
        width: 3.0,
        color: boxCricleColorActive,
      ),
    );

    final remainingStepDecor = BoxDecoration(
      color: boxCricleColor,
      shape: BoxShape.circle,
    );
    for (int i = 0; i < listTitle.length; i++) {
      BoxDecoration decoration;
      if (i < currentStep) {
        decoration = completedStepDecor;
      } else {
        decoration = remainingStepDecor;
      }

      listDesired.add(
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _dashWidget(
                      i: i,
                      index: 0,
                      screenWidth: screenWidth,
                      currentStep: currentStep),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    width: 24.0,
                    height: 24.0,
                    alignment: Alignment.center,
                    decoration: decoration,
                    child: Text(
                      '${i + 1}',
                      style: TextStyle(
                        fontSize: textSize,
                        color: i < currentStep ? textColorActive : textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  _dashWidget(
                      i: i,
                      index: listTitle.length - 1,
                      screenWidth: screenWidth,
                      currentStep: currentStep - 1),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                listTitle[i],
                style: TextStyle(
                  fontSize: titleSize,
                  color: i < currentStep ? titleColorActive : titleColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    return listDesired;
  }

  Widget _dashWidget({
    required int i,
    required int index,
    required double screenWidth,
    required int currentStep,
  }) {
    return (i == index)
        ? Container(
            width: (screenWidth / (listTitle.length * 2)) - 20.0,
          )
        : Container(
            width: (screenWidth / (listTitle.length * 2)) - 20.0,
            height: 1.0,
            decoration: BoxDecoration(
              color:
                  i < currentStep ? currentStepActiveColor : currentStepColor,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double _screenWith = width ?? constraints.maxWidth;
        return Container(
          width: _screenWith,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: generateStepRow(
              listTitle,
              currentStep,
              _screenWith,
            ),
          ),
        );
      },
    );
  }
}
