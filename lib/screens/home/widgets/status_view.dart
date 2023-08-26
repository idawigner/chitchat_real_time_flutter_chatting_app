import '../../../util/util.dart';

Widget statusview(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: primaryColor,
            child: avatarImage,
          ),
          title: "My Status"
              .text
              .fontFamily(montSemiBold)
              .size(14)
              .color(txtColor)
              .make(),
          subtitle: "Tap to add status updates".text.gray400.size(12).make(),
        ),
        20.heightBox,
        recentupdates.text.fontFamily(montSemiBold).color(txtColor).make(),
        20.heightBox,
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.greenAccent,
                      width: 3,
                    ),
                  ),
                  child: CustomCircleAvatar(
                    backgroundColor: Vx.randomColor,
                    radius: 25,
                    child: avatarImageBg,
                  ),
                ),
                title: username.text
                    .fontFamily(montSemiBold)
                    .size(14)
                    .color(txtColor)
                    .make(),
                subtitle: "Today, 09:11 PM".text.gray400.size(12).make(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
