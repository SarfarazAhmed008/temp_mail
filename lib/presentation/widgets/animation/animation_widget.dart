import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget{
  const AnimationWidget({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> widthAnimation;
  late Animation<double> heightAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: const Duration(
        milliseconds: 1500
    ), vsync: this);

    widthAnimation = Tween<double>(begin: 0.4,end: 1.0)
        .animate(CurvedAnimation(
        curve: Curves.easeInOut, parent: animationController
    ));

    heightAnimation = Tween<double>(begin: 20.0,end: 50.0)
        .animate(CurvedAnimation(
        curve: Curves.easeInOut, parent: animationController
    ));

    animationController.addListener((){
      setState((){});
    });

    animationController.forward();

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthAnimation.value,
      height: heightAnimation.value,
      child: widget.child
    );
  }
}
