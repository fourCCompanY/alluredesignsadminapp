import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//==================MY OWN IMPORTS===============
import 'package:alluredesigns_adminapp/screens/add_product_page.dart';
import 'package:alluredesigns_adminapp/screens/add_carousel_page.dart';
import 'package:alluredesigns_adminapp/screens/orders_screen.dart';
import 'package:alluredesigns_adminapp/screens/signin.dart';

const kOurThemeColor = Color(0xFF626ABB);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: SignIn(),
    ),
  );
}

enum TabSwitcher { dashboard, manage }

TabSwitcher selectedTab = TabSwitcher.dashboard;

class AdminAppHomePage extends StatefulWidget {
  @override
  _AdminAppHomePageState createState() => _AdminAppHomePageState();
}

class _AdminAppHomePageState extends State<AdminAppHomePage> {
  int products = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: kOurThemeColor,
        title: Text(
          "Admin Panel",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedTab = TabSwitcher.dashboard;
                      });
                    },
                    icon: Icon(
                      Icons.dashboard,
                      color: (selectedTab == TabSwitcher.dashboard)
                          ? kOurThemeColor
                          : Colors.grey,
                    ),
                    label: Text(
                      "Dashboard",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: (selectedTab == TabSwitcher.dashboard)
                              ? kOurThemeColor
                              : Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedTab = TabSwitcher.manage;
                      });
                    },
                    icon: Icon(
                      Icons.sort,
                      color: (selectedTab == TabSwitcher.manage)
                          ? kOurThemeColor
                          : Colors.grey,
                    ),
                    label: Text(
                      "Manage",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: (selectedTab == TabSwitcher.manage)
                              ? kOurThemeColor
                              : Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          loadScreen(),
        ],
      ),
    );
  }

  loadScreen() {
    switch (selectedTab) {
      case TabSwitcher.dashboard:
        return Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: ListTile(
                      title: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.people),
                        label: Text("Users"),
                      ),
                      subtitle: Text(
                        '7',
                        style: TextStyle(
                          fontSize: 60.0,
                          color: kOurThemeColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrdersScreen(),
                          ),
                        );
                      },
                      child: ListTile(
                        title: FlatButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrdersScreen(),
                              ),
                            );
                          },
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Orders"),
                        ),
                        subtitle: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 60.0,
                            color: kOurThemeColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: ListTile(
                      title: FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.tag_faces),
                        label: Text("Sold"),
                      ),
                      subtitle: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 60.0,
                          color: kOurThemeColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Material(
                      elevation: 3.0,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: ListTile(
                          title: FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_basket),
                            label: Text("Products"),
                          ),
                          subtitle: Text(
                            products.toString(),
                            style: TextStyle(
                              fontSize: 60.0,
                              color: kOurThemeColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      right: 0.0,
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          setState(() {
                            products++;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return {
                            'Product Added',
                          }.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(choice),
                                  Icon(Icons.check_box),
                                ],
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case TabSwitcher.manage:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProductScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text("Add Product"),
                      leading: Icon(Icons.add),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCarouselScreen(),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text("Add Carousel"),
                      leading: Icon(Icons.add_photo_alternate),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }
}
