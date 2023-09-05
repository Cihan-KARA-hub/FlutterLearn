import 'package:flutter/material.dart';
import 'package:set_state1/homePage.dart';
import 'package:set_state1/setState.dart';

// ignore: use_key_in_widget_constructors
class PagesVievLearn extends StatefulWidget {
  const PagesVievLearn({Key? key}) : super(key: key);
  @override
  State<PagesVievLearn> createState() => _PagesVievLearning();
}

class _PagesVievLearning extends State<PagesVievLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: PageController(viewportFraction: 1),
        children: const [StatelesLearn(), MyHomePage(title: 'DENEME 123')],
      ),
      floatingActionButton: Column(children: [
        Row(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.chevron_left,
                size: 25,
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const MyHomePage(
                        title: 'deneme',
                      );
                    },
                  ));
                },
                child: const Icon(
                  Icons.chevron_right,
                  size: 25,
                )),
          ],
        )
      ]),
    );
  }
}
