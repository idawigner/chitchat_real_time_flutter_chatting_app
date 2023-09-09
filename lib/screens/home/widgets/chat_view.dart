import '../../../util/util.dart';

Widget chatview(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 4),
          );
        },
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () {
                Get.to(
                  () => const ChatScreen(
                    user: "Demo UN",
                  ),
                  transition: Transition.rightToLeft,
                );
              },
              leading: CustomCircleAvatar(
                radius: 20,
                child: avatarImage,
              ),
              title: "John Doe".text.size(16).color(bgColor).semiBold.make(),
              subtitle: "Message is here...".text.make(),
              trailing: Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: null,
                  icon: const Icon(
                    Icons.access_time_filled_rounded,
                    size: 16,
                    color: gray400,
                  ),
                  label: "last seen".text.gray400.size(12).make(),
                ),
              ),
            ),
          );
        }),
  );
}
