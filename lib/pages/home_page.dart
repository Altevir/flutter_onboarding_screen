import 'package:flutter/material.dart';
import 'package:onboarding_screen/models/onboard.dart';
import 'package:onboarding_screen/services/fake_service.dart';
import 'package:onboarding_screen/widgets/custom_indicator.dart';
import 'package:onboarding_screen/widgets/onboard_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  final List<Onboard> listOnboard = FakeService.items;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: listOnboard.length,
              itemBuilder: (BuildContext context, int index) => OnboardItem(
                image: listOnboard[index].image,
                title: listOnboard[index].title,
                description: listOnboard[index].description,
              ),
              controller: _pageController,
              onPageChanged: (index) => setState(() {
                _pageIndex = index;
              }),
            ),
            Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 26, top: 10, right: 16, bottom: 16),
                  child: Row(
                    children: [
                      ...List.generate(
                        listOnboard.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: CustomIndicator(isSelected: index == _pageIndex),
                        ),
                      ),
                      const Spacer(),
                      (_pageIndex < listOnboard.length - 1)
                          ? IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              iconSize: 40,
                              color: Colors.white,
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                            )
                          : SizedBox(
                              height: 60,
                              width: 60,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'GO!',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shape: const CircleBorder(),
                                  elevation: 0,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
