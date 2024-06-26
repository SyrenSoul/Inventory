import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> productName = ['Jaket', 'Hoodie', 'Kaos', 'Kemeja', 'Sendal', 'Sepatu', 'Cardigan'];
  List<String> productVariants = [
    '[Black], [White], [Blue]', 
    '[Black], [White], [Blue]', 
    '[Black], [White], [Blue]', 
    '[Black], [White], [Blue]', 
    '[Black], [White], [Blue]', 
    '[Black], [White], [Blue]', 
    '[Black], [White], [Blue]'];
  List<int> productUnit = [20, 30, 23, 27, 21, 18, 22];
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://github.com/SyrenSoul/Product/blob/main/Hoodie.jpg?raw=true',
    'https://github.com/SyrenSoul/Product/blob/main/Kaos.jpg?raw=true',
    'https://github.com/SyrenSoul/Product/blob/main/Kemeja.jpg?raw=true',
    'https://github.com/SyrenSoul/Product/blob/main/Sendal.jpg?raw=true',
    'https://github.com/SyrenSoul/Product/blob/main/Sepatu.jpg?raw=true',
    'https://github.com/SyrenSoul/Product/blob/main/Cardigan.jpg?raw=true',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
        appBar: PreferredSize(
          preferredSize: const Size(100, 50),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(36, 36, 36, 1),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: productName.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color.fromARGB(255, 250, 161, 109),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              height: 150,
                              width: 150,
                              image: NetworkImage(productImage[index]),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName[index].toString(),
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 35),
                                Text(
                                  "Variants: ${productVariants[index]}",
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 35),
                                Text(
                                  "Quantity: ${productUnit[index]}",
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          // Handle menu item selection
                          // ignore: avoid_print
                          print('Selected: $value');
                        },
                        itemBuilder: (BuildContext context) {
                          return {'Edit', 'Remove'}.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
