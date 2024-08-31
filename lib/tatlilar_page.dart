import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TatlilarPage extends StatelessWidget {
  TatlilarPage({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference tatlilarRef = _firestore.collection('tatlilar-page');

    return Scaffold(
      backgroundColor:
          const Color(0xFFFAECD6), // Tatlıları temsil eden arka plan rengi
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2DEBA),
        title: Text(
          "TATLILAR",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder(
        future: tatlilarRef.get(), // Asenkron veriyi burada alıyoruz
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Bir hata oluştu: ${snapshot.error}')); // Hata mesajı
          } else if (snapshot.hasData) {
            final tatlilarListesi = snapshot.data!.docs;
            if (tatlilarListesi.isEmpty) {
              return Center(child: Text('Kayıt yok')); // Boş veri durumu
            }
            return ListView.builder(
              itemCount: tatlilarListesi.length,
              itemBuilder: (context, index) {
                var tatli = tatlilarListesi[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0), // Kutu etrafında boşluk bırakır
                  padding: EdgeInsets.all(16.0), // Kutu içindeki boşluk
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
                        offset: Offset(0, 2), // Gölge kayması
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
                              '${tatli['name']}', // 'name' alanı
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.brown,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            '${tatli['price']}', // 'price' alanı
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.brown,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0), // Başlık ve içerik arasında boşluk
                      Text(
                        '${tatli['ingredient']}', // 'description' alanı
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.amber[50],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Bir sorun oluştu')); // Genel hata durumu
          }
        },
      ),
    );
  }
}
