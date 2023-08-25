import '../../util/util.dart';
import '../screens.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: transparent,
          elevation: 0.0,
          actions: const [
            Icon(
              Icons.more_vert_rounded,
              color: white,
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(22),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "$username\n",
                              style: TextStyle(
                                fontFamily: montSemiBold,
                                fontSize: 16,
                                color: bgColor,
                              ),
                            ),
                            TextSpan(
                              text: "last seen",
                              style: TextStyle(
                                fontSize: 12,
                                color: bgColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        videoCallIcon,
                        color: white,
                      ),
                    ),
                    10.widthBox,
                    const CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        callIcon,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
              30.heightBox,
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Directionality(
                      textDirection:
                          index.isEven ? TextDirection.rtl : TextDirection.ltr,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            CustomCircleAvatar(
                              backgroundColor:
                                  index.isEven ? bgColor : primaryColor,
                              child: avatarImage,
                            ),
                            05.widthBox,
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: index.isEven ? bgColor : primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Align(
                                    alignment: index.isEven
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                    // child: FittedBox(
                                    //   fit: BoxFit
                                    //       .scaleDown, // Scale down the text if it's too wide
                                    child: Text(
                                      index.isEven ? msgUser0 : msgUser1,
                                      style: const TextStyle(
                                          fontFamily: mont,
                                          color: Colors.white),
                                    ),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            20.widthBox,
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child:
                                  "10:30 AM".text.color(gray).size(12).make(),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              10.heightBox,
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: primaryColor,
                          style: const TextStyle(
                            color: white,
                            fontSize: 14,
                          ),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              emojiIcon,
                              color: gray,
                            ),
                            suffixIcon: Icon(
                              attachmentIcon,
                              color: gray,
                            ),
                            border: InputBorder.none,
                            hintText: "Type your message...",
                            hintStyle: TextStyle(
                              // fontFamily: montSemiBold,
                              fontSize: 14,
                              color: gray,
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.widthBox,
                    const CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(
                        sendIcon,
                        color: white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
