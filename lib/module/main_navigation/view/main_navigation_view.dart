import 'package:flutter/material.dart';
import '../../dashboard/view/dashboard_view.dart';
import '../controller/main_navigation_controller.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            const DashboardView(),
            Container(),
            Container(),
            Container(),
          ],
        ),
bottomNavigationBar: Padding(
  padding: const EdgeInsets.only(bottom: 10.0),
  child: Container(
    decoration: BoxDecoration(
       // Set background color to blue
      borderRadius: BorderRadius.circular(20.0), // Set border radius
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20.0), // Horizontal padding
    child: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: (newIndex) => controller.updateIndex(newIndex),
        showSelectedLabels: false,
        elevation: 0.0,
        selectedItemColor: Colors.blue, // Set selected icon color to white
        unselectedItemColor: Colors.white, // Set unselected icon color to white
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 36.0,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 36.0,
            ),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplane_ticket,
              size: 36.0,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 36.0,
            ),
            label: "User",
          ),
        ],
      ),
    ),
  ),
),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
