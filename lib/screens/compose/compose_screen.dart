import '../../util/util.dart';

class ComposeScreen extends StatelessWidget {
  const ComposeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: "New Message".text.fontFamily(montSemiBold).make(),
        backgroundColor: transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          color: white,
        ),
        //using stream Builder for real time changes
        child: StreamBuilder(
          stream: StoreServices.getAllUsers(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(bgColor),
                ),
              );
            } else {
              return GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: snapshot.data!.docs.mapIndexed((currentValue, index) {
                  var doc = snapshot.data!.docs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      // padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: bgColor.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    NetworkImage("${doc['image_url']}"),
                              ),
                              20.widthBox,
                              "${doc['name']}"
                                  .text
                                  .fontFamily(montSemiBold)
                                  .color(txtColor)
                                  .make(),
                            ],
                          ),
                          10.heightBox,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                backgroundColor: bgColor,
                              ),
                              onPressed: () {
                                Get.to(
                                    () => ChatScreen(
                                          user: "${doc['name']}",
                                        ),
                                    transition: Transition.downToUp);
                              },
                              icon: const Icon(Icons.message),
                              label: "Message".text.make(),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
