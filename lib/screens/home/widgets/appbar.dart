import '../../../util/util.dart';

Widget appbar(BuildContext context, GlobalKey<ScaffoldState> key) {
  // var mediaheight = MediaQuery.of(context).size.height;
  // var mediawidth = MediaQuery.of(context).size.width;
  return Container(
    padding: const EdgeInsets.only(right: 12),
    color: white,
    height: 80,
    // height: mediaheight * 0.1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            height: 80,
            width: 90,
            // height: mediaheight * 0.1,
            // width: mediawidth * 0.25,
            child: const Icon(
              settingsIcon,
              color: white,
            ),
          ),
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                  text: "$appname\n",
                  style: TextStyle(
                    fontFamily: montBold,
                    fontSize: 22,
                    color: primaryColor,
                  )),
              TextSpan(
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      width: 24, // Adjust the indentation value as needed
                    ),
                  ),
                  TextSpan(
                    text: connectinglives,
                    style: TextStyle(
                      fontFamily: mont,
                      fontSize: 12,
                      color: gray,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        CustomCircleAvatar(
          radius: 25,
          child: avatarImage,
        ),
      ],
    ),
  );
}
