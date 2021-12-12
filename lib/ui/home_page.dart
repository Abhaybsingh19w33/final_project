import 'package:final_project/ui/chat_bot_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        // Stretching image all over the screen
        Image.asset(
          'image/homePage.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 650,
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 11,
                                ),
                                Container(
                                  color: Colors.brown,
                                  height: 26,
                                  child: const Text(
                                    "----",
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.brown,
                                minimumSize: const Size(130, 26),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Introduction",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 11,
                                ),
                                Container(
                                  color: Colors.brown,
                                  height: 26,
                                  child: const Text(
                                    "----",
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.brown,
                                minimumSize: const Size(130, 26),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Why it is Necessary",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 11,
                                ),
                                Container(
                                  color: Colors.brown,
                                  height: 26,
                                  child: const Text(
                                    "----",
                                    style: TextStyle(color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white,
                                primary: Colors.brown,
                                minimumSize: const Size(130, 26),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Things to know about",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                Expanded(
                  flex: 4,
                  child: Column(children: [
                    const SizedBox(
                      height: 683,
                    ),
                    Image.asset(
                      'image/chatbotIcon.jpg',
                      fit: BoxFit.none,
                      alignment: Alignment.center,
                    ),
                    const SizedBox(height: 0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.pinkAccent.shade100,
                          minimumSize: const Size(130, 26),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChatBotPage();
                          }));
                        },
                        child: const Text(
                          "Chat Bot",
                          style: TextStyle(fontSize: 20),
                        )),
                  ]),
                ),
              ],
            )
          ],
        ),
        // -----------------------------------------------------------------
        // now stacking search bar, search button, search text and output card
        Column(
          children: [
            const SizedBox(height: 90),
            Row(
              children: [
                Center(
                    child: Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 270,
                      child: TextField(
                        cursorColor: Colors.brown,
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                        decoration: InputDecoration(
                          hintText: 'Search Bar',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          labelStyle: TextStyle(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 4,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.brown,
                              width: 4,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                const SizedBox(width: 15),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.deepOrange.shade100,
                        primary: Colors.brown,
                        minimumSize: const Size(50, 50),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.search, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Search",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.red.shade200,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: const SizedBox(
                child: Text("This is a card, results will appear here"),
                width: 270,
                height: 350,
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
