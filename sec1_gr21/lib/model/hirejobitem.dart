import 'package:cloud_firestore/cloud_firestore.dart';

class hirejobItem {
  final String workname;
  final String name;
  final int age;
  final GeoPoint location;
  final String addition;

  hirejobItem(this.workname, this.name, this.age, this.location, this.addition);
}
