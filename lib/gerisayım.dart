import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int startCount = 0;
  int currentCount = 0;

  TextEditingController _controller = TextEditingController();

  CountDownController _countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geri Sayım Uygulaması'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Başlangıç Sayısı: $startCount',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Başlangıç Sayısını Girin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  startCount = int.tryParse(_controller.text) ?? 0;
                  currentCount = startCount;
                });

                _countDownController.restart(duration: startCount);
              },
              child: Text('Geri Sayımı Başlat'),
            ),
            SizedBox(height: 20),
            CircularCountDownTimer(
              width: 150,
              height: 150,
              duration: currentCount,
              controller: _countDownController,
              ringColor: const Color.fromARGB(255, 218, 214, 214),
              fillColor: Colors.blue,
              strokeWidth: 10.0,
              textStyle: TextStyle(fontSize: 40, color: Colors.black),
              isReverse: false,
              isReverseAnimation: true,
              autoStart: false,
              onComplete: () {
                // Geri sayım tamamlandığında yapılacak işlemler burada
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Geri sayım tamamlandı!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
