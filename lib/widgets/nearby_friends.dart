import 'package:flutter/material.dart';

class NearbyFriend extends StatelessWidget {
  const NearbyFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white.withOpacity(0),
          toolbarHeight: 120,
          titleSpacing: 22,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nearby",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [NearbyList()],
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

class NearbyList extends StatelessWidget {
  const NearbyList({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NearbyCard(
            userName: "Girth",
            userPhone: "123213123",
            profilePath: "assets/images/profile.png",
            needHelp: false,
          ),
          const SizedBox(height: 10),
          NearbyCard(
            userName: "Girth",
            userPhone: "123213123",
            profilePath: "assets/images/profile.png",
            needHelp: true,
          ),
          const SizedBox(height: 10),
          NearbyCard(
            userName: "Girth",
            userPhone: "123213123",
            profilePath: "assets/images/profile.png",
            needHelp: true,
          ),
          const SizedBox(height: 10),
          NearbyCard(
            userName: "Girth",
            userPhone: "123213123",
            profilePath: "assets/images/profile.png",
            needHelp: false,
          ),
          const SizedBox(height: 10),
          NearbyCard(
            userName: "Girth",
            userPhone: "123213123",
            profilePath: "assets/images/profile.png",
            needHelp: false,
          ),
          const SizedBox(height: 10),
          NearbyCard(
            userName: "Girth",
            userPhone: "123213123",
            profilePath: "assets/images/profile.png",
            needHelp: false,
          ),
        ],
      ),
    );
  }
}

class NearbyCard extends StatelessWidget {
  NearbyCard(
      {super.key,
      required this.userName,
      required this.userPhone,
      required this.profilePath,
      required this.needHelp});
  final String userName;
  final String userPhone;
  final String profilePath;
  final bool needHelp;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                profilePath,
                height: 50,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Color.fromRGBO(202, 202, 202, 1),
                        size: 16.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      const SizedBox(width: 5),
                      Text("+62 $userPhone"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: needHelp
                  ? colorScheme.primary
                  : Color.fromRGBO(147, 206, 172, 1),
            ),
            child: Text(
              needHelp ? "Need Help" : "Safe",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
