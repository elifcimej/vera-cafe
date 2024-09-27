import 'package:flutter/material.dart';
import 'package:vera_cafe/fastfood_page.dart';
import 'package:vera_cafe/icecekler_page.dart';
import 'package:vera_cafe/kahvaltilar_page.dart';
import 'package:vera_cafe/makarnalar_page.dart';
import 'package:vera_cafe/salatalar_page.dart';
import 'package:vera_cafe/tatlilar_page.dart';
import 'package:vera_cafe/tavuk_menuler_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required String title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/breakfast.jpg',
      'assets/images/burger.jpg',
      'assets/images/chicken.jpg',
      'assets/images/pasta.jpg',
      'assets/images/salad.jpg',
      'assets/images/cake.jpg',
      'assets/images/drinks.jpg',
    ];
    List<String> names = [
      'KAHVALTILAR',
      'FAST FOOD',
      'TAVUK MENÜLER',
      'MAKARNALAR',
      'SALATALAR',
      'TATLILAR',
      'İÇECEKLER'
    ];
    Map<String, Widget> menuItems = {
      'KAHVALTILAR': KahvaltilarPage(),
      'FAST FOOD': FastfoodPage(),
      'TAVUK MENÜLER': TavukMenulerPage(),
      'MAKARNALAR': MakarnalarPage(),
      'SALATALAR': SalatalarPage(),
      'TATLILAR': TatlilarPage(),
      'İÇECEKLER': const IceceklerPage(),
    };
    return Scaffold(
      backgroundColor: const Color(0xFFFAECD6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAECD6),
        title: Text(
          'VERA CAFE ~ MENU',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.95,
          heightFactor: 0.95,
          //ekranın genişliğinin 100 de 80ini kaplyacak bir container çiz dedik.

          child: ListView.builder(
            scrollDirection: Axis.vertical,
            //aralarında çizgi çizmeye yarıyor.
            padding: const EdgeInsets.all(8),
            itemCount: names.length,
            itemBuilder: (context, index) {
              /*eğer indexle alakamız yoksa indez yerine _ yazıp geçebiliriz.*/
              ///List<String> ---> List<Container> / widget
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        menuItems[names[index]]!));
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(500, 100),
                              maximumSize: const Size(1000, 100),
                              backgroundColor:
                                  Colors.transparent, // Buton arka plan rengi
                              shadowColor: Colors.brown),
                          child: Text(
                            names[index],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
              /*widget döndüren bir fonksiyon yazmalıyız.*/
            },
          ),
        ),
      ),
    );
  }
}
