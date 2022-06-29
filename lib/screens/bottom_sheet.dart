import 'package:flutter/material.dart';
import '../models/notification.dart';

class Bottomsheet extends StatelessWidget {
  const Bottomsheet({Key? key, required this.setThingsOnHomePage})
      : super(key: key);

  final Function setThingsOnHomePage;

  @override
  Widget build(BuildContext context) {
    String title = '';
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      child: TextField(
        onChanged: (val) {
          title = val;
        },
        onSubmitted: (val) async {
          await addNotification(title);
          setThingsOnHomePage();
          Navigator.pop(context);
        },
        decoration: const InputDecoration(hintText: 'Enter the Title'),
      ),
    );
  }
}
