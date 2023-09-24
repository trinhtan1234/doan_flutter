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
                String itemTitle = itemData['title'] ?? '';
                String itemImage = itemData['image'] ?? '';
                String itemDescription = itemData['description'] ?? '';

                return Container(
                  height: 500,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      //User người dùng
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/images/1.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(itemTitle),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('1d'),
                                    Text('-'),
                                    Icon(
                                      Icons.public_outlined,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              itemDescription,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Image.network(
                          itemImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Row(
                        children: [
                          Positioned(
                            left: 0,
                            child: Icon(Icons.thumb_up_outlined),
                          ),
                          Positioned(
                            left: 20,
                            child: Icon(Icons.favorite_outlined),
                          ),
                          Text('Hoàng hà và 200 người khác')
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {}, child: const Text('Thích')),
                          TextButton(
                              onPressed: () {}, child: const Text('Bình luận')),
                          TextButton(
                              onPressed: () {}, child: const Text('Chia sẻ')),
                        ],
                      ),
                      const Divider(),
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
