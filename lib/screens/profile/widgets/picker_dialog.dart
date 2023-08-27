import '../../../util/util.dart';

Widget pickerdialog(context, controller) {
  var listTitle = [camera, gallery, cancel];
  var icons = [cameraIcon, galleryIcon, cancelIcon];

  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Container(
      padding: const EdgeInsets.all(12),
      color: bgColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          source.text.fontFamily(montSemiBold).white.make(),
          const Divider(),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
              3,
              (index) => ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.back();
                      controller.pickImage(context, ImageSource.camera);
                      break;
                    case 1:
                      Get.back();
                      controller.pickImage(context, ImageSource.gallery);

                      break;
                    case 2:
                      Get.back();
                      break;
                    default:
                  }
                },
                leading: Icon(
                  icons[index],
                  color: white,
                ),
                title: listTitle[index].text.white.make(),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
