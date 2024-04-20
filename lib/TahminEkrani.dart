import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahmin_uygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();              //TextField üzerinden verileri alıcaz ve tahmin edicez
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlerdirme = "";

  @override
  void initState() {                   // sayfa açıldığı anda rastgele sayı üretir 
    super.initState();
    rastgeleSayi = Random().nextInt(101);       // 0-100 arasında rastgele sayı üretir
    print("Rastgele Sayı : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,      
        title: const Text("Tahmin Ekranı"),
      ),
      body: Center(     
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak : $kalanHak", style: const TextStyle(color: Colors.pink, fontSize: 30),),
            Text("Yardım : $yonlerdirme", style: const TextStyle(color: Colors.black54, fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,                 //TextField içine girilen bilgiyi iletir
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {

                  setState(() {
                    kalanHak = kalanHak - 1;
                  });

                  int tahmin = int.parse(tfTahmin.text);     //metinsel ifadeyi tam sayıya dönüştürerek tahmin'i aldım

                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: true)));
                    return;         // return ile butonun çalışmasını durdurduk
                  }

                  if(tahmin > rastgeleSayi){
                    setState(() {                          // yönlendirme içerisindeki bilginin yenilenmesi için setState yapıyoruz
                      yonlerdirme = "Tahmini Azalt";
                    });
                  }

                  if(tahmin < rastgeleSayi){
                    setState(() {
                      yonlerdirme = "Tahmini Arttır";
                    });
                  }

                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(sonuc: false)));
                  }

                  tfTahmin.text = "";    //TextField içerisine tahmin girdikten sonra o tahmini temizlemek için bunu yapıyoruz 

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.pink,
                ),
                child: const Text("TAHMİN ET"),
              ),
            ),
          ],
        ),
      ),    
    );
  }
}