import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:codechef/models/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage>
    with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(-1.5,0),
    end: const Offset(0, 0.0),
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.elasticIn,
  ));

  @override
  void initState() {
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Consumer<DataProvider>(
          builder: (context, DataProvider dataProvider, _) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeTransition(
                    opacity: animationController,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Here's What I know",
                            style: GoogleFonts.saira(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Lottie.asset(
                          'assets/display_page.json',
                          height: deviceSize.height * 0.4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SlideTransition(
                        position: offsetAnimation,
                        child: Text(
                          "Name: ${dataProvider.getName}",
                          style: GoogleFonts.saira(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: offsetAnimation,
                        child: Text(
                          "Email: ${dataProvider.getEmail}",
                          style: GoogleFonts.saira(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: offsetAnimation,
                        child: Text(
                          "Age: ${dataProvider.getAge}",
                          style: GoogleFonts.saira(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
