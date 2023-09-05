import 'package:flutter/material.dart';

class NavigatLearn extends StatefulWidget {
  const NavigatLearn({super.key});

  @override
  State<NavigatLearn> createState() => _NavigatLearn();
}

class _NavigatLearn extends State<NavigatLearn> {
  NameAction titled = NameAction('CİHAN', 'KARA', 133, 99, 10);
  int c = 0;
  bool toogle = false;
  void _following(bool deg) {
    setState(() {
      if (deg == true) {
        titled.followers = titled.followers + 1;
      } else if (deg == false) {
        titled.followers = titled.followers - 1;
      }
    });
  }

  void colorMang() {
    setState(() {
      if (_favIconColor == Colors.grey) {
        _favIconColor = Colors.red;
      } else {
        _favIconColor = Colors.grey;
      }
    });
  }

  Color _favIconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    var ff = ['Unfollow', 'Folowing'];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text('${titled.named}  ${titled.surname}'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              padding: const EdgeInsets.all(0),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  border: Border.all(color: Colors.black38, width: 5),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                'https://www.donanimhaber.com/images/images/haber/151519/src_340x1912xyapay-zek-resim-olusturuyor.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              '${titled.named}  ${titled.surname}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const _spaceConatiner(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.mail),
                ),
                IconButton(
                  onPressed: () {
                    colorMang();
                  },
                  icon: const Icon(Icons.favorite),
                  color: _favIconColor,
                  highlightColor: Colors.red,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        toogle = !toogle;
                      });
                    },
                    icon: toogle
                        ? const Icon(Icons.alarm_off)
                        : const Icon(Icons.access_alarm)),
              ],
            ),
            const _spaceConatiner(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _followColmn(context),
                Column(
                  children: [
                    Text('${titled.followers.toString()} ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontFamily: 'RobotoMono', fontSize: 30)),
                    TextButton(
                      onPressed: () {
                        if (c == 0) {
                          _following(true);
                          ++c;
                        } else if (c == 1) {
                          _following(false);
                          c--;
                        }
                      },
                      child: Text(ff[c],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontFamily: 'RobotoMono', fontSize: 20)),
                    )
                  ],
                ),
              ],
            ),
            const _spaceConatiner(),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 9),
                ),
                Text(
                  _Information.Information,
                ),
                Text(
                  _Information.Information1,
                ),
                Text(_Information.Information2),
                Text(_Information.Information3)
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _followColmn(BuildContext context) {
    return Column(
      children: [
        Text('${titled.post.toString()} ',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontFamily: 'RobotoMono', fontSize: 30)),
        Text('Post',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontFamily: 'RobotoMono', fontSize: 20)),
      ],
    );
  }
}

class _spaceConatiner extends StatelessWidget {
  const _spaceConatiner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 1,
      color: Colors.black45,
      margin: const EdgeInsets.only(top: 10),
    );
  }
}

class NameAction {
  String named, surname;
  int post, followers, following;
  NameAction(
      this.named, this.surname, this.post, this.followers, this.following);
}

class _Information {
  static String Information = 'Firat Universitesi ';
  static String Information1 = 'Bilgisayar Bilimleri ';
  static String Information2 = 'Mobil Developer';
  static String Information3 = 'Türkiye / Amasya ';
}
