import 'package:flutter/material.dart';
import 'package:flutter_application_1/Details.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  List category = [
    {"title": "clothes", "IconName": Icons.shop},
    {"title": "showers", "IconName": Icons.shower},
    {"title": "motorcycle", "IconName": Icons.motorcycle},
    {"title": "car", "IconName": Icons.car_crash},
    {"title": "homeStuff", "IconName": Icons.home},
  ];
  List items = [
    {
      "title": "airpods pro 2",
      "ImageName": "assets/images/1.png",
      "subTitle": "smart headSet",
      "price": "33\$",
    },
    {
      "title": "air Head Phones",
      "ImageName": "assets/images/2.png",
      "subTitle": "smart headSet",
      "price": "53\$",
    },
    {
      "title": "Phone Case",
      "ImageName": "assets/images/3.png",
      "subTitle": "phone Privacy",
      "price": "23\$",
    },
    {
      "title": "Phone Case",
      "ImageName": "assets/images/4.png",
      "subTitle": "phone Privacy",
      "price": "13\$",
    },
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "*"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "*"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "*"),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      fillColor: Colors.grey[250],
                      filled: true,
                      border: InputBorder.none,

                      hintText: "search",

                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.menu, size: 35),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Catergory",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(60),
                        ),

                        child: Icon(category[i]["IconName"], size: 40),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          category[i]["title"],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Best Selling",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
              ),
              itemCount: items.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Details(data: items[i]),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      spacing: 2,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          color: Colors.grey[300],
                          child: Image.asset(
                            items[i]["ImageName"],
                            width: 177,
                            height: 150,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          items[i]["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          items[i]["subTitle"],
                          style: TextStyle(color: Colors.grey),
                        ),

                        Text(
                          items[i]["price"],
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
