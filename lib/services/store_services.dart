import '../util/util.dart';

class StoreServices {
  //get user data
  static getUser(String id) {
    return firebaseFirestore
        .collection(collectionUser)
        .where('id', isEqualTo: id)
        .get();
  }
}
