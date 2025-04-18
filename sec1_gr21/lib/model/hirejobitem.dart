import 'package:cloud_firestore/cloud_firestore.dart';

class hirejobItem {
  final String workname;
  final String name;
  final int salary;
  final GeoPoint location;
  final String addition;

  hirejobItem(
      this.workname, this.name, this.salary, this.location, this.addition);
}
