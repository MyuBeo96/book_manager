// Flutter imports:
import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';
// Package imports:
// Project imports:

class ApplicationBar extends StatelessWidget {
  final List<String> listTitle;
  final int currentStep;
  final double? width;

  const ApplicationBar({
    this.currentStep = 0,
    required this.listTitle,
    this.width,
  });

  List<Widget> generateStepRow(
    List<String> listTitle,
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

    final remainingStepDecor = BoxDecoration(
      color: Color(0xFFF7F7FC),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (i == 0)
                      ? Container(
                          width: ((screenWidth / listTitle.length) / 2) - 20.0,
                        )
                      : Container(
                          width: ((screenWidth / listTitle.length) / 2) - 20.0,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: i < currentStep
                                ? Color(0xFFEB0D1E)
                                : Color(0xFFE5E5EA),
                          ),
                        ),
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
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: i < currentStep
                            ? Color(0xFFFFFFFF)
                            : Color(0xFF8E8E93),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  (i == (listTitle.length - 1))
                      ? Container(
                          width: ((screenWidth / listTitle.length) / 2) - 20.0,
                        )
                      : Container(
                          width: ((screenWidth / listTitle.length) / 2) - 20.0,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: i < (currentStep - 1)
                                ? Color(0xFFEB0D1E)
                                : Color(0xFFE5E5EA),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                height: 40.0,
                child: Text(
                  listTitle[i],
                  style: TextStyle(
                    fontSize: dimen_16,
                    fontWeight: FontWeight.w400,
                    color: i < currentStep ? Color(0xFFEB0D1E) : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return listDesired;
  }

  @override
  Widget build(BuildContext context) {
    double _screenWith = width ?? MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      color: Color(0x00FFFFFF),
      child: Row(
        children: generateStepRow(
          listTitle,
          currentStep,
          _screenWith,
        ),
      ),
    );
  }
}
