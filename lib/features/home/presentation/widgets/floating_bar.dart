import 'package:flutter/material.dart';


class TabItem {
  final IconData icon;
  final int index;

  TabItem({required this.icon, required this.index});
}

class FloatingBar extends StatefulWidget {
  final TabController tabController;

  const FloatingBar({Key? key, required this.tabController}) : super(key: key);

  @override
  State<FloatingBar> createState() => _FloatingBarState();
}


class _FloatingBarState extends State<FloatingBar> {
  int currentTab = 0;

  final List<TabItem> tabItems = [
    TabItem(icon: Icons.home, index: 0),
    TabItem(icon: Icons.settings, index: 1),
    TabItem(icon: Icons.dashboard, index: 2),
    TabItem(icon: Icons.bike_scooter, index: 3),
  ];

  @override
  void initState() {
    currentTab = widget.tabController.index;
    super.initState();
  }

  void setTab(int val) {
    setState(() {
      currentTab = val;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[500],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: tabItems.map((item) {
          return IconButton(
            onPressed: () {
              widget.tabController.animateTo(item.index);
              setTab(item.index);
            },
            icon: Icon(item.icon),
            color: (currentTab == item.index) ? Colors.indigo[900] : Colors.white,
          );
        }).toList(),
      ),
    );
  }
}
