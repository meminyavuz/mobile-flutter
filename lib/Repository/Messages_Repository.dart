class MessageRepository{
  final List<Message> messages = [
    Message('Hi','Ali',DateTime.now().subtract(const Duration(minutes: 3))),
    Message('Are you there?','Ali',DateTime.now().subtract(const Duration(minutes: 2))),
    Message('Yes','Ayşe',DateTime.now().subtract(const Duration(minutes: 1))),
    Message('How are you?','Ayşe',DateTime.now()),
  ];

  int newMessageCount = 4;
}

class Message{
  String text;
  String person;
  DateTime time;

  Message(this.text,this.person,this.time);
}