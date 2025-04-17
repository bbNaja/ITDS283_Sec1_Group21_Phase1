import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get user stream
  //List<Map<String,dynamic>> is sth like this
  // {
  //   'email': aa@gmail.com,
  //   'id':..
  // }
  Stream<List<Map<String,dynamic>> getUsersStream(){
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
      //go through individual user
      final user = doc.data();

      return user;
      }).toList();
    });
  }

  //send msg

  //get msg
}
