import 'package:etlaafinalproject/utils/colors.dart';
import 'package:etlaafinalproject/utils/constants.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> with SingleTickerProviderStateMixin {

  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {


    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();


    Future.delayed(const Duration(seconds: 8), () {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Productslistscreen()));
    });
    super.initState();
  }




  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.hintColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  height: Dimens.twoForty,
                  width: Dimens.twoForty,
                  gaplessPlayback: true,
                  fit: BoxFit.fill,
                  AppImages.appLogo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
