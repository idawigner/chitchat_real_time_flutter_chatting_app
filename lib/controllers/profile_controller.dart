import 'dart:io';

import '../util/util.dart';

class ProfileController extends GetxController {
  //text editing controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  //variables for image
  var imgpath = ''.obs;
  var imglink = '';

  //update profile method
  updateProfile(context) async {
    //setting store var to the document of our current user
    var store =
        firebaseFirestore.collection(collectionUser).doc(currentUser!.uid);

    //Now updating the data
    await store.set({
      'name': nameController.text,
      'about': aboutController.text,
      //it will be empty if the image is not selected
      'image_url': imglink,
    }, SetOptions(merge: true));

    VxToast.show(context, msg: "Profile updated successfully!");
  }

//image picking method
  pickImage(context, source) async {
    var galleryStatus = await Permission.storage.request();
    var cameraStatus = await Permission.camera.request();
    // print("Gallery permission status: $galleryStatus");
    // print("Camera permission status: $cameraStatus");

    if (cameraStatus.isGranted && galleryStatus.isGranted) {
      try {
        final img =
            await ImagePicker().pickImage(source: source, imageQuality: 80);

        imgpath.value = img!.path;
        VxToast.show(context, msg: "Image selected.");
      } on PlatformException catch (e) {
        VxToast.show(context, msg: e.toString());
      }
    } else {
      VxToast.show(context, msg: "Permission denied.");
    }
  }

  //upload image to fire storage
  uploadImage() async {
    if (imgpath.isEmpty) {
      print("No image selected to upload.");
      return;
    }

    var name = basename(imgpath.value);
    var destination = 'images/${currentUser!.uid}/$name';
    Reference ref = FirebaseStorage.instance.ref().child(destination);

    try {
      await ref.putFile(File(imgpath.value));
      var downloadURL = await ref.getDownloadURL();
      imglink = downloadURL;
      print("Image uploaded successfully. URL: $downloadURL");
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
//   //image picking method
//   pickImage(context, source) async {
//     if (Platform.isAndroid) {
//       final androidInfo = await DeviceInfoPlugin().androidInfo;
//       if (androidInfo.version.sdkInt <= 34) {
//         /// use [Permissions.storage.status]
//         getStoragePermission(context, source);
//       } else {
//         /// use [Permissions.photos.status]
//         getPhotosPermission(context, source);
//       }
//     }
//   }

//   // Storage Permission getting method for android 30 and above
//   getStoragePermission(context, source) async {
//     // Request photo gallery permission
//     var galleryStatus = await Permission.storage.request();
//     print("Gallery permission status: $galleryStatus");
//     // Request camera permission
//     var cameraStatus = await Permission.camera.request();
//     print("Camera permission status: $cameraStatus");

//     if (cameraStatus.isGranted && galleryStatus.isGranted) {
//       try {
//         final img =
//             await ImagePicker().pickImage(source: source, imageQuality: 80);

//         imgpath.value = img!.path;
//       } on PlatformException catch (e) {
//         VxToast.show(context, msg: e.toString());
//       }
//     } else {
//       VxToast.show(context, msg: "Permission denied.");
//     }
//   }

//   // Photos Permission getting method for android 29 and below
//   getPhotosPermission(context, source) async {
//     // Request photo gallery permission
//     var photosStatus = await Permission.photos.request();
//     print("Photos permission status: $photosStatus");
//     // Request camera permission
//     var cameraStatus = await Permission.camera.request();
//     print("Photos permission status: $cameraStatus");

//     if (cameraStatus.isGranted && photosStatus.isGranted) {
//       try {
//         final img =
//             await ImagePicker().pickImage(source: source, imageQuality: 80);

//         imgpath.value = img!.path;
//       } on PlatformException catch (e) {
//         VxToast.show(context, msg: e.toString());
//       }
//     } else {
//       VxToast.show(context, msg: "Permission denied.");
//     }
//   }
}
