import 'package:flutter/material.dart';
import 'package:practice/home_page.dart';

class LearningFlutterPage extends StatefulWidget {
  const LearningFlutterPage({Key? key}) : super(key: key);

  @override
  State<LearningFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearningFlutterPage> {
  bool isSwitch = false;
  bool? isCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('asd');
            },
            icon: const Icon(Icons.nat),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/cat.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.lightBlue,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Memotonic',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: isSwitch ? Colors.green : Colors.blue,
              ),
              onPressed: () {
                debugPrint('ele');
              },
              child: const Text('EB'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint('myau');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blueAccent,
                  ),
                  Text('Row Widget'),
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            Switch(
                value: isSwitch,
                onChanged: (bool newBool) {
                  setState(() {
                    isSwitch = newBool;
                  });
                }),
            Checkbox(
                value: isCheckBox,
                onChanged: (bool? newBool) {
                  setState(() {
                    isCheckBox = newBool;
                  });
                }),
            Image.network(
                'https://www.graphicsbeam.com/wp-content/uploads/2012/04/Duplicat-Cat-Funny-Background.jpg'),
            Image.asset('images/cat.jpg')
          ],
        ),
      ),
    );
  }
}
