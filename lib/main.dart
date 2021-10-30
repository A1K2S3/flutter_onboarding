import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const onboardingScreenData = [
  {
    "image": "assets/images/Screen1.svg",
    "heading": "Gain total control of your money",
    "subHeading": "Become your own money manager and make every cent count"
  },
  {
    "image": "assets/images/Screen2.svg",
    "heading": "Know where your money goes",
    "subHeading":
        "Track your transaction easily, with categories and financial report "
  },
  {
    "image": "assets/images/Screen3.svg",
    "heading": "Planning ahead",
    "subHeading": "Setup your budget for each category so you in control"
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingScreenData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(onboardingScreenData[index]["image"]!),
                        const SizedBox(height: 41),
                        Text(
                          onboardingScreenData[index]["heading"]!,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          onboardingScreenData[index]["subHeading"]!,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0XFF91919F),
                                  ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: currentPage == 0 ? 16 : 8,
                height: currentPage == 0 ? 16 : 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: currentPage == 0
                      ? const Color(0XFF7F3DFF)
                      : const Color(0XFFEEE5FF),
                ),
              ),
              const SizedBox(width: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: currentPage == 1 ? 16 : 8,
                height: currentPage == 1 ? 16 : 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: currentPage == 1
                      ? const Color(0XFF7F3DFF)
                      : const Color(0XFFEEE5FF),
                ),
              ),
              const SizedBox(width: 12),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: currentPage == 2 ? 16 : 8,
                height: currentPage == 2 ? 16 : 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: currentPage == 2
                      ? const Color(0XFF7F3DFF)
                      : const Color(0XFFEEE5FF),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFF7F3DFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(17),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0XFFFCFCFC),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFFEEE5FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(17),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0XFF7F3DFF),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
