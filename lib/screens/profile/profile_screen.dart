import '../../util/util.dart';
import '../screens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12.0),
              child: Column(
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
