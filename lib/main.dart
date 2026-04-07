import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Pemain {
  final String nama;
  final String negara;
  final String klub;
  int rating;
  final String imagePath;

  Pemain({
    required this.nama,
    required this.negara,
    required this.klub,
    required this.rating,
    required this.imagePath,
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Pemain> daftarPemain = [
    Pemain(
      nama: "Cristiano Ronaldo",
      negara: "Portugal",
      klub: "Al-Nassr",
      rating: 5,
      imagePath: "images/ronaldo.jpg",
    ),
    Pemain(
      nama: "Lionel Messi",
      negara: "Argentina",
      klub: "Inter Miami",
      rating: 4,
      imagePath: "images/messi.jpg",
    ),
    // Pemain(nama: "Kylian Mbappé", negara: "Prancis", klub: "Real Madrid", rating: 5),
    Pemain(
      nama: "Neymar JR",
      negara: "Brazil",
      klub: "Santos",
      rating: 3,
      imagePath: "images/neymar.jpg",
    ),
    // Pemain(nama: "Pratama Arhan", negara: "Thailand", klub: "Port FC", rating: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Pemain Sepakbola',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Pemain Sepakbola'),
          backgroundColor: Colors.yellow.shade600,
        ),
        body: ListView.builder(
          itemCount: daftarPemain.length,
          itemBuilder: (context, index) {
            return PemainCard(
              pemain: daftarPemain[index],
              onRatingChanged: (newRating) {
                setState(() {
                  daftarPemain[index].rating = newRating;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class PemainCard extends StatelessWidget {
  final Pemain pemain;
  final Function(int) onRatingChanged;

  const PemainCard({
    Key? key,
    required this.pemain,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Foto Pemain
            CircleAvatar(
              radius: 35,
              // child: Icon(Icons.person, size: 30),
              backgroundImage: AssetImage(pemain.imagePath),
            ),
            SizedBox(width: 16),
            // Info Pemain
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pemain.nama,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(pemain.negara),
                  Text(pemain.klub),
                  SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        onPressed: () {
                          onRatingChanged(index + 1);
                        },
                        icon: Icon(
                          index < pemain.rating
                              ? Icons.star
                              : Icons.star_border,
                          color:
                              index < pemain.rating
                                  ? Colors.yellow[700]
                                  : Colors.grey,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                      );
                    }),
                    // children: List.generate(5, (index) {
                    //   if (index < pemain.rating) {
                    //     return Icon(
                    //       Icons.star,
                    //       color: Colors.yellow[700],
                    //       size: 20,
                    //     );
                    //   } else {
                    //     return Icon(
                    //       Icons.star_border,
                    //       color: Colors.grey,
                    //       size: 20,
                    //     );
                    //   }
                    // }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
