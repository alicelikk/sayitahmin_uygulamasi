import 'package:flutter/material.dart';
import 'package:sayitahmin_uygulamasi/TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,      
        title: const Text("Anasayfa"),
      ),
      body: Center(     
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Tahmin Oyunu", style: TextStyle(color: Colors.black54, fontSize: 36),),
            Image.asset("resimler/zar_resmi.png"),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TahminEkrani()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
                child: const Text("OYUNA BAŞLA"),
              ),
            ),
          ],
        ),
      ),    
    );
  }
}
