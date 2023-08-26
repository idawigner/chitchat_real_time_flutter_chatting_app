import '../../util/util.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var mediaheight = MediaQuery.of(context).size.height;
    // var mediawidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: white,
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        logo,
                        width: 120,
                      ),
                      appname.text
                          .size(28)
                          .fontFamily(bloggerBold)
                          .color(primaryColor)
                          .make(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 10.0,
                        // runSpacing: 10.0,
                        children: List.generate(listOfFeatures.length, (index) {
                          return Chip(
                            labelPadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 4),
                            backgroundColor: transparent,
                            side: const BorderSide(
                              color: gray400,
                            ),
                            label: listOfFeatures[index]
                                .text
                                .gray600
                                .semiBold
                                .make(),
                          );
                        }),
                      ),
                      20.heightBox,
                      tagline.text
                          .size(28)
                          .fontFamily(montExtraBold)
                          .color(bgColor)
                          .letterSpacing(1)
                          .make(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        // width: media.width * 0.8,
                        // width: media.width - 80,
                        width: context.screenWidth - 80,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const StadiumBorder(),
                            padding: edgeinsets16,
                          ),
                          onPressed: () {
                            Get.to(
                              () => const SignInScreen(),
                              transition: Transition.downToUp,
                            );
                          },
                          child: start.text.fontFamily(montSemiBold).make(),
                        ),
                      ),
                      15.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Developed by "
                              .text
                              .size(12)
                              .fontFamily(mont)
                              .color(bgColor)
                              .make(),
                          poweredby.text
                              .size(12)
                              .fontFamily(montSemiBold)
                              .color(primaryColor)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
