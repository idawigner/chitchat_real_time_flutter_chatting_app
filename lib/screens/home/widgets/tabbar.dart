import '../../../util/util.dart';

Widget tabbar(BuildContext context) {
  // var mediaheight = MediaQuery.of(context).size.height;
  // var mediawidth = MediaQuery.of(context).size.width;
  return const RotatedBox(
    quarterTurns: 3,
    child: TabBar(
      indicator: BoxDecoration(),
      labelColor: white,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      unselectedLabelColor: gray400,
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w300,
        letterSpacing: 1,
      ),
      tabs: [
        Tab(
          text: chats,
        ),
        Tab(
          text: status,
        ),
        Tab(
          text: camera,
        ),
      ],
    ),
  );
}
