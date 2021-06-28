// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
// Project imports:

class ApplicationBar extends StatelessWidget {
  final int numberOfSteps;
  final int currentStep;
  final String title;
  final double? width;

  const ApplicationBar({
    this.numberOfSteps = 3,
    this.currentStep = 1,
    this.title = '...',
    this.width,
  });

  List<Widget> generateStepRow(
    int numberOfSteps,
    int currentStep,
    double screenWidth,
  ) {
    List<Widget> listDesired = [];

    final completedStepDecor = BoxDecoration(
      color: Color(0xFFEB0D1E),
      shape: BoxShape.circle,
      border: Border.all(
        width: 3.0,
        color: Color(0xFFEB0D1E),
      ),
    );
    final currentStepDecor = BoxDecoration(
      color: Color(0xFFFEB0D1E),
      shape: BoxShape.circle,
    );
    final remainingStepDecor = BoxDecoration(
      color: Color(0xFFF7F7FC),
      shape: BoxShape.circle,
    );
    for (int i = 1; i <= numberOfSteps; i++) {
      BoxDecoration decoration;
      if (i < currentStep) {
        decoration = completedStepDecor;
      } else if (i == currentStep) {
        decoration = currentStepDecor;
      } else {
        decoration = remainingStepDecor;
      }
      listDesired.add(
        Container(
          margin: EdgeInsets.only(
              left: i == 1 ? 0 : 8.0, right: i == numberOfSteps ? 0 : 8.0),
          width: 24.0,
          height: 24.0,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            '$i',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: i <= currentStep ? Color(0xFFFFFFFF) : Color(0xFF8E8E93),
            ),
          ),
        ),
      );
      if (i < numberOfSteps) {
        double _couplingWidth = (screenWidth -
                (numberOfSteps * 24.0 + 32.0) -
                ((numberOfSteps + 3) * 8)) /
            (numberOfSteps - 1);
        listDesired.add(
          Container(
            width: _couplingWidth,
            height: 1.0,
            decoration: BoxDecoration(
              color: i < currentStep ? Color(0xFFEB0D1E) : Color(0xFFE5E5EA),
            ),
          ),
        );
      }
    }
    return listDesired;
  }

  @override
  Widget build(BuildContext context) {
    double _screenWith = width ?? MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        color: Color(0x00FFFFFF),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: generateStepRow(
                numberOfSteps,
                currentStep,
                _screenWith,
              ),
            ),
            // Container(
            //   width: _screenWith,
            //   child: Stack(
            //     alignment: AlignmentDirectional.centerEnd,
            //     children: [
            //       Row(children: [
            //         Expanded(
            //           child: Align(
            //             alignment: Alignment.center,
            //             child: Text(
            //               '$title',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w400,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ]),
            //     ],
            //   ),
            // ),
          ],
        ),
      )
    ]);
  }
}
