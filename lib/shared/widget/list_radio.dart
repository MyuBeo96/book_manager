import 'dart:async';

import 'package:flutter/material.dart';

class VietlottRadioListTile<T> extends StatefulWidget {
  final List<String> listRadio;
  final String groupValue;
  final Axis scrollDirection;
  final Color activeColor;
  final Color inactiveColor;
  final TextOverflow textOverflow;
  final TextStyle textStyle;
  final ValueChanged<T> onChanged;
  final double horizontalTitleGap;
  final double itemExtent;
  final bool isDisable;

  const VietlottRadioListTile({
    required this.listRadio,
    required this.groupValue,
    required this.onChanged,
    this.textStyle = const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    this.activeColor = Colors.blue,
    this.inactiveColor = const Color(0xFF8E8E93),
    this.textOverflow = TextOverflow.fade,
    this.scrollDirection = Axis.vertical,
    this.horizontalTitleGap = 16.0,
    this.itemExtent = 48.0,
    this.isDisable = false,
  });
  @override
  VietlottRadioListTileWidget createState() => VietlottRadioListTileWidget();
}

class VietlottRadioListTileWidget extends State<VietlottRadioListTile> {
  var _valueRadioStreamController = StreamController<String>();
  Stream<String> get valueStream => _valueRadioStreamController.stream;
  double _itemExtent = 48.0;
  double _horizontalTitleGap = 20.0;

  @override
  void initState() {
    super.initState();

    if (widget.scrollDirection == Axis.horizontal) {
      _itemExtent = ((widget.itemExtent < 100.0) ? 100.0 : widget.itemExtent);
      _horizontalTitleGap = ((widget.horizontalTitleGap >= 64.0)
          ? 64.0
          : widget.horizontalTitleGap);
    } else {
      _itemExtent = ((widget.itemExtent < 36.0) ? 36.0 : widget.itemExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    String groupValue = widget.groupValue;
    bool _isDisable = widget.isDisable;

    return Expanded(
      child: Opacity(
        opacity: _isDisable ? 0.6 : 1,
        child: StreamBuilder(
          stream: valueStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              groupValue = snapshot.data;
            }
            return ListView.builder(
              itemExtent: _itemExtent,
              padding: const EdgeInsets.all(0),
              scrollDirection: widget.scrollDirection,
              itemCount: widget.listRadio.length,
              itemBuilder: (context, index) {
                var value = widget.listRadio[index];
                return ListTileTheme(
                  horizontalTitleGap: _horizontalTitleGap,
                  child: RadioListTile(
                    // horizontalTitleGap: _horizontalTitleGap,
                    activeColor: widget.activeColor,
                    // inactiveColor: widget.inactiveColor,
                    title: Text(
                      value,
                      overflow: widget.textOverflow,
                      style: widget.textStyle,
                    ),
                    value: value,
                    groupValue: groupValue,
                    onChanged: !_isDisable
                        ? (value) {
                            _valueRadioStreamController.add(value!.toString());
                            widget.onChanged(value);
                          }
                        : null,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _valueRadioStreamController.close();
    super.dispose();
  }
}
