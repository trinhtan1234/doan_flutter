import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ScreenDiaryCheck extends StatefulWidget {
  const ScreenDiaryCheck({super.key});

  Future<List<dynamic>> _loadJsonCheckDiary() async {
    try {
      Response response = await Dio().get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  @override
  State<ScreenDiaryCheck> createState() => _ScreenDiaryCheckState();
}

class _ScreenDiaryCheckState extends State<ScreenDiaryCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: widget._loadJsonCheckDiary(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List? jsonData = snapshot.data;
            return ListView.builder(
              itemCount: jsonData?.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> itemData = jsonData?[index] ?? {};

                double itemPrice = (itemData['price'] ?? 0).toDouble();
                String itemImage = itemData['image'] ?? '';

                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(itemImage),
                      const SizedBox(height: 8),
                      Text('$itemPrice'),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(itemImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Center(
                          child: Text('Your other conten'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
