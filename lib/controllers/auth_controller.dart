import 'package:chitchat/screens/home/home.dart';

import '../util/util.dart';

class AuthController extends GetxController {
  // text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());

  // variables
  var isOtpSent = false.obs;

  // variables
  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = '';

  //Send OTP method
  sendOtp() async {
    phoneVerificationCompleted = (PhoneAuthCredential credential) async {
      // Sign the user in (or link) with the auto-generated credential
      await auth.signInWithCredential(credential);
    };

    phoneVerificationFailed = (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    };

    phoneCodeSent = (String verificationId, int? resendToken) {
      verificationID = verificationId;
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+92${phoneController.text}",
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //Verify OTP
  verifyOtp(context) async {
    String otp = '';

    //getting all TextFields data
    for (var i = 0; i < otpController.length; i++) {
      otp += otpController[i].text;
    }

    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otp);
      //getting user
      final User? user =
          (await auth.signInWithCredential(phoneAuthCredential)).user;

      if (user != null) {
        //store user into database
        DocumentReference store =
            FirebaseFirestore.instance.collection(collectionUser).doc(user.uid);
        await store.set({
          'id': user.uid,
          'name': usernameController.text.toString(),
          'phone': phoneController.text.toString(),
        });

        // showing toast of Login
        VxToast.show(context, msg: loggedin);

        // navigating to HomeScreen removing all previous routes
        Get.offAll(() => const HomeScreen(),
            transition: Transition.rightToLeft);
      }
    } catch (e) {
      print(e);
      VxToast.show(context, msg: e.toString());
    }
  }
}
