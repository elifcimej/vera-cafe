import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MakarnalarPage extends StatelessWidget {
  MakarnalarPage({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference makarnaRef = _firestore.collection('makarna-pages');

    return Scaffold(
      backgroundColor: const Color(0xFFFAECD6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2DEBA),
        title: Text(
          "MAKARNALAR",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder(
        future: makarnaRef.get(), // Asenkron veriyi burada alıyoruz
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Bir hata oluştu: ${snapshot.error}')); // Hata mesajı
          } else if (snapshot.hasData) {
            final makarnaListesi = snapshot.data!.docs;
            if (makarnaListesi.isEmpty) {
              return const Center(child: Text('Kayıt yok')); // Boş veri durumu
            }
            return ListView.builder(
              itemCount: makarnaListesi.length,
              itemBuilder: (context, index) {
                var makarna = makarnaListesi[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0), // Kutu etrafında boşluk bırakır
                  padding: const EdgeInsets.all(16.0), // Kutu içindeki boşluk
                  decoration: BoxDecoration(
                    color:
                        Colors.brown.withOpacity(0.1), // Şeffaf arka plan rengi
                    borderRadius:
                        BorderRadius.circular(8.0), // Köşeleri yuvarlatır
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown
                            .withOpacity(0.1), // Gölge rengi ve şeffaflık
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2), // Gölge kayması
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${makarna['name']}', // 'name' alanı
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.brown,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            '${makarna['price']}', // 'price' alanı
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.brown,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 10), // Başlık ve içerik arasında boşluk
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: Text('Bir sorun oluştu')); // Genel hata durumu
          }
        },
      ),
    );
  }
}
