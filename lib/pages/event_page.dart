import 'package:applicationdeconference/models/event_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  /*   final events = [
    /* {
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
      "speaker": "AWESSO Romaric",
      "date": "18h a 18h30",
      "subject": "A la decouverte des IA generatif",
      "avatar": "defendintelligence",
    } */
  ]; */

  @override
  Widget build(BuildContext context) {


    Future<void> showEventDetailsDialog(Event eventData) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Conference ${eventData.speaker}'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Image.asset("assets/images/${eventData.avatar}.jpg",height: 120,),
                  Text('Titre : ${eventData.subject}'),
                  Text('Speaker: ${eventData.speaker}'),
                  Text('Date de la conf: ${DateFormat.yMd().add_jm().format(eventData.timestamp.toDate())}'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.calendar_month),
                label: Text("Ajouter calendrier")
              ),
              SizedBox(width: 50,),
              TextButton(
                child: const Text('Fermer'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Center(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('events')
            .orderBy('date')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData) {
            return Text("Aucune conference");
          }

          List<Event> events = [];
          snapshot.data!.docs.forEach((data) {
            events.add(Event.fromData(data));
          });
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              final avatar = event.avatar;
              final speaker = event.speaker;
              final Timestamp timestamp = event.timestamp;
              final String date = DateFormat.yMd().add_jm().format(
                timestamp.toDate(),
              );
              final subject = event.subject;

              return Card(
                child: ListTile(
                  leading: Image.asset("assets/images/$avatar.jpg"),
                  title: Text('$speaker($date)'),
                  subtitle: Text('$subject'),
                  trailing: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                    showEventDetailsDialog(event);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
