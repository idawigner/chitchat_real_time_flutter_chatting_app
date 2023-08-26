import '../util/util.dart';

class ProfileController extends GetxController {
  //text editing controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  //update profile method

  updateProfile(context) async {
    //setting store var to the document of our current user
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);

    //Now updating the data
    await store.set({
      'name': nameController.text,
      'about': aboutController.text,
    }, SetOptions(merge: true));

    VxToast.show(context, msg: "Profile updated successfully!");
  }
}
