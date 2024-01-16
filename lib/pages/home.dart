import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/widgets/sos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int widgetIndex = 0;

  void setWidgetIndex(int widgetIndex) {
    setState(() {
      this.widgetIndex = widgetIndex;
    });
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final List<Widget> _widgetOptions = [
    const Sos(),
    const Center(child: Text('(Nearby)')),
    const Center(child: Text('(History)')),
    Center(
      child: IconButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        icon: const Icon(Icons.logout),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(
        widgetIndex: widgetIndex,
        setWidgetIndex: setWidgetIndex,
      ),
      body: _widgetOptions[widgetIndex],
    );
  }
}

class BottomNavbar extends StatelessWidget {
  final int widgetIndex;
  final dynamic setWidgetIndex;

  const BottomNavbar({
    super.key,
    required this.widgetIndex,
    required this.setWidgetIndex,
  });

  @override
  Widget build(BuildContext context) {
    const Color navColor = Color.fromRGBO(210, 210, 210, 1.0);
    const Color activeNavColor = Color.fromRGBO(140, 140, 140, 1.0);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 50,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: widgetIndex,
      items: [
        BottomNavigationBarItem(
          tooltip: 'Home',
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            colorFilter: const ColorFilter.mode(
              navColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/home.svg',
            colorFilter: const ColorFilter.mode(
              activeNavColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          tooltip: 'Nearby',
          icon: SvgPicture.asset(
            'assets/icons/nearby.svg',
            colorFilter: const ColorFilter.mode(
              navColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/nearby.svg',
            colorFilter: const ColorFilter.mode(
              activeNavColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          tooltip: 'History',
          icon: SvgPicture.asset(
            'assets/icons/history.svg',
            colorFilter: const ColorFilter.mode(
              navColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/history.svg',
            colorFilter: const ColorFilter.mode(
              activeNavColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          tooltip: 'Profile',
          icon: SvgPicture.asset(
            'assets/icons/profile.svg',
            colorFilter: const ColorFilter.mode(
              navColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/profile.svg',
            colorFilter: const ColorFilter.mode(
              activeNavColor,
              BlendMode.srcIn,
            ),
          ),
          label: '',
        ),
      ],
      onTap: (widgetIndex) => setWidgetIndex(widgetIndex),
    );
  }
}
