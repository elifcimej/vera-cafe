import 'package:flutter/material.dart';
import 'package:vera_cafe/widget.dart'; // MyScaffold'ın bulunduğu dosya
import 'kahveler_page.dart'; // KahvelerPage sayfasının bulunduğu dosya
import 'soguk_icecekler_page.dart'; // SogukIceceklerPage sayfasının bulunduğu dosya
import 'sicak_icecekler_page.dart'; // SicakIceceklerPage sayfasının bulunduğu dosya

class IceceklerPage extends StatelessWidget {
  const IceceklerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAECD6),
      appBar: AppBar(
        title: Text('İÇECEKLER',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: const Color(0xFFF2DEBA),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KahvelerPage()),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(500, 100),
                maximumSize: const Size(1000, 100),
                backgroundColor:
                Colors.transparent, // Buton arka plan rengi
                shadowColor: Colors.brown),
            child: Text('SOĞUK İÇECEKLER', style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SogukIceceklerPage()),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(500, 100),
                maximumSize: const Size(1000, 100),
                backgroundColor:
                Colors.transparent, // Buton arka plan rengi
                shadowColor: Colors.brown),
            child: Text('SICAK İÇECEKLER', style: Theme.of(context).textTheme.bodyLarge),

          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SicakIceceklerPage()),
              );
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(500, 100),
                maximumSize: const Size(1000, 100),
                backgroundColor:
                Colors.transparent, // Buton arka plan rengi
                shadowColor: Colors.brown),
            child: Text('KAHVELER', style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
