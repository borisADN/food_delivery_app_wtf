import 'package:application/constants.dart';
import 'package:application/models/onboarding_model.dart';
import 'package:application/screens/main_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: imageBackground,
            child: Image.asset(
              'assets/images/food_pattern.png',
              color: imageBackground2,
              repeat: ImageRepeat.repeatY,
            ),
          ),
          Positioned(
            top: -80,
            right: 0,
            left: 0,
            child: Image.asset('assets/images/chef.png'),
          ),
          Positioned(
            top: 139,
            right: 25,
            child: Image.asset('assets/images/leaf.png', width: 80),
          ),
          Positioned(
            top: 390,
            right: 30,
            child: Image.asset('assets/images/chili.png', width: 80),
          ),
          Positioned(
            top: 210,
            left: -5,
            child: Image.asset(
              'assets/images/ginger.png',
              width: 70,
              height: 70,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: CustomClip(),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 160,

                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder:
                            (context, index) => Column(
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Baloo',
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data[index]['title1'],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: data[index]['title2'],
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  data[index]['description']!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                        itemCount: data.length,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(data.length, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: index == _currentPage ? 20 : 10,
                          height: 10,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color:
                                index == _currentPage
                                    ? Colors.orange
                                    : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        //go to home screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      color: Colors.red,
                      height: 65,
                      minWidth: 250,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Commencer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 30);
    path.quadraticBezierTo(size.width / 2, -30, 0, 30); // (x1, y1, x2, y2)
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
