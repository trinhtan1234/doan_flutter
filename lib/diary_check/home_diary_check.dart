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
        body: Container(
      margin: EdgeInsets.only(top: 20),
      child: DefaultTabController(
        length: 2,
        child: SizedBox(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        indicatorColor: Colors.blue,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                        tabs: [
                          Tab(text: 'Danh sách kiểm tra'),
                          Tab(text: 'Quan tâm'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 740,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                  child: TabBarView(
                    children: [
                      Center(child: ScreenDiaryCheck()),
                      Center(
                        child: Text('data'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
