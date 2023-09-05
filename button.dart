import 'package:flutter/material.dart';

class Companents_Learn extends StatelessWidget {
  final String _titles = 'deneme sürümü';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(_titles),
              dense: true,
              onTap: () {},
              subtitle: const Text('yama notlarınade bugün...'),
              leading: const Icon(
                Icons.access_alarm_sharp,
                color: Colors.lightGreen,
                size: 40.0,
              ),
              trailing: const Icon(
                Icons.account_circle_rounded,
                color: Colors.blue,
                size: 40.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
