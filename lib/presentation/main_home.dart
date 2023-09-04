import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/presentation/screens/account/my_account.dart';
import 'package:tryambaka_user/presentation/screens/category/category_main_screen.dart';
import 'package:tryambaka_user/presentation/screens/home/home_screen.dart';
import 'package:tryambaka_user/presentation/screens/notification/notifications.dart';
import 'package:tryambaka_user/presentation/screens/orders/my_orders.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoryMainScreen(),
    const MyOrders(),
    const NotificationScreen(),
    const AccountScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: white,
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            selectedItemColor: black,
            unselectedItemColor: black,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedLabelStyle: GoogleFonts.abrilFatface(
              color: black,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Category"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.bag_fill), label: "Orders"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart_fill), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Account"),
            ],
          ),
        ),
      ),
    );
  }
}
