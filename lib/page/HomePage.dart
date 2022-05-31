import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ui/homemodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtomApp(Icons.list, true),
                ButtomApp(Icons.settings, true)
              ],
            ),
          ),
          Text("city",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 5.h)),
          Text("London",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 7.h)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 5.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  WrapText("<100.000€"),
                  WrapText("for sale"),
                  WrapText('free "danger"'),
                  WrapText('big hause'),
                  WrapText('departament'),
                  WrapText('in the downtown'),
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: HomeList.length,
            itemBuilder: (context, index) {
              final home = HomeList[index];
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Stack(
                        children: [
                          Container(
                            height: 25.h,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(home.url),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: ButtomApp(Icons.favorite, false))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }

  Widget WrapText(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 5.h,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget ButtomApp(IconData icon_, bool state) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 6.h,
            width: 6.h,
            decoration: BoxDecoration(
              color: state == true ? Colors.grey[300] : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                state == true
                    ? BoxShadow(
                        offset: const Offset(3, 3),
                        color: Colors.white,
                        blurRadius: 10.h,
                        spreadRadius: 1)
                    : const BoxShadow(),
                state == true
                    ? BoxShadow(
                        offset: const Offset(-3, -3),
                        color: Colors.grey,
                        blurRadius: 10.h,
                        spreadRadius: 1)
                    : const BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.white,
                        spreadRadius: 1)
              ],
            ),
            child: Icon(
              icon_,
              color: Colors.black,
              size: 3.8.h,
            ),
          ),
        ],
      ),
    );
  }
}
