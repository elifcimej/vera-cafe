import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vera_cafe/widget.dart';

class SogukIceceklerPage extends StatelessWidget {
  SogukIceceklerPage({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference sogukIceceklerRef =
        _firestore.collection('soguk_icecekler'); // Koleksiyon adı

    return MyScaffold(
      title: 'SOĞUK İÇECEKLER',
      child: FutureBuilder(
        future: sogukIceceklerRef.get(), // Asenkron veriyi burada alıyoruz
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Bir hata oluştu: ${snapshot.error}')); // Hata mesajı
          } else if (snapshot.hasData) {
            final sogukIceceklerListesi = snapshot.data!.docs;
            if (sogukIceceklerListesi.isEmpty) {
              return const Center(child: Text('Kayıt yok')); // Boş veri durumu
            }
            return ListView.builder(
              itemCount: sogukIceceklerListesi.length,
              itemBuilder: (context, index) {
                var sogukIcecek = sogukIceceklerListesi[index];
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
                              '${sogukIcecek['name']}', // 'name' alanı
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.brown,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            sogukIcecek['price'], // 'price' alanı
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.brown,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
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
