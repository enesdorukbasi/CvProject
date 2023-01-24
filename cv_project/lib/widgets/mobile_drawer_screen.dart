import 'package:cv_project/cores/launch_urls.dart';
import 'package:cv_project/responsive/mobile.dart';
import 'package:cv_project/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileDrawerScreen extends StatefulWidget {
  const MobileDrawerScreen({super.key});

  @override
  State<MobileDrawerScreen> createState() => _MobileDrawerScreenState();
}

class _MobileDrawerScreenState extends State<MobileDrawerScreen> {
  Size? size;
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ZoomDrawer(
      menuBackgroundColor: colorGrey,
      controller: zoomDrawerController,
      style: DrawerStyle.style3,
      menuScreenWidth: size!.width,
      mainScreenTapClose: true,
      showShadow: true,
      menuScreen: _drawerMenu(),
      mainScreen: const MobileScaffold(),
    );
  }

  Widget _drawerMenu() {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: size!.height * 0.2),
        Container(
          color: colorGrey,
          width: size!.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size!.width * 0.4,
                height: size!.width * 0.4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colorBlack.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://media.licdn.com/dms/image/D5603AQEus1fNAKhtyg/profile-displayphoto-shrink_800_800/0/1664349835182?e=1678924800&v=beta&t=61OIOAuhfnOd4qXUA0GdLS-5OO36v99zaU1dkBFuiGs"),
                  ),
                ),
              ),
              SizedBox(height: size!.height * 0.02),
              Text(
                "Enes Dorukbaşı",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size!.width * 0.06,
                ),
              ),
              Text(
                "Junior Yazılım Geliştirici",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size!.width * 0.05,
                ),
              ),
              SizedBox(height: size!.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      openMyGithub();
                    },
                    backgroundColor: colorBlack,
                    child: const FaIcon(
                      FontAwesomeIcons.githubAlt,
                      color: colorYellow,
                    ),
                  ),
                  SizedBox(width: size!.width * 0.01),
                  FloatingActionButton(
                    onPressed: () {
                      openMyLinkedIn();
                    },
                    backgroundColor: colorBlack,
                    child: const FaIcon(
                      FontAwesomeIcons.linkedinIn,
                      color: colorYellow,
                    ),
                  ),
                  SizedBox(width: size!.width * 0.01),
                  FloatingActionButton(
                    onPressed: () {
                      openMyWhatsapp();
                    },
                    backgroundColor: colorBlack,
                    child: const FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: colorYellow,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size!.height * 0.02),
              GestureDetector(
                onTap: () => downloadCV(),
                child: Container(
                  width: size!.width * 0.5,
                  height: size!.height * 0.1,
                  decoration: BoxDecoration(
                    color: colorBlack,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: colorWhite),
                  ),
                  child: Center(
                    child: Text(
                      "Cv İndir",
                      style: TextStyle(
                        color: colorYellow,
                        fontWeight: FontWeight.bold,
                        fontSize: size!.width * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: size!.height + (size!.height * 0.2)),
      ],
    );
  }
}
