import 'package:chitchat/util/util.dart';

class CustomCircleAvatar extends StatelessWidget {
  final Color backgroundColor;
  final double radius;
  final Widget child;

  const CustomCircleAvatar({
    super.key,
    this.backgroundColor =
        primaryColor, // Default background color if not specified
    this.radius = 20.0, // Default radius if not specified
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      radius: radius,
      child: child,
    );
  }
}
