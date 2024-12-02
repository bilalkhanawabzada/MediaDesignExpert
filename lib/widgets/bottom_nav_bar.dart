import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaat_app/core/locator.dart';
import 'package:jaat_app/core/navigator_service.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  BottomNavBarWidgetState createState() => BottomNavBarWidgetState();
}

class BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  final _nav = locator<NavigatorService>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/text.svg',
            // color : AppColors.primaryColor,
            color: _selectedIndex == 0 ? AppColors.primaryColor : Colors.grey,
          ),
          // color: _selectedIndex == 0 ? AppColors.primaryColor : Colors.grey,

          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              // _nav.pushNamed(matrimonialHomeView);
            },
            child: SvgPicture.asset(
              'assets/svg/M.svg',
              // theme: const SvgTheme(currentColor:  _selectedIndex == 1 ? AppColors.primaryColor : Colors.grey,),
              color: _selectedIndex == 1 ? AppColors.primaryColor : Colors.grey,
            ),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/menu.svg',
            color: _selectedIndex == 2 ? AppColors.primaryColor : Colors.grey,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bell.svg',
            color: _selectedIndex == 3 ? AppColors.primaryColor : Colors.grey,
          ),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              backgroundColor: Colors.transparent,
            ),
            onTap: () {},
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
    // ); // Scaffold
  } // build
} // _MyBottomNavigationBarState
