import '../../util/util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var mediaheight = MediaQuery.of(context).size.height;
    // var mediawidth = MediaQuery.of(context).size.width;

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
          drawer: drawer(context),
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {},
            child: const Icon(
              addIcon,
            ),
          ),
          backgroundColor: bgColor,
          body: Column(
            children: [
              appbar(context, scaffoldKey),
              Expanded(
                child: Row(
                  children: [
                    tabbar(context),
                    tabbarview(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
