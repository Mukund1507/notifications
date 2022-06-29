import 'package:flutter/material.dart';
import 'bottom_sheet.dart';
import '../widgets/notification_tile.dart';
import '../models/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setThings();
  }

  List<NotificationClass> notifications = [];
  void setThings() async {
    notifications = await getNotifications();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (ctx, index) {
          var currNotification = notifications[index];
          return NotificationTile(currNotification: currNotification);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (ctx) {
                return Bottomsheet(setThingsOnHomePage: setThings);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
