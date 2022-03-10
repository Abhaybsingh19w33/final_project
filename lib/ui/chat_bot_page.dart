import 'package:final_project/models/chat_message_model.dart';
import 'package:final_project/utils/retreiveData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import '../models/article.dart';
import '../utils/chatbotAi.dart';
import 'article_detail_page.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({Key? key}) : super(key: key);

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  var predValue = "";

  final _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  List<ChatMessage> messages = [];

  Future<void> predData(String sentence) async {
    final interpreter = await Interpreter.fromAsset('model3.tflite');

    String inp = sentence;

    List seq = sequence(inp);

    var zeroList = List<double>.filled(100, 0).reshape([1, 100]);

    for (int i = 0; i < seq.length; i++) {
      zeroList[0][i] = seq[i].toDouble();
    }

    var input = zeroList;
    var output = List.filled(134, 0).reshape([1, 134]);

    interpreter.run(input, output);

    double temp2 = output[0][0];
    int index = 0;
    for (int i = 0; i < 134; i++) {
      if (output[0][i] > temp2) {
        temp2 = output[0][i];
        index = i;
      }
    }

    if (output[0][0] == 0) {
      setState(() {
        predValue = "";
      });
    }

    setState(() {
      predValue = listOfLaws[index - 1].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Stack(children: [
              Image.asset(
                'image/homePage.jpg',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              ),
              Column(
                children: [
                  Container(
                    // spacing at the top
                    padding: const EdgeInsets.all(30.0),
                    // Header
                    child: Row(children: const [
                      Center(
                          child: Text(
                        "MAHILA",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                          child: Text(
                        "SHASHAKTIKARAN",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ]),
                  ),
                  // Box with text
                  Stack(children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 42,
                        child: Container(
                          color: Colors.deepOrange[100],
                        )),
                    SizedBox(
                      height: 27,
                      child: Container(
                        child: const Center(
                            child: Text(
                          "Any Questions? Ask Chat Bot!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                        color: Colors.deepOrange.shade200,
                      ),
                    ),
                  ]),
                  // chat box
                  Column(
                    children: [
                      SizedBox(
                        height: 585,
                        child: SingleChildScrollView(
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ListView.builder(
                                  itemCount: messages.length,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.only(
                                          left: 14,
                                          right: 14,
                                          top: 10,
                                          bottom: 10),
                                      child: Align(
                                        alignment:
                                            (messages[index].messageType ==
                                                    "receiver"
                                                ? Alignment.topLeft
                                                : Alignment.topRight),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color:
                                                (messages[index].messageType ==
                                                        "receiver"
                                                    ? Colors.deepOrange.shade200
                                                    : Colors.blue[200]),
                                          ),
                                          padding: const EdgeInsets.all(16),
                                          child: (messages[index].messageType ==
                                                  "sender"
                                              ? Text(
                                                  messages[index]
                                                      .messageContent,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                )
                                              : TextButton(
                                                  child: Text(
                                                    messages[index]
                                                        .messageContent,
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () async {
                                                    await getPage(predValue);
                                                  },
                                                )),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // message box with send button
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 10, top: 10),
                          height: 60,
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: _textController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      hintText: "Type a message...",
                                      hintStyle:
                                          TextStyle(color: Colors.black54),
                                      border: InputBorder.none),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              // send button icon
                              FloatingActionButton(
                                onPressed: () async {
                                  if (_textController.text.isNotEmpty) {
                                    await predData(_textController.text);

                                    var userInput = ChatMessage(
                                        messageContent: _textController.text,
                                        messageType: "sender");

                                    setState(() {
                                      messages.add(userInput);
                                    });

                                    var userInput2 = ChatMessage(
                                        messageContent: predValue,
                                        messageType: "receiver");

                                    setState(() {
                                      messages.add(userInput2);
                                    });

                                    _textController.clear();
                                  }
                                },
                                child: const Icon(
                                  Icons.send,
                                  color: Colors.deepOrange,
                                  size: 30,
                                ),
                                backgroundColor: Colors.white,
                                elevation: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]))));
  }

  Future getPage(String sentence) async {
    Articles articleData = await getDataFromDb(sentence);

    if (articleData.title == "null not found") {
      return const Text("No article found");
    }

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ArticleDetailPage(articleId: articleData.article_id)));
  }
}
