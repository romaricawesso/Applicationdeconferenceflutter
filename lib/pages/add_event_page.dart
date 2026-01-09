import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();
    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom Conference',
                  hintText: 'Entre le nom de la conference',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tu dois completer ce texte";
                  }
                  return null;
                },
                controller: confNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom du speaker',
                  hintText: 'Entre le nom du speaker',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tu dois completer ce texte";
                  }
                  return null;
                },
                controller: speakerNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                items: [
                  DropdownMenuItem(value: 'talk', child: Text("Talk show")),
                  DropdownMenuItem(value: 'demo', child: Text("demo code")),
                  DropdownMenuItem(value: 'partner', child: Text("Partner")),
                ],
                decoration: InputDecoration(border: OutlineInputBorder()),
                value: selectedConfType,
                onChanged: (value) {
                  setState(() {
                    selectedConfType = value!;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DateTimeField(
                value: selectedConfDate,
                decoration: const InputDecoration(
                  labelText: 'Enter Time',
                  border: OutlineInputBorder(),
                  ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                onChanged: (DateTime? value) {
                  print(value);
                  setState(() {
                    selectedConfDate = value!;
                });
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final confName = confNameController.text;
                    final speakerName = speakerNameController.text;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Envoi en cours ...")),
                    );
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
                child: Text("Envoyer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
