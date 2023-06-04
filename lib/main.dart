import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List animals = [];
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    loadAnimals().then((loadedAnimals) {
      setState(() {
        animals = loadedAnimals;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Sounds'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => player.play(AssetSource(animals[index]['sound'])),
            child: Image.asset(animals[index]['image'], fit: BoxFit.cover),
          );
        },
      ),
    );
  }
}

Future<List> loadAnimals() async {
  String jsonString = await rootBundle.loadString('assets/animals.json');
  return json.decode(jsonString);
}
