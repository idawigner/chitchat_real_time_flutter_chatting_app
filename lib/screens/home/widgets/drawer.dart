import '../../../util/util.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    backgroundColor: bgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(25),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              // Navigator.pop(context);
              // Alternatively, we can use GetX
              Get.back();
            },
            leading: const Icon(
              backIosIcon,
              color: white,
            ),
            title: settings.text.fontFamily(montSemiBold).white.make(),
          ),
          20.heightBox,
          CustomCircleAvatar(
            radius: 45,
            child: avatarImage,
          ),
          10.heightBox,
          username.text.white.fontFamily(montSemiBold).size(16).make(),
          20.heightBox,
          const Divider(
            color: primaryColor,
            height: 0.5,
          ),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
              drawerIconsList.length,
              (index) => ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(
                        () => const ProfileScreen(),
                        transition: Transition.downToUp,
                      );
                      break;
                    default:
                  }
                },
                leading: Icon(
                  drawerIconsList[index],
                  color: white,
                ),
                title: drawerListTitles[index]
                    .text
                    .fontFamily(montSemiBold)
                    .white
                    .make(),
              ),
            ),
          ),
          10.heightBox,
          const Divider(
            color: primaryColor,
            height: 0.5,
          ),
          10.heightBox,
          ListTile(
            onTap: () {},
            leading: const Icon(
              inviteIcon,
              color: white,
            ),
            title: invite.text.fontFamily(montSemiBold).white.make(),
          ),
          const Spacer(),
          ListTile(
            onTap: () async {
              await auth.signOut();
              Get.offAll(() => const WelcomeScreen());
            },
            leading: const Icon(
              logoutIcon,
              color: white,
            ),
            title: logout.text.fontFamily(montSemiBold).white.make(),
          ),
        ],
      ),
    ),
  );
}
