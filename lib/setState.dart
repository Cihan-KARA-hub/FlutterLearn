
import 'package:flutter/material.dart';

class StatelesLearn extends StatefulWidget {
  const StatelesLearn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateFullLearn();
}

class _StateFullLearn extends State<StatelesLearn> {
  int count = 0;

  void _icrementAndDeicremt(bool deg) {
    setState(() {
      if (deg == true) {
        count = count + 1;
      } else {
        count = count - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            count.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [_icrementButton(), _deicremntMethodButton()],
        ));
  }

  FloatingActionButton _icrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _icrementAndDeicremt(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deicremntMethodButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: FloatingActionButton(
        onPressed: () {
          _icrementAndDeicremt(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}
