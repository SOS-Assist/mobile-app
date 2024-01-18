import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/widgets/sos.dart';
import 'package:mobile_app/widgets/nearby_friends.dart';
import 'package:mobile_app/widgets/profile.dart';
import 'package:mobile_app/services/authentication.dart';
import 'package:mobile_app/services/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthenticationService _authenticationService = AuthenticationService();
  final LocationService _locationService = LocationService();
  bool _isLocationServicesEnabled = false;
  late List<Widget> _widgetOptions;
  int widgetIndex = 0;
  UserModel? _user;

  void setIsLocationServicesEnabled(bool isLocationServicesEnabled) {
    setState(() {
      _isLocationServicesEnabled = isLocationServicesEnabled;
    });
  }

  void setWidgetIndex(int widgetIndex) {
    setState(() {
      this.widgetIndex = widgetIndex;
    });
  }

  void signUserOut() {
    _authenticationService.signOut();
  }

  @override
  void initState() {
    super.initState();
    _fetchUser().then((_) {
      _locationService.handleLocationPermission().then((_) {
        setState(() {
          _isLocationServicesEnabled = true;
          _widgetOptions[0] = Sos(
            isLocationServicesEnabled: _isLocationServicesEnabled,
            cancelUserLocationListener: _cancelUserLocationListener,
            user: _user,
          );
        });
        _listenUserLocation();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      });
    });

    _widgetOptions = [
      const Center(child: CircularProgressIndicator()),
      const Center(child: NearbyFriend()),
      const Center(child: Text('(History)')),
      const Center(child: CircularProgressIndicator()),
    ];
  }

  void _listenUserLocation() {
    _locationService.listenUserLocation('${_user!.uid}');
  }

  void _cancelUserLocationListener() {
    _locationService.dispose();
  }

  Future<void> _fetchUser() async {
    final user = await _authenticationService.getCurrentUser();
    setState(() {
      _user = user;
      _widgetOptions[0] = Sos(
        isLocationServicesEnabled: _isLocationServicesEnabled,
        cancelUserLocationListener: _cancelUserLocationListener,
        user: _user,
      );
      _widgetOptions[3] = Profile(user: _user);
    });
  }

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
