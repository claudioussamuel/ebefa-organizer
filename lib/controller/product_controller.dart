import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/firebase.dart';
import '../models/tickect.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ticketController extends GetxController {
  TextEditingController eventName = TextEditingController();
  TextEditingController eventLocation = TextEditingController();
  TextEditingController eventCity = TextEditingController();
  TextEditingController eventAbout = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController tickectPrice = TextEditingController();
  TextEditingController accountName = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  var selectedBank = 'MTN'.obs;
  RxString sendAccountNumber = ''.obs;
  static ticketController instance = Get.find();
  RxList<TickectModel> tickets = RxList<TickectModel>([]);

  String collection = "admin";
  //final id = auth.currentUser?.uid;
  File? file;

  String? fileNameA;
  String? fileName;

  @override
  void onReady() {
    super.onReady();
    tickets.bindStream(getAllAdminTickets());
  }

  // getting all tickets by the admin only
  Stream<List<TickectModel>> getAllAdminTickets() => firebaseFirestore
      .collection(
        collection,
      )
      .doc(auth.currentUser?.uid)
      .collection('tickets')
      .snapshots()
      .map(
        (query) => query.docs
            .map(
              (item) => TickectModel.fromJson(
                item.data(),
              ),
            )
            .toList(),
      );

  // add tickects to admin side only
  Future<void> addTicket(TickectModel tickectModel) {
    return firebaseFirestore
        .collection(collection)
        .doc(auth.currentUser?.uid)
        .collection(
          'tickets',
        )
        .doc(tickectModel.id)
        .set(tickectModel.toMap());
  }

  //addd tickets to user side
  Future<void> addAllTicket(TickectModel tickectModel) {
    return firebaseFirestore
        .collection(
          'tickets',
        )
        .doc(tickectModel.id)
        .set(tickectModel.toMap());
  }

  // delete for user
  Future<void> removeTickectsUser(TickectModel tickectModel) {
    return firebaseFirestore
        .collection(
          'tickets',
        )
        .doc(tickectModel.id)
        .delete();
  }

  // delete for admin

  Future<void> removeTickectsAdmin(TickectModel tickectModel) {
    return firebaseFirestore
        .collection(collection)
        .doc(auth.currentUser?.uid)
        .collection(
          'tickets',
        )
        .doc(tickectModel.id)
        .delete();
  }
  // // delete from continue some other day
  // Future<void> removeTickectsUserWhoBought(TickectModel tickectModel) {
  //   return firebaseFirestore
  //       .collection('users')
  //       .doc(auth.currentUser?.uid)
  //       .collection(
  //         'tickets',
  //       )
  //       .doc(tickectModel.id)
  //       .delete();
  // }

  // delete image from firebase storage

  Future<void> removeImageFromFirebaseStorage(TickectModel tickectModel) async {
    try {
      firebaseStorage
          .ref(
            'files/${tickectModel.path}',
          )
          .delete();
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future getImage() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg'],
    );

    final path = results!.files.single.path;
    fileName = results.files.single.name;

    file = File(path!);
    fileNameA = fileName;
    print(path);
    print(fileName);
  }

  UploadTask? uploadFile() {
    try {
      final ref = firebaseStorage.ref('files/$fileNameA');
      return ref.putFile(file!);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  String? getString() {
    return fileName;
  }
}
