import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/pages/sos_call.dart';

class Sos extends StatefulWidget {
  final dynamic cancelUserLocationListener;
  final UserModel? user;

  const Sos({
    super.key,
    required this.user,
    required this.cancelUserLocationListener,
  });

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {
  String _sosType = 'Criminal';

  void setSosType(String sosName) {
    setState(() {
      _sosType = sosName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white.withOpacity(0),
          toolbarHeight: 120,
          titleSpacing: 22,
          title: GreetingsText(name: widget.user!.name),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    SosButton(
                      sosType: _sosType,
                      cancelUserLocationListener:
                          widget.cancelUserLocationListener,
                    ),
                    const SizedBox(height: 32),
                    SosList(
                      setSosType: setSosType,
                      activeSosType: _sosType,
                    ),
                  ],
                ),
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }
}

class GreetingsText extends StatelessWidget {
  final String name;

  const GreetingsText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Row(
      children: [
        CircleAvatar(
            radius: 25,
            backgroundColor: colorScheme.primary,
            child: const Text(
              'RA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello,',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(30, 32, 34, 1.0),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$name 👋',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(30, 32, 34, 1.0),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class SosButton extends StatelessWidget {
  final dynamic cancelUserLocationListener;
  final String sosType;

  const SosButton({
    super.key,
    required this.sosType,
    required this.cancelUserLocationListener,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: 300,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: colorScheme.outline,
            width: 0.9,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                width: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme.outline,
                    width: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  sosType,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              IconButton(
                onPressed: () {
                  cancelUserLocationListener();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SosCallPage(sosType: sosType),
                    ),
                  );
                },
                icon: Container(
                  width: 170,
                  height: 170,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme.primary,
                      width: 40,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/call.svg',
                    width: 38,
                    height: 38,
                  ),
                ),
                iconSize: 38,
                color: colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SosList extends StatelessWidget {
  final dynamic setSosType;
  final String activeSosType;

  const SosList({
    super.key,
    required this.setSosType,
    required this.activeSosType,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
        width: screenWidth,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HELP SOS',
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  SosCard(
                    sosName: 'Criminal',
                    iconPath: 'assets/images/criminal.png',
                    setSosType: setSosType,
                    isActive: activeSosType == 'Criminal' ? true : false,
                  ),
                  SosCard(
                    sosName: 'Fire',
                    iconPath: 'assets/images/fire.png',
                    setSosType: setSosType,
                    isActive: activeSosType == 'Fire' ? true : false,
                  ),
                  SosCard(
                    sosName: 'Health Condition',
                    iconPath: 'assets/images/health-condition.png',
                    setSosType: setSosType,
                    isActive:
                        activeSosType == 'Health Condition' ? true : false,
                  ),
                  SosCard(
                    sosName: 'Natural Disaster',
                    iconPath: 'assets/images/natural-disaster.png',
                    setSosType: setSosType,
                    isActive:
                        activeSosType == 'Natural Disaster' ? true : false,
                  ),
                  SosCard(
                    sosName: 'Household Emergency',
                    iconPath: 'assets/images/household-emergency.png',
                    setSosType: setSosType,
                    isActive:
                        activeSosType == 'Household Emergency' ? true : false,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class SosCard extends StatelessWidget {
  final String sosName;
  final String iconPath;
  final dynamic setSosType;
  final bool isActive;

  const SosCard({
    super.key,
    required this.sosName,
    required this.iconPath,
    required this.setSosType,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isActive ? colorScheme.primary : colorScheme.outline,
          width: 0.9,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        tooltip: sosName,
        onPressed: () => setSosType(sosName),
        icon: Image.asset(iconPath),
      ),
    );
  }
}
