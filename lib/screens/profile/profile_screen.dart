import '../../util/util.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //init profile controller
    var controller = Get.put(ProfileController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            title: profile.text.fontFamily(montBold).make(),
            backgroundColor: transparent,
            elevation: 0.0,
            actions: [
              TextButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.updateProfile(context);
                },
                child: "Save"
                    .text
                    .fontFamily(montSemiBold)
                    .color(primaryColor)
                    .make(),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12.0),
              //init future builder
              child: FutureBuilder(
                //passing current user id to the function to get the user document in firestore
                future: StoreServices.getUser(currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  //if data is loaded, show the widget
                  if (snapshot.hasData) {
                    //Setting snapshot into a variable for each access
                    //here doc[0] because it will contain only one document
                    var data = snapshot.data!.docs[0];

                    //setting values to the text controllers
                    controller.nameController.text = data['name'];
                    controller.phoneController.text = data['phone'];
                    controller.aboutController.text = data['about'];

                    return Column(
                      children: [
                        CustomCircleAvatar(
                          radius: 80,
                          child: Stack(
                            children: [
                              avatarImage,
                              const Positioned(
                                right: 0,
                                bottom: 20,
                                child: CircleAvatar(
                                  backgroundColor: primaryColor,
                                  child: Icon(
                                    cameraIcon,
                                    color: white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        20.heightBox,
                        const Divider(
                          color: primaryColor,
                          height: 1,
                        ),
                        10.heightBox,
                        ListTile(
                          leading: const Icon(
                            personIcon,
                            color: white,
                          ),
                          title: TextFormField(
                            //setting controller
                            controller: controller.nameController,
                            cursorColor: white,
                            style: const TextStyle(
                              color: white,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: const Icon(
                                editIcon,
                                color: white,
                              ),
                              label: name.text.make(),
                              isDense: true,
                              labelStyle: const TextStyle(
                                fontFamily: montSemiBold,
                                color: white,
                              ),
                            ),
                          ),
                          subtitle: namesub.text.size(12).gray400.make(),
                        ),
                        ListTile(
                          leading: const Icon(
                            infoIcon,
                            color: white,
                          ),
                          title: TextFormField(
                            //setting controller
                            controller: controller.aboutController,
                            cursorColor: white,
                            style: const TextStyle(
                              color: white,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: const Icon(
                                editIcon,
                                color: white,
                              ),
                              label: about.text.make(),
                              isDense: true,
                              labelStyle: const TextStyle(
                                fontFamily: montSemiBold,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            callIcon,
                            color: white,
                          ),
                          title: TextFormField(
                            //setting controller
                            controller: controller.phoneController,
                            readOnly: true,
                            cursorColor: white,
                            style: const TextStyle(
                              color: white,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: phone.text.make(),
                              isDense: true,
                              labelStyle: const TextStyle(
                                fontFamily: montSemiBold,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    //if data is not loaded yet show progress indicator
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(primaryColor),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
