import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final data;
  const Details({super.key, this.data});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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

      endDrawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle_notifications_outlined),
            Text("Gispy", style: TextStyle(color: Colors.black)),
            Text(" bee", style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
      body: ListView(
        children: [
          Image.asset(widget.data["ImageName"]),
          Container(height: 12),
          Text(
            widget.data["title"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Container(height: 4),
          Text(
            widget.data["subTitle"],
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Container(height: 8),
          Text(
            widget.data["price"],
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Color:"),
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,

                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
              ),
              Text("Grey"),
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(left: 8),

                decoration: BoxDecoration(
                  color: Colors.black,

                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              Text("Black"),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Text(
              "Size : 39  40  41  42  43",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.symmetric(horizontal: 110),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.black,
              onPressed: () {},
              child: Text("Add to cart", style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
