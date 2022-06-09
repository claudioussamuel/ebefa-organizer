import 'package:get/get.dart';

import '../constants/firebase.dart';
import '../models/UsersWhoBoughtTheTickectModel.dart';
import '../models/tickect.dart';

class UsersBoughtController extends GetxController {
  static UsersBoughtController instance = Get.find();
  RxList<UsersWhoBoughtTheTickectModel> userswhoboughttickes =
      RxList<UsersWhoBoughtTheTickectModel>([]);
  var ticketModel = TickectModel();

  @override
  void onReady() {
    super.onReady();
    userswhoboughttickes.bindStream(getUsersWhoBoughtTheTickets());
  }

  void getTicketModel(TickectModel tickectModel) {
    ticketModel = tickectModel;
  }

  // get users who bought the tickets
  Stream<List<UsersWhoBoughtTheTickectModel>> getUsersWhoBoughtTheTickets() {
    print('The id is ${ticketModel.id}');
    return firebaseFirestore
        .collection(
          'admin',
        )
        .doc(auth.currentUser?.uid)
        .collection('tickets')
        .doc(ticketModel.id)
        .collection('userwhoboughttickets')
        .snapshots()
        .map((query) => query.docs
            .map(
              (item) => UsersWhoBoughtTheTickectModel.fromMap(
                item.data(),
              ),
            )
            .toList());
  }
}
