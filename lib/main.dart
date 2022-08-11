import 'package:flutter/material.dart';

import 'ders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notum!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    dropdownvalue = notSistemleri[0];
    super.initState();
  }

  var notSistemleri = [
    'AA, BA, BB, CB, .., DD, FD, FF',
    'A, A-, B+, B, .., C, C-, D+, D, F',
    'AA, AB, BA, BB, .., CF, DC, DD, FF',
    'A, B1, B2, B3, C1, C2, C3, F1, F2',
  ];

  var dersNotu = 0.0;
  var dersHarfi = "AA";

  var sistem = 1;

  List<String> harfSistemiDefault = [
    "AA",
    "BA",
    "BB",
    "CB",
    "CC",
    "DC",
    "DD",
    "FD",
    "FF",
  ];

  List<String> notSistemiAABA = [
    "AA",
    "BA",
    "BB",
    "CB",
    "CC",
    "DC",
    "DD",
    "FD",
    "FF",
  ];

  List<double> notSistemiDefault = [
    4.0,
    3.5,
    3.0,
    2.5,
    2.0,
    1.5,
    1.0,
    0.5,
    0.0
  ];

  List<double> notSistemiAABANots = [
    4.0,
    3.5,
    3.0,
    2.5,
    2.0,
    1.5,
    1.0,
    0.5,
    0.0
  ];

  List<String> notSistemiAAeksi = [
    "A",
    "A-",
    "B+",
    "B",
    "B-",
    "C+",
    "C",
    "C-",
    "D+",
    "D",
    "F"
  ];

  List<double> notSistemiAAeksiNots = [
    4.0,
    3.67,
    3.33,
    3.0,
    2.67,
    2.33,
    2.0,
    1.67,
    1.33,
    1.0,
    0.0
  ];

  List<String> notSistemiAAAB = [
    "AA",
    "AB",
    "BA",
    "BB",
    "BC",
    "CB",
    "CC",
    "CF",
    "DC",
    "DD",
    "FF"
  ];

  List<double> notSistemiAAABNots = [
    4.0,
    3.7,
    3.3,
    3.0,
    2.7,
    2.3,
    2.0,
    1.7,
    1.3,
    1.0,
    0.0
  ];

  List<String> notSistemiAB1 = [
    "A",
    "B1",
    "B2",
    "B3",
    "C1",
    "C2",
    "C3",
    "F1",
    "F2"
  ];

  List<double> notSistemiAB1Nots = [
    4.0,
    3.5,
    3.25,
    3.0,
    2.75,
    2.5,
    2.0,
    1.5,
    0.0
  ];

  String dropdownvalue = "AA, BA, BB, CB, CC, DC, DD, FD, FF";
  int dersSayisi = 0;
  String term = "Dönem";
  TextEditingController TamamlananKrediController = TextEditingController();
  TextEditingController GenelNotOrtalamasiController = TextEditingController();

  List<Ders> dersler = [];

  double genelOrt = 0.0;
  int genelKredi = 0;
  double donemOrt = 0.0;
  int toplamKredi = 0;
  double toplamMultip = 0.0;

  void Hesapla() {
    setState(() {
      donemOrt = 0;
      toplamKredi = 0;
      toplamMultip = 0;
      for (int i = 0; i < dersler.length; i++) {
        toplamKredi += dersler[i].dersCredit!;
        toplamMultip += dersler[i].dersCredit! * dersler[i].dersGrade!;
        donemOrt = toplamMultip / toplamKredi;
      }
    });
    if (term == "Genel") {
      genelOrt = double.parse(GenelNotOrtalamasiController.text);
      genelKredi = int.parse(TamamlananKrediController.text);

      genelOrt =
          ((genelOrt * genelKredi) + toplamMultip) / (genelKredi + toplamKredi);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HesApp'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Kredi\nSistemi:",
                    textAlign: TextAlign.center,
                  ),
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: notSistemleri.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          overflow: TextOverflow.visible,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dersler = [];
                        dropdownvalue = newValue!;
                        if (dropdownvalue ==
                            'AA, BA, BB, CB, .., DD, FD, FF') {
                          harfSistemiDefault = notSistemiAABA;
                          sistem = 1;
                          dersSayisi = 0;
                          dersHarfi = "AA";
                          notSistemiDefault = notSistemiAABANots;
                        } else if (dropdownvalue ==
                            'A, A-, B+, B, .., C, C-, D+, D, F') {
                          harfSistemiDefault = notSistemiAAeksi;
                          sistem = 2;
                          dersSayisi = 0;
                          dersHarfi = "A";
                          notSistemiDefault = notSistemiAAeksiNots;
                        } else if (dropdownvalue ==
                            'AA, AB, BA, BB, .., CF, DC, DD, FF') {
                          harfSistemiDefault = notSistemiAAAB;
                          sistem = 3;
                          dersSayisi = 0;
                          dersHarfi = "AA";
                          notSistemiDefault = notSistemiAAABNots;
                        } else {
                          harfSistemiDefault = notSistemiAB1;
                          sistem = 4;
                          dersSayisi = 0;
                          dersHarfi = "A";
                          notSistemiDefault = notSistemiAB1Nots;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  //Ders Sayısı
                  Container(
                    child: Expanded(
                      child: ListTile(
                        title: Text('Ders Sayısı'),
                        trailing: DropdownButton<int>(
                            hint: Text("Pick"),
                            value: dersSayisi,
                            items: <int>[
                              0,
                              1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              11,
                              12,
                              13,
                              14,
                              15
                            ].map((int value) {
                              return new DropdownMenuItem<int>(
                                value: value,
                                child: new Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                dersSayisi = newVal!;
                                if (dersSayisi > dersler.length) {
                                  for (int i = dersler.length - 1;
                                      i < dersSayisi;
                                      i++) {
                                    dersler.add(Ders(
                                      dersCredit: 0,
                                      dersGrade: 0.0,
                                      dersCreditController:
                                          TextEditingController(),
                                    ));
                                  }
                                } else {
                                  // maybe if will be added
                                  for (int i = dersler.length - 1;
                                      i >= dersSayisi;
                                      i--) {
                                    dersler.removeLast();
                                  }
                                }
                              });
                            }),
                      ),
                    ),
                  ),
                  //Dönem - Genel Button
                  Container(
                    child: Expanded(
                      child: ListTile(
                        title: Text('Format'),
                        trailing: DropdownButton<String>(
                            hint: Text("Pick"),
                            value: term,
                            items: <String>[
                              "Dönem",
                              "Genel",
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                term = newVal!;
                              });
                            }),
                      ),
                    ),
                  )
                ],
              ),
            ),
            term == "Genel"
                ? Container(
                    child: Row(
                      children: [
                        //Tamamlanan Kredi
                        Container(
                          child: Expanded(
                            child: ListTile(
                              leading: Text('Tamamlanan\nKredi',
                                  textAlign: TextAlign.center),
                              title: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: TamamlananKrediController,
                                decoration: InputDecoration(
                                  hintText: "Örn: 97",
                                ),
                                onChanged: (_) {
                                  setState(() {
                                    Hesapla();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        //Genel Not Ortalaması
                        Container(
                          child: Expanded(
                            child: ListTile(
                              leading: Text(
                                'Genel Not\nOrtalaması',
                                textAlign: TextAlign.center,
                              ),
                              title: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: GenelNotOrtalamasiController,
                                decoration:
                                    InputDecoration(hintText: "Örn: 3.02"),
                                onChanged: (_) {
                                  setState(() {
                                    Hesapla();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            //Dersler---Büyük widget
            Container(
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dersSayisi,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "Ders ${index + 1}",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrangeAccent
                                      .withOpacity(0.5)),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller:
                                    dersler[index].dersCreditController,
                                decoration: const InputDecoration(
                                  hintText: "Ders Kredisi",
                                  border: InputBorder.none,
                                ),
                                onChanged: (_) {
                                  setState(() {
                                    dersler[index].dersCredit = int.parse(
                                        dersler[index]
                                            .dersCreditController!
                                            .text);
                                    Hesapla();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepOrangeAccent
                                      .withOpacity(0.5)),
                              alignment: Alignment.center,
                              child: DropdownButton(
                                value: dersler[index].dersLetter,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: (sistem == 1
                                        ? notSistemiAABA
                                        : (sistem == 2
                                            ? notSistemiAAeksi
                                            : (sistem == 3
                                                ? notSistemiAAAB
                                                : notSistemiAB1)))
                                    .map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(
                                      items,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dersHarfi = newValue!;
                                    dersler[index].dersLetter = dersHarfi;
                                    dersler[index].dersGrade =
                                        notSistemiDefault[harfSistemiDefault
                                            .indexOf(dersHarfi)];
                                  });
                                  Hesapla();
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                dersler.removeAt(index);
                                dersSayisi--;
                                Hesapla();
                              });
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            //Hesaplanan Genel Not Ortalaması
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  term == "Dönem"
                      ? "Dönem Not Ortalaması: ${donemOrt.toStringAsFixed(2)}"
                      : "Dönem Not Ortalaması: ${donemOrt.toStringAsFixed(2)} \nGenel Not Ortalaması: ${genelOrt.toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepOrangeAccent.withOpacity(0.5),
                ),
                width: double.infinity,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
