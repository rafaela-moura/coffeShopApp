import 'package:coffeapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:coffeapp/utils/app_palette.dart';

enum CoffeeType { Cappucino, Machiato, Latte, Americano }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CoffeeType? selectedCoffee;

  int viewscreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewscreen == 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 280,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppPalette.blacklight,
                                    AppPalette.blacklight2,
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: AppPalette.gray),
                                            ),
                                            Text(
                                              'Paises',
                                              style: TextStyle(
                                                  color: AppPalette.white),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          'assets/images/perfil.png',
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: 315,
                                      height: 52,
                                      decoration: BoxDecoration(
                                          color: AppPalette.blacklight2,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: SvgPicture.asset(
                                              'assets/icons/search.svg',
                                              width: 20,
                                              height: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: Container(
                                              width: 44,
                                              height: 44,
                                              decoration: BoxDecoration(
                                                  color: AppPalette.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: SvgPicture.asset(
                                                  'assets/icons/filter.svg',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 42, top: 15),
                              child: SizedBox(
                                height: 38,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    _buildCoffeeTypeButton(
                                        'Cappucino', CoffeeType.Cappucino),
                                    _buildCoffeeTypeButton(
                                        'Machiato', CoffeeType.Machiato),
                                    _buildCoffeeTypeButton(
                                        'Latte', CoffeeType.Latte),
                                    _buildCoffeeTypeButton(
                                        'Americano', CoffeeType.Americano),
                                  ],
                                ),
                              ),
                            ),
                            if (selectedCoffee != null) ...[
                              _buildCoffeeList(selectedCoffee!),
                            ],
                          ],
                        ),
                      ),
                      Positioned(
                        top: 190,
                        right: 0,
                        left: 40,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/promo.png',
                                width: 315,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 60,
                              right: 138,
                              child: Container(
                                  width: 180,
                                  height: 27,
                                  color: AppPalette.color2),
                            ),
                            Positioned(
                              top: 102,
                              right: 165,
                              child: Container(
                                  width: 149,
                                  height: 23,
                                  color: AppPalette.color2),
                            ),
                            Positioned(
                              right: 130,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppPalette.red,
                                      ),
                                      child: const Text('Promo',
                                          style: TextStyle(
                                              color: AppPalette.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                          textAlign: TextAlign.center),
                                    ),
                                    Text('Buy one get\n one FREE',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32,
                                          color: AppPalette.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          : null,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        width: 376,
        height: 99,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavigationBarItem(0, 'assets/icons/icon1.svg'),
            _buildNavigationBarItem(1, 'assets/icons/icon2.svg'),
            _buildNavigationBarItem(2, 'assets/icons/icon3.svg'),
            _buildNavigationBarItem(3, 'assets/icons/icon4.svg'),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeTypeButton(String text, CoffeeType type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCoffee = type;
        });
      },
      child: Container(
        width: 99,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedCoffee == type ? AppPalette.primary : AppPalette.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: selectedCoffee == type ? AppPalette.white : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeList(CoffeeType type) {
    switch (type) {
      case CoffeeType.Cappucino:
        return _buildCappucinoScreen();
      case CoffeeType.Machiato:
      case CoffeeType.Latte:
      case CoffeeType.Americano:
        return const SizedBox();
    }
  }

  Widget _buildCappucinoScreen() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              _buildDetail('assets/images/cappucino1.png', true, 4.53, 4.8),
              const SizedBox(width: 25),
              _buildDetail('assets/images/cappucino2.png', false, 3.90, 4.9)
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              _buildDetail('assets/images/cappucino3.png', true, 4.53, 4.5),
              const SizedBox(width: 25),
              _buildDetail('assets/images/cappucino4.png', false, 3.90, 4.0)
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDetail(String image, bool chocolate, double price, double note) {
    return Container(
      width: 149,
      height: 239,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.amber,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(image),
                  const Row(
                    children: [
                      Icon(Icons.star, color: AppPalette.yellow),
                      Text(
                        '4.8',
                        style: TextStyle(color: AppPalette.white),
                      ),
                    ],
                  )
                ],
              ),
              const Text(
                'Cappucino',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppPalette.blacklight3,
                ),
              ),
              Text(
                chocolate ? 'with Chocolate' : 'with Oat Milk',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppPalette.graylight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${price.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesApp.DETAILITEM);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppPalette.primary,
                      ),
                      child: const Icon(Icons.add, color: AppPalette.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBarItem(int index, String iconPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              viewscreen = index;
            });
          },
          child: SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            color: viewscreen == index
                ? AppPalette.primary
                : AppPalette.graylight2,
          ),
        ),
        if (viewscreen == index)
          Container(
            width: 10,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppPalette.primary,
            ),
          )
        else
          Container(),
      ],
    );
  }
}
