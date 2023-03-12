import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Player(),
    );
  }
}

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _RootState();
}

class _RootState extends State<Player> {
  final player = AudioPlayer();
  double songtime = 0.0;
  bool isPlaying = false;
  List<String> songsPaths = [
    'assets/song1.mp3',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg'
  ];

  void checkOnPlaying() {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.resume();
      isPlaying = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    player.setSource(UrlSource(songsPaths[0]));
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.purpleAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                alignment: Alignment.center,
                child: Image.network(
                  'https://i.scdn.co/image/ab67616d0000b273df55e326ed144ab4f5cecf95',
                  loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : const LinearProgressIndicator();
                  },
                ),
              ),
              SizedBox(
                height: 100,
                child: FutureBuilder<Duration?>(
                    future: player.getDuration(),
                    builder: (context, futureSnapshot) {
                      return StreamBuilder<Duration>(
                          stream: player.onPositionChanged,
                          builder: (context, snapshot) {
                            return Slider(
                              value: snapshot.data != null
                                  // ignore: unnecessary_cast
                                  ? (snapshot.data!.inSeconds /
                                          (futureSnapshot.data!.inSeconds *
                                              0.01)) /
                                      100 as double
                                  : 0.0,
                              onChanged: (value) {
                                var a = futureSnapshot.data!.inSeconds;
                                player.seek(
                                    Duration(seconds: (a * value).round()));
                              },
                            );
                          });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_left)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          checkOnPlaying();
                        });
                      },
                      icon: Icon(isPlaying
                          ? Icons.pause_circle_outline
                          : Icons.play_arrow_outlined)),
                  const SizedBox(height: 10),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right))
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    player.onPositionChanged.distinct();
  }
}

class Person {
  AudioPlayer player = AudioPlayer();

  void display(){
    print('1');
  }
}

class S{

  String? name;

  S(String n){
    name = n;
  }
  Person person = Person();

  void Meter(){
    person.display();
  }

}
