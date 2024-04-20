import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SonucEkrani extends StatefulWidget {

  bool sonuc;
  SonucEkrani({super.key, required this.sonuc});            // {} ile sonuc: yapmış olduk (Tahmin ekranında)

  @override
  // ignore: library_private_types_in_public_api
  _SonucEkraniState createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,      
        title: const Text("Sonuç Ekranı"),
      ),
      body: Center(     
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc ? Image.asset("resimler/mutlu_resim.jpg") : Image.asset("resimler/uzgun_resim.jpg"),    // widget.sonuc ?  ile yukarıdaki sonuca ulaştık
            Text(widget.sonuc ?  "Kazandınız" : "Kaybettiniz", style: const TextStyle(color: Colors.black54, fontSize: 36),),                     // true ise ilk resim, false ise ikinci resim gösterilir
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
                child: const Text("TEKRAR DENE"),
              ),
            ),
          ],
        ),
      ),    
    );
  }
}