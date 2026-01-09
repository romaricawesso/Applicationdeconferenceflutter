import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final events = [
    {
      "speaker": "Lior chamla",
      "date": "13h a 13h30",
      "subject": "le code legacy",
      "avatar": "lior",
    },
    {
      "speaker": "Damien",
      "date": "17h a 13h30",
      "subject": "git blame --no-offense",
      "avatar": "damien",
    },
    {
      "speaker": "Lior chamla",
      "date": "18h a 18h30",
      "subject": "A la decouverte des IA generatif",
      "avatar": "defendintelligence",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          final avatar = event['avatar'];
          final speaker = event['speaker'];
          final date = event['date'];
          final subject = event['subject'];

          return Card(
            child: ListTile(
              leading: Image.asset("assets/images/$avatar.jpg"),
              title: Text('$speaker($date)'),
              subtitle: Text('$subject'),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
