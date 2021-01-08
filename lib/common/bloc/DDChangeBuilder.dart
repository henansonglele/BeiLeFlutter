

import 'package:flutter/material.dart';

class DDChangeBuilder<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context) builder;
  final T value;

  DDChangeBuilder(this.value, this.builder);

  @override
  State<StatefulWidget> createState() => _ChangeBuilderState();
}

class _ChangeBuilderState extends State<DDChangeBuilder> {
  VoidCallback valueListener;

  _ChangeBuilderState() {
    valueListener = () {
      setState(() {});
    };
  }


  @override
  void initState() {
    super.initState();
    widget.value.addListener(valueListener);
  }

  @override
  void dispose() {
    widget.value.removeListener(valueListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}