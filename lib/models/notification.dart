import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class NotificationClass {
  String id;
  String title;
  bool read;
  NotificationClass(
      {required this.read, required this.title, required this.id});

  void readNotification() async {
    read = true;
    await _firebaseFirestore.collection('notifications').doc(id).update({
      'id': id,
      'title': title,
      'read': read,
    });
  }
}

Future<List<NotificationClass>> getNotifications() async {
  List<NotificationClass> notifications = [];
  var data = await _firebaseFirestore.collection('notifications').get();
  var notificationsData = data.docs.asMap();
  for (int i = 0; i < data.docs.length; i++) {
    var currentNotification = NotificationClass(
      read: notificationsData[i]?['read'],
      title: notificationsData[i]?['title'],
      id: notificationsData[i]?['id'],
    );

    notifications.add(currentNotification);
  }
  return notifications;
}

Future addNotification(String title) async {
  var data = await _firebaseFirestore.collection('notifications').get();
  String id = 'notification${data.docs.length + 1}';
  await _firebaseFirestore.collection('notifications').doc(id).set({
    'id': id,
    'title': title,
    'read': false,
  });
}
