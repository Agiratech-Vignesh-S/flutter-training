import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class Chat_page extends StatefulWidget {
  const Chat_page({Key? key}) : super(key: key);

  @override
  State<Chat_page> createState() => _Chat_pageState();
}

class _Chat_pageState extends State<Chat_page> {
  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Expanded(
              child: GroupedListView<Message, String>(
                useStickyGroupSeparators: true,
                floatingHeader: true,
                reverse: true,
                order: GroupedListOrder.DESC,
                elements: messages,
                groupBy: (message) => DateTime(
                    message.date.year, message.date.month, message.date.day)
                    .toString(),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(DateFormat.yMMMd().format(message.date)),
                      ),
                    ),
                  ),
                ),
                itemBuilder: ((context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                    elevation: 7,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(message.text),
                    ),
                  ),
                )),
              )),
        ],

    );
  }
}
class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;
  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
List<Message> messages = [
  Message(
      text: 'Hi vignesh',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false),
  Message(
      text: 'who r u',
      date: DateTime.now().subtract(Duration(days: 1)),
      isSentByMe: true),
  Message(
      text: 'I"m  too busy',
      date: DateTime.now().subtract(Duration(days: 2)),
      isSentByMe: true),
  Message(
      text: 'Hi Raj',
      date: DateTime.now().subtract(Duration(minutes: 10)),
      isSentByMe: false),
  Message(
      text: 'working in progress',
      date: DateTime.now().subtract(Duration(days: 4)),
      isSentByMe: false),
  Message(
      text: 'Hi mass madhan',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true),
  Message(
      text: 'Hi vignesh',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false),
  Message(
      text: 'Hi preveen',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true),
  Message(
      text: 'working in progress',
      date: DateTime.now().subtract(Duration(days: 4)),
      isSentByMe: false),
  Message(
      text: 'Hi karthi',
      date: DateTime.now().subtract(Duration(days: 6)),
      isSentByMe: true),
  Message(
      text: 'Hi ram',
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false),
  Message(
      text: 'Hi Surya',
      date: DateTime.now().subtract(Duration(days: 7)),
      isSentByMe: true),
].reversed.toList();