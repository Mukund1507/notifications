import 'package:flutter/material.dart';
import '../models/notification.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({Key? key, required this.currNotification})
      : super(key: key);
  final NotificationClass currNotification;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.currNotification.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: (widget.currNotification.read == false)
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        trailing: (widget.currNotification.read == false)
            ? GestureDetector(
                onTap: () {
                  widget.currNotification.readNotification();
                  setState(() {});
                },
                child: const Text('read',
                    style: TextStyle(color: Colors.blueAccent)))
            : const Text('seen'),
      ),
    );
  }
}
