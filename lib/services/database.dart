import 'package:cloud_firestore/cloud_firestore.dart';
import '';

class DatabaseMethods {
  Future<void> addUserInfo(userData,String nodename) async {
    Firestore.instance.collection("users").document(nodename).setData(userData).catchError((e) {
      print(e.toString());
    });
  }



  Future<void> addDoctorInfo(userData) async {
    Firestore.instance.collection("appliedDoctors").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> checkUserInfo(userData) async {

  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }


getDoctorInfo(String email) async {
    return Firestore.instance
        .collection("Doctors")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }


  searchByName(String searchField) {
    return Firestore.instance
        .collection("Doctors")
        .where('userName', isEqualTo: searchField)
        .getDocuments();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async{
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  Future<void> addMessage(String chatRoomId, chatMessageData){

    Firestore.instance.collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
          print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

}
