import 'package:chitchat/controllers/auth_controller.dart';

import '../../util/util.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isInvalid = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    // var mediaheight = MediaQuery.of(context).size.height;
    // var mediawidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Close the keyboard when tapped outside of a text field
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: transparent,
            elevation: 0.0,
            leading: GestureDetector(
              child: const Icon(
                backIcon,
                color: bgColor,
              ),
              onTap: () {
                Navigator.of(context)
                    .pop(); // Navigate back with custom transition
              },
            ),
            centerTitle: true,
            title: letsconnect.text.color(bgColor).fontFamily(montBold).make(),
          ),
          body: Container(
            padding: edgeinsets16,
            child: Column(
              children: [
                //username Field

                TextFormField(
                  controller: controller.usernameController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: gray,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      prefixIcon: const Icon(
                        personIcon,
                        color: primaryColor,
                      ),
                      alignLabelWithHint: true,
                      labelText: "Username",
                      hintText: "Ali",
                      labelStyle: const TextStyle(
                        color: gray,
                        fontWeight: FontWeight.bold,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: primaryColor,
                      )),
                ),
                20.heightBox,

                //Phone Number Field

                TextFormField(
                  controller: controller.phoneController,
                  cursorColor: primaryColor,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  onFieldSubmitted: (value) {
                    setState(() {
                      if (value.isEmpty) {
                        _isInvalid = false;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color:
                            _isInvalid ? Colors.redAccent : Colors.grey[400]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: _isInvalid
                            ? Colors.redAccent
                            : const Color(0xffA67F8E),
                      ),
                    ),
                    prefixIcon: Icon(
                      phoneIcon,
                      color: _isInvalid ? Colors.redAccent : primaryColor,
                    ),
                    alignLabelWithHint: true,
                    labelText: "Phone Number",
                    prefixText: "+92 ",
                    hintText: "3001234567",
                    labelStyle: TextStyle(
                      color: _isInvalid ? Colors.redAccent : gray,
                      fontWeight: FontWeight.bold,
                    ),
                    errorText: _isInvalid ? "Invalid number!" : null,
                    floatingLabelStyle: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _isInvalid = value.length != 10;
                    });
                  },
                ),
                10.heightBox,
                otp.text.size(16).color(bgColor).semiBold.make(),

                //OTP Field

                Obx(
                  () => Visibility(
                    visible: controller.isOtpSent.value,
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          6,
                          (index) => SizedBox(
                            width: 56,
                            child: TextField(
                              controller: controller.otpController[index],
                              cursorColor: primaryColor,
                              maxLength: 1,
                              onChanged: (value) {
                                if (value.length == 1 && index <= 5) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontFamily: montBold,
                                color: primaryColor,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                //to hide length counter
                                counter: const SizedBox.shrink(),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: "*",
                                hintStyle: const TextStyle(
                                  color: gray,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: context.screenWidth - 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: () async {
                        // FocusScope.of(context).unfocus();

                        if (controller.isOtpSent.value == false) {
                          controller.isOtpSent.value = true;
                          await controller.sendOtp();
                        } else {
                          await controller.verifyOtp(context);
                        }
                        // print(controller.phoneController.text);
                      },
                      child: next.text.make(),
                    ),
                  ),
                ),
                30.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
