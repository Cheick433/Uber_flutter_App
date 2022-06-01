import 'package:flutter/material.dart';
import 'package:myfluterap/tabPages/earning_tab.dart';
import 'package:myfluterap/tabPages/home_tab.dart';
import 'package:myfluterap/tabPages/profile_tab.dart';
import 'package:myfluterap/tabPages/rading_tab.dart';


class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{

  TabController? tabController;

  int selectedIndex = 0;

  onItemClicked(int index){
    selectedIndex = index;
    tabController!.index = selectedIndex;

  }

  @override
  void initState() {

    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningsTabPage(),
          RadingsTabPage(),
          ProfileTabPage(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(

          icon: Icon(Icons.home),
          label: "Home",

      ),

          BottomNavigationBarItem(

          icon: Icon(Icons.credit_card),
          label: "Earnings",

    ),
         BottomNavigationBarItem(

         icon: Icon(Icons.start),
         label: "Radings",

    ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: "Account",

    ),


        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
