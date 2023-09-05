import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Denemefull extends StatefulWidget {
  Denemefull({super.key});

  @override
  State<Denemefull> createState() => _DenemefullState();
}

class _DenemefullState extends State<Denemefull> {
  CountDownController _countDownController = CountDownController();
  int _duraction = 0;
  int _counter = 0;
  void _deincrementCounter() {
    setState(() {
      _counter = _counter - 10;
      if (_counter < 0) {
        _counter = 0;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 11, 31),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(19, 48, 8, 17),
        centerTitle: true,
        title: const _textDecoration(
          title: 'Rasion Project',
          size1: 30,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const _globalPdading(index1: 50),
            const Row(
              verticalDirection: VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_circle_filled,
                    color: Color.fromARGB(255, 114, 23, 108), size: 35),
                Padding(padding: EdgeInsets.only(left: 20)),
                _textDecoration(title: 'UI Desgn', size1: 20),
              ],
            ),
            const _globalPdading(index1: 50),
            CircularCountDownTimer(
              textStyle: const TextStyle(
                fontSize: 33.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              width: 250,
              controller: _countDownController,
              height: 250,
              duration: _duraction,
              isReverse: true,
              strokeWidth: 15.0,
              isReverseAnimation: true,
              autoStart: false,
              initialDuration: 0,
              fillColor: const Color.fromARGB(255, 114, 23, 108),
              ringColor: const Color.fromARGB(19, 186, 23, 58),
              onComplete: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Geri sayım tamamlandı!')));
              },
            ),
            const _globalPdading(index1: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    _deincrementCounter();
                    _duraction = _counter;
                  },
                  tooltip: 'Deincrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _incrementCounter();
                    _duraction = _counter;
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const _globalPdading(index1: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _duraction = _counter;
                      });
                      _countDownController.restart(duration: _counter);
                    },
                    tooltip: 'start',
                    child: const Icon(Icons.play_circle_filled)),
                FloatingActionButton(
                    onPressed: () {
                      _countDownController.pause();
                    },
                    tooltip: 'stop',
                    child: const Icon(Icons.pause)),
                FloatingActionButton(
                    onPressed: () {
                      _countDownController.resume();
                    },
                    tooltip: 'resume',
                    child: const Icon(Icons.restart_alt_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _globalPdading extends StatelessWidget {
  const _globalPdading({super.key, required this.index1});
  final double index1;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: index1));
  }
}

class _textDecoration extends StatelessWidget {
  const _textDecoration({super.key, required this.title, required this.size1});
  final String title;
  final double size1;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: Colors.white, fontSize: size1),
    );
  }
}
