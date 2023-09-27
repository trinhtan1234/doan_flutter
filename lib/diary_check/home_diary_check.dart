import 'package:doan_flutter/diary_check/screen_list_diary_check.dart';
import 'package:flutter/material.dart';

class HomeDiaryCheck extends StatefulWidget {
  const HomeDiaryCheck({super.key});
  @override
  State<HomeDiaryCheck> createState() => _HomeDiaryCheckState();
}

class _HomeDiaryCheckState extends State<HomeDiaryCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {},
                      ),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
            ),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Danh sách kiểm tra',
                ),
                Tab(
                  text: 'Quan tâm',
                )
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: ScreenDiaryCheck(),
              ),
              Center(
                child: Text('Data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
