import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vera_cafe/widget.dart';

/*
class KahvaltilarPage extends StatelessWidget {
  KahvaltilarPage({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference kahvaltiRef = _firestore.collection('kahvalti-pages');

    return MyScaffold(
      title: 'KAHVALTILAR',
      child: FutureBuilder(
        future: kahvaltiRef.get(), // Asenkron veriyi burada alıyoruz
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}')); // Hata mesajı
          } else if (snapshot.hasData) {
            final kahvaltiListesi = snapshot.data!.docs;
            if (kahvaltiListesi.isEmpty) {
              return Center(child: Text('Kayıt yok')); // Boş veri durumu
            }
            return ListView.builder(
              itemCount: kahvaltiListesi.length,
              itemBuilder: (context, index) {
                var kahvalti = kahvaltiListesi[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Kutu etrafında boşluk bırakır
                  padding: EdgeInsets.all(16.0), // Kutu içindeki boşluk
                  decoration: BoxDecoration(
                    color: Colors.brown.withOpacity(0.4), // Şeffaf arka plan rengi
                    borderRadius: BorderRadius.circular(8.0), // Köşeleri yuvarlatır
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Gölge rengi ve şeffaflık
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2), // Gölge kayması
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text('${kahvalti['name']}  ${kahvalti['price']}', style: TextStyle(fontFamily: 'Roboto', color: Colors.amber[50])),
                    subtitle: Text('${kahvalti['ingredient']}', style: TextStyle(fontFamily: 'Roboto')),
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
*/

class KahvaltilarPage extends StatelessWidget {
  KahvaltilarPage({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference kahvaltiRef = _firestore.collection('kahvalti-pages');

    return MyScaffold(
      title: 'KAHVALTILAR',
      child: FutureBuilder(
        future: kahvaltiRef.get(), // Asenkron veriyi burada alıyoruz
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Bir hata oluştu: ${snapshot.error}')); // Hata mesajı
          } else if (snapshot.hasData) {
            final kahvaltiListesi = snapshot.data!.docs;
            if (kahvaltiListesi.isEmpty) {
              return Center(child: Text('Kayıt yok')); // Boş veri durumu
            }
            return ListView.builder(
              itemCount: kahvaltiListesi.length,
              itemBuilder: (context, index) {
                var kahvalti = kahvaltiListesi[index];
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
                              '${kahvalti['name']}',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.brown,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            '${kahvalti['price']}',
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
                        '${kahvalti['ingredient']}',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.amber[50],
                            fontSize: 13 // İstediğiniz rengi belirleyin
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
