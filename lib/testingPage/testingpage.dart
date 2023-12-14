
import 'package:flutter/material.dart';
import 'package:flutter_application_message/main.dart';


// tangkap data judul bangun yang dikirim dari submenu_logika
class LayarLogika12 extends StatelessWidget {
  const LayarLogika12({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Kubus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContohLayarLogika12(),
    );
  }
}

class ContohLayarLogika12 extends StatefulWidget {
  const ContohLayarLogika12({super.key});
// const ContohLayarLogika12({super.key, required this.data});
  @override
  State<ContohLayarLogika12> createState() => _ContohLayarLogika12State();
}

class _ContohLayarLogika12State extends State<ContohLayarLogika12> {
  TextEditingController num1Controller = TextEditingController(); //rusuk

  String result = '';
  String keterangan = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //menghilangkan error kuning di keyboard
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyApp())),
        ),
// tampilkan data
        title: const Text('Kubus'),
        backgroundColor: Color(0xFF2ecc71),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Rumus Kubus',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
        
                     Image.network(
                        'https://lh3.googleusercontent.com/pw/ADCreHcX98ghH8k_fk_aJVHZ_3xE4fVhIC_fSlJimpw9_5_fPP2R8DNESl1MTFklPCiVotmlwsDuw7SRrc8gGZcM4V-U_IN-xn_GED9Ktm-eeMYw5cZEn3AS1AvelQIkxejEqwySndv7MGzjf7U1pyBJkwKK7C8iFFud-_L5WRJc3JmnBt2LuneXHszMxM_SfFgrxvhCFaFnHBXu1yb_2KLJsuAjaNVdBaH1V9qAH6aOCVXRwetPpQwpLZw0-zAEtt0jM-KQMmshRWRMgVVyF3qkUWGHxe40Q2Kkt3TQtV0NzKTh5vh2e3fvxgWm9x5uxneLnbxuqvoZ7fDbakBPzTxKGr__pvZ2YO-ik4Lw3ABimqAjgYh80UFu_1rxGZvzLMJSgLjWz6sb31HuYaqawoleKo_cDAqZDllfuJxeqi5wnodI8ZpFfbdrqE7NIZV5vspkZFJWmXx0kzoNNZrKpZmpeS9K6eSwXdVbOoCZ9DZw3zY3Vn4fqsf9i7o5JyWAkGVaLarTJxbnpx5L1JJA2p6DmtON63kDIzB25tE4gNlje9iMvMlZb7LhFVqo-zB9ENJOCDnCeZIkmhaqn_qGYvWfxhyy5rLm7VR8kM4gz3z5c9KH3GXwVAd95Y-4W9SF_SOgNHljBqGOcpp_IPIQyrE5H7GgOnI89IYfHO7-BkusH-NWZ9DgpGnoOoAysJs_Wtz_-xqQMnjAXg4Q5WBMf-jVqUlLvJZzckqBs0KtYsAyOEPR8QSalMH63AHcEDled485m2J-Ob5ERHmPuDt-y9clXGmlhMtkyIh_L8aoEEb_g51KnWstuOyp29eUQpgM6rPPfhLGsNk0asy4SkGX8SXkfhsmcRtWyudYTxRxhA9SsSiNKBlHQCz4qNDu7S1RKUGuEHHenA=w736-h414-s-no-gm?authuser=0',
                        height: 200,
                      ),
        
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Keliling = (2*a) + (2*b)',
                          //   style: TextStyle(fontSize: 20, color: Colors.red),
                          // ),
                          // Text(
                          //   'Luas = a *t',
                          //   style: TextStyle(fontSize: 25, color: Colors.purple),
                          // )
                        ],
                      )
                    ],
                  ),
        //2.
                ],
              ),
        
              const SizedBox(height: 16),
        
              TextField(
                controller: num1Controller, 
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // prefixText: 'SISI =',
                  labelText: 'Sisi (S)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Masukan S '),
              ),
              const SizedBox(height: 16), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  ElevatedButton(
                    onPressed: () {
                      keliling();
                    },
                     style: ButtonStyle(
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                           RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0), 
              ),
            ),
            backgroundColor: MaterialStateProperty.all <Color>(Color(0xFF2ecc71))
          ), 
                    
                    child: const Text(
                      'Hitung Volume',
                      style: TextStyle(fontSize: 20),
        
                    ),
                  ),
        //1.
                 
                ],
              ),
               ElevatedButton(
                    onPressed: () {
                      luas();
                    },
                      style: ButtonStyle(
                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                           RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0), 
              ),
            ),
            backgroundColor: MaterialStateProperty.all <Color>(Color(0xFF8e44ad)),
          ), 
                    child: const Text(
                      'Hitung Luas Permukaan',
                      style: TextStyle(fontSize: 20, color: Colors.white)
        
                    ),
                  ),
              
                  const SizedBox(height: 16),
                  Text(
                '$keterangan $result',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),
              ),
              const SizedBox(height: 32),  
            ],
          ),
        ),
      ),
    );
  }

  void keliling() {
// Ambil nilai dari dua TextField dan tambahkan
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double sum = num1*num1*num1;
    setState(() {
      keterangan = "Volume Kubus = ";
      result = sum.toStringAsFixed(2);
    });
  }

// Metode luas
  void luas() {
// Ambil nilai dari dua TextField dan tambahkan
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;

    double sum = 6*num1*num1;
    setState(() {
      keterangan = "Luas Permukaan Kubus = ";
      result = sum.toStringAsFixed(2);
    });
  }

}

