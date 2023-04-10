import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  List<String> favourIds;

  TabsScreen(this.favourIds);

  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  List<String> favorIds;
  List<Map<String, Object>> pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    setState(() {
      favorIds = widget.favourIds;
      pages = [
        {
          'page': CatergoriesScreen(),
          'title': "Categories",
        },
        {
          'page': FavoritesScreen(favorIds),
          'title': "Favories",
        }
      ];
    });

    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
            backgroundColor: Colors.pink,
          ),
        ],
      ),
      drawer: SafeArea(child: MainDrawer()),
    );
  }
}
