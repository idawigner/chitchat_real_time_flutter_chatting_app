import '../../util/util.dart';
import '../screens.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                TextFormField(
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
                        phoneIcon,
                        color: primaryColor,
                      ),
                      alignLabelWithHint: true,
                      labelText: "Phone Number",
                      prefixText: "+92 ",
                      hintText: "3001234567",
                      labelStyle: const TextStyle(
                        color: gray,
                        fontWeight: FontWeight.bold,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: primaryColor,
                      )),
                ),
                10.heightBox,
                otp.text.size(16).color(bgColor).semiBold.make(),
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
                      onPressed: () {
                        Get.to(
                          () => const HomeScreen(),
                          transition: Transition.downToUp,
                        );
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
