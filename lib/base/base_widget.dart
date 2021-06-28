import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class PageContainer extends StatelessWidget {
  late final String title;
  late final Widget child;

  late final List<SingleChildWidget> bloc;
  late final List<SingleChildWidget> di;

  PageContainer({
    required this.title,
    required this.bloc,
    required this.di,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TxtStyle.textBlue(),
        ),
      ),
      body: MultiProvider(
        providers: [
          ...di,
          ...bloc,
        ],
        child: child,
      ),
    );
  }
}
