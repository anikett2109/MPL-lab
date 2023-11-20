import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portal_app/InvestorScreen/Investor_homepage.dart';
import 'package:portal_app/constants/appicons.dart';
import 'package:portal_app/screens/addpost.dart';

class InvestorNavigation extends StatefulWidget {
  const InvestorNavigation({super.key});

  @override
  State<InvestorNavigation> createState() => _MainPageState();
}

class _MainPageState extends State<InvestorNavigation> {
  Menus currentIndex = Menus.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex.index],
      bottomNavigationBar: InvestorBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          if (value == Menus.add) {
            AddPost();
          }
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }

  final pages = [
    InvestorHomePage(),
    Center(
      child: Text('Favorite'),
    ),
    AddPost(),
    Center(
      child: Text('Favorite'),
    ),
    Center(
      child: Text('Favorite'),
    ),
  ];
}

enum Menus {
  home,
  favorite,
  add,
  messages,
  user,
}

class InvestorBottomNavBar extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;
  const InvestorBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      margin: EdgeInsets.all(24),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 17,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  color: Color(0xFF001F3F),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.home),
                        icon: AppIcons.home,
                        current: currentIndex,
                        name: Menus.home),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.favorite),
                        icon: AppIcons.favorite,
                        current: currentIndex,
                        name: Menus.favorite),
                  ),
                  Spacer(),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.messages),
                        icon: AppIcons.message,
                        current: currentIndex,
                        name: Menus.messages),
                  ),
                  Expanded(
                    child: BottomNavigationItem(
                        onPressed: () => onTap(Menus.user),
                        icon: AppIcons.user,
                        current: currentIndex,
                        name: Menus.user),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () => onTap(Menus.add),
              child: Container(
                width: 64,
                height: 64,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppIcons.add),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final Menus current;
  final Menus name;
  const BottomNavigationItem(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.current,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
              current == name ? Colors.white : Colors.green.withOpacity(0.9),
              BlendMode.srcIn),
        ));
  }
}
