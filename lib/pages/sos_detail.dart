import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/models/user.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/services/authentication.dart';

class SosDetailPage extends StatefulWidget {
  final String sosType;

  const SosDetailPage({super.key, required this.sosType});

  @override
  State<SosDetailPage> createState() => _SosDetailPageState();
}

class _SosDetailPageState extends State<SosDetailPage> {
  final AuthenticationService _authenticationService = AuthenticationService();
  UserModel? _user;

  void _navigateToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          userUid: _user!.uid.toString(),
        ),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  _fetchUser() async {
    final user = await _authenticationService.getCurrentUser();
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SOS Status',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
        toolbarHeight: 100,
      ),
      backgroundColor: colorScheme.background,
      body: _user == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 0.9,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
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
                          ),
                        ),
                        const SizedBox(width: 18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _user!.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              '1 January 2001',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 180,
                    child: GridView.count(
                      shrinkWrap: false,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 2 / 1,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        UserDataCard(
                          dataType: 'age',
                          dataValue: [23.toString(), 'years'],
                          iconPath: 'assets/icons/date.svg',
                        ),
                        const UserDataCard(
                          dataType: 'blood',
                          dataValue: ['AB', 'rh-'],
                          iconPath: 'assets/icons/blood.svg',
                        ),
                        UserDataCard(
                          dataType: 'height',
                          dataValue: [178.toString(), 'cm'],
                          iconPath: 'assets/icons/height.svg',
                        ),
                        UserDataCard(
                          dataType: 'weight',
                          dataValue: [64.toString(), 'kg'],
                          iconPath: 'assets/icons/weight.svg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 42),
                  const Text(
                    'Current Condition',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: colorScheme.outline,
                        width: 0.9,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth,
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            border: Border.all(
                              color: colorScheme.outline,
                              width: 0.9,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'SOS: ${widget.sosType}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 20, 0, 20),
                              child: Column(
                                children: [
                                  const Text(
                                    'ELAPSED',
                                    style: TextStyle(
                                      color: Color.fromRGBO(163, 158, 158, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '01:59',
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                              child: VerticalDivider(
                                  thickness: 0.6,
                                  color: Color.fromRGBO(163, 158, 158, 1)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 40, 20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/people.svg',
                                    width: 24,
                                    colorFilter: const ColorFilter.mode(
                                      Color.fromRGBO(163, 158, 158, 1),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '10 Nearby',
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: ConfirmationDialog(
                              navigateToHome: _navigateToHome,
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fixedSize: Size(screenWidth, 50),
                      backgroundColor: colorScheme.primary,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text(
                      'I\'M SAFE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class UserDataCard extends StatelessWidget {
  final String dataType;
  final List<String> dataValue;
  final String iconPath;

  const UserDataCard({
    super.key,
    required this.dataType,
    required this.dataValue,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      height: 90,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: colorScheme.outline,
          width: 0.9,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dataType.toUpperCase(),
                style: const TextStyle(
                  color: Color.fromRGBO(163, 158, 158, 1),
                  fontSize: 10,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${dataValue[0]} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    dataValue[1],
                    style: const TextStyle(
                      color: Color.fromRGBO(163, 158, 158, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          SvgPicture.asset(iconPath, width: 20),
        ],
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback navigateToHome;

  const ConfirmationDialog({super.key, required this.navigateToHome});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      height: 360,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/emergency-post.svg',
            width: 150,
          ),
          const SizedBox(height: 24),
          const Text(
            'Are you sure?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Please make sure that you\'re in a safe circumstances. If you\'re sure, we\'ll cancel your SOS status.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(color: colorScheme.primary),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: Text(
                  'NOT SURE',
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: navigateToHome,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: colorScheme.primary,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                child: const Text(
                  'YES I AM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
