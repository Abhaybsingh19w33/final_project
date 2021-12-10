import 'package:flutter/material.dart';

class Startpage extends StatelessWidget {
  const Startpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Stack will stack image and button
      home: Stack(children: [
        // Stretching image all over the screen
        Image.asset(
          'image/startPage.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        // Centering the button
        Center(
          // Column is used to align the button at right position
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 320,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.pinkAccent.shade100,
                  minimumSize: const Size(130, 41),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Let's go!",
                  style: TextStyle(fontSize: 20),
                )),
          ]),
        )
      ]),
    );
  }
}
