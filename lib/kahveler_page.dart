import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vera_cafe/widget.dart'; // MyScaffold'ın bulunduğu dosya

class KahvelerPage extends StatelessWidget {
  KahvelerPage({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference kahvelerRef =
    _firestore.collection('kahveler-page'); // Firestore koleksiyon adı

    return MyScaffold(
      title: 'KAHVELER',
      child: FutureBuilder(
        future: kahvelerRef.get(), // Asenkron veriyi burada alıyoruz
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Bir hata oluştu: ${snapshot.error}')); // Hata mesajı
          } else if (snapshot.hasData) {
            final kahvelerListesi = snapshot.data!.docs;
            if (kahvelerListesi.isEmpty) {
              return Center(child: Text('Kayıt yok')); // Boş veri durumu
            }
            return ListView.builder(
              itemCount: kahvelerListesi.length,
              itemBuilder: (context, index) {
                var kahve = kahvelerListesi[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0), // Kutu etrafında boşluk bırakır
                  padding: EdgeInsets.all(16.0), // Kutu içindeki boşluk
                  decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.1), // Şeffaf arka plan rengi
                    borderRadius: BorderRadius.circular(8.0), // Köşeleri yuvarlatır
                    boxShadow: [
                      BoxShadow(
                        color: Colors.brown.withOpacity(0.1), // Gölge rengi ve şeffaflık
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
                              kahve['name'], // 'name' alanı
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.brown,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            kahve['price'], // 'price' alanı
                            style: TextStyle(
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
            return Center(child: Text('Bir sorun oluştu')); // Genel hata durumu
          }
        },
      ),
    );
  }
}
