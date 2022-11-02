import 'package:flutter/material.dart';
import '../../../../core/theme/app_color_theme.dart';
import '../../../basket/presentation/pages/basket_page.dart';
import '../../../home/presentation/pages/home_page.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[const HomePage(), const BasketPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery'),
      ),
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Basket',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColorTheme.appPimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
