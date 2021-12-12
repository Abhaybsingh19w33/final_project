// import 'package:final_project/free/screens/chatPage.dart';
import 'package:final_project/models/chatMessageModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatBotPage extends StatelessWidget {
  ChatBotPage({Key? key}) : super(key: key);

  // List<ChatUsers> chatUsers = [
  //   ChatUsers(
  //     name: "Jane Russel",
  //     messageText: "Awesome Setup",
  //     imageURL: "images/userImage1.jpeg",
  //     time: "Now",
  //   ),
  //   ChatUsers(
  //     name: "Glady's Murphy",
  //     messageText: "That's Great",
  //     imageURL: "images/userImage2.jpeg",
  //     time: "Yesterday",
  //   ),
  //   ChatUsers(
  //     name: "Jorge Henry",
  //     messageText: "Hey where are you?",
  //     imageURL: "images/userImage3.jpeg",
  //     time: "31 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Philip Fox",
  //     messageText: "Busy! Call me in 20 mins",
  //     imageURL: "images/userImage4.jpeg",
  //     time: "28 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Debra Hawkins",
  //     messageText: "Thankyou, It's awesome",
  //     imageURL: "images/userImage5.jpeg",
  //     time: "23 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Jacob Pena",
  //     messageText: "will update you in evening",
  //     imageURL: "images/userImage6.jpeg",
  //     time: "17 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Andrey Jones",
  //     messageText: "Can you please share the file?",
  //     imageURL: "images/userImage7.jpeg",
  //     time: "24 Feb",
  //   ),
  //   ChatUsers(
  //     name: "John Wick",
  //     messageText: "How are you?",
  //     imageURL: "images/userImage8.jpeg",
  //     time: "18 Feb",
  //   ),
  //   ChatUsers(
  //     name: "Jane Russel",
  //     messageText: "Awesome Setup",
  //     imageURL: "images/userImage1.jpeg",
  //     time: "Now",
  //   ),
  //   ChatUsers(
  //     name: "Glady's Murphy",
  //     messageText: "That's Great",
  //     imageURL: "images/userImage2.jpeg",
  //     time: "Yesterday",
  //   ),
  //   ChatUsers(
  //     name: "Jorge Henry",
  //     messageText: "Hey where are you?",
  //     imageURL: "images/userImage3.jpeg",
  //     time: "31 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Philip Fox",
  //     messageText: "Busy! Call me in 20 mins",
  //     imageURL: "images/userImage4.jpeg",
  //     time: "28 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Debra Hawkins",
  //     messageText: "Thankyou, It's awesome",
  //     imageURL: "images/userImage5.jpeg",
  //     time: "23 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Jacob Pena",
  //     messageText: "will update you in evening",
  //     imageURL: "images/userImage6.jpeg",
  //     time: "17 Mar",
  //   ),
  //   ChatUsers(
  //     name: "Andrey Jones",
  //     messageText: "Can you please share the file?",
  //     imageURL: "images/userImage7.jpeg",
  //     time: "24 Feb",
  //   ),
  //   ChatUsers(
  //     name: "John Wick",
  //     messageText: "How are you?",
  //     imageURL: "images/userImage8.jpeg",
  //     time: "18 Feb",
  //   ),
  // ];

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

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
                                          child: Text(
                                            messages[index].messageContent,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
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
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
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
                                onPressed: () {},
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
}
