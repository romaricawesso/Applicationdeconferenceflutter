/* import 'package:appconference/pages/event_page.dart'; */
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/logo.svg'),
          const Text(
            " Asynconf 2022",
            style: TextStyle(fontSize: 42, fontFamily: 'Poppins'),
          ),
          const Text(
            "Salon vrituel de l'information. Du 27 au 29 Octobre 2025",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          /* ElevatedButton.icon(
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStatePropertyAll(Color.fromARGB(255, 11, 124, 14))),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (_, __, ___) => EventPage()),
              );
            },
            label: const Text(
              "Afficher le planning",
              style: TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.calendar_month_sharp),
          ) */
        ],
      )
    );
  }
}
