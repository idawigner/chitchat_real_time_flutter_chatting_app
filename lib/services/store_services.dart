import '../util/util.dart';

class StoreServices {
  //get user data
  static getUser(String id) {
    return firebaseFirestore
        .collection(collectionUser)
        .where('id', isEqualTo: id)
        .get();
  }

  //get all users from our FB users Collection
  static getAllUsers() {
    return firebaseFirestore.collection(collectionUser).snapshots();
  }
}
