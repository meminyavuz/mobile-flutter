import 'package:flutter/material.dart';
import 'package:untitled/Repository/Messages_Repository.dart';

class Messages extends StatefulWidget {
  final MessageRepository messageRepository;
  const Messages(this.messageRepository,{super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  @override
  void initState() {
    widget.messageRepository.newMessageCount = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('DigiNova Messages'),
          backgroundColor: Colors.green,
      ),
      body: Stack(
        children:[
          // Background Image
          Positioned.fill(
            child: Image.network('https://media.licdn.com/dms/image/C4D0BAQE9tzqrAoU5oA/company-logo_200_200/0/1630465534843?e=2147483647&v=beta&t=bsQsKs0GYfDuHeVRboLb3ug_81qGnk1iRjcdYFpxujQ', // Arka plan resminin dosya yolu
              fit: BoxFit.none,
            ),
          ),
            Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: widget.messageRepository.messages.length,
                  itemBuilder: (context,index){

                    return MessageView(widget.messageRepository.messages[widget.messageRepository.messages.length - index - 1]);
                  },
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: const Row(
                  children: [
                    Expanded(child: TextField()),
                    ElevatedButton(
                      onPressed: sendButtonPressed,
                      child: Text("Send"),
                    )
                  ],
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
}

class MessageView extends StatelessWidget {
  final Message message;
  const MessageView(this.message, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.person == 'Ali' ? Alignment.centerRight: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey,width: 2),
            color: Colors.green.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(message.text),
          ),
        ),
      ),
    );
  }
}
void sendButtonPressed() {
  print("Send");
}