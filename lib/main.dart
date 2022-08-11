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
    'AA, BA, BB, CB,..., FD, FF',
    'A, A-, B+, B,..., D+, D, F',
    'AA, AB, BA, BB,..., FF',
    'A1, A2, A3, B1,..., C3, D, F',
  ];

  String dropdownvalue = "";
  int dersSayisi = 0;
  String term = "Dönem";
  TextEditingController TamamlananKrediController = TextEditingController();
  TextEditingController GenelNotOrtalamasiController = TextEditingController();

  List<Ders> dersler = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('ANA SAYFA'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Kredi Sistemi:"),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: notSistemleri.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
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
                                      dersler.add(Ders());
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
              Container(
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
                              hintText: "97",
                            ),
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
                            decoration: InputDecoration(hintText: "3.02"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TextField(
                                controller: dersler[index].dersLetterController,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Container(
                                child: TextField(
                                  controller:
                                      dersler[index].dersCreditController,
                                ),
                              ),
                            ),
                          ),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrangeAccent,
                  ),
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
