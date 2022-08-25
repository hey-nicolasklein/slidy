import 'package:flutter/material.dart';
import 'package:slidy/slidy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff495BFF)),
      ),
      home: const SlidyPage(),
    );
  }
}

class SlidyPage extends StatefulWidget {
  const SlidyPage({Key? key}) : super(key: key);

  @override
  State<SlidyPage> createState() => _SlidyPageState();
}

class _SlidyPageState extends State<SlidyPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slidy Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slidy(
              displayArrowBackgroundElement: true,
              shimmer: true,
              nobIcon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              height: 200,
              width: 60,
              action: () {
                setState(() {
                  counter = counter + 1;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text('$counter', style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
