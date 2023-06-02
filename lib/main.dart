import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

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
  List<Map> animals = [
    {'image': 'pictures/cat.jpg', 'sound': 'audio/cat.mp3'},
    {'image': 'pictures/cow.jpg', 'sound': 'audio/cow.mp3'},
    {'image': 'pictures/donkey.jpg', 'sound': 'audio/donkey.mp3'},
    {'image': 'pictures/elephant.jpg', 'sound': 'audio/elephant.mp3'},
    {'image': 'pictures/frog.jpg', 'sound': 'audio/frog.mp3'},
    {'image': 'pictures/goat.jpg', 'sound': 'audio/goat.mp3'},
    {'image': 'pictures/horse.jpg', 'sound': 'audio/horse.mp3'},
    {'image': 'pictures/lion.jpg', 'sound': 'audio/lion.mp3'},
    {'image': 'pictures/peacock.jpg', 'sound': 'audio/peacock.mp3'},
    {'image': 'pictures/pig.jpg', 'sound': 'audio/pig.mp3'},
    {'image': 'pictures/wolf.jpg', 'sound': 'audio/wolf.mp3'},
  ];

  final player = AudioPlayer();

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
