import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_project/cores/github_api_service.dart';
import 'package:cv_project/cores/launch_urls.dart';
import 'package:cv_project/models/github_repo_json_model.dart';
import 'package:cv_project/tema.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WebScaffold extends StatefulWidget {
  const WebScaffold({super.key});

  @override
  State<WebScaffold> createState() => _WebScaffoldState();
}

class _WebScaffoldState extends State<WebScaffold> {
  int currentPageIndex = 0;
  Size? size;

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // pages = [_homePage(), _homePage(), _homePage(), _homePage()];

    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorGrey,
      body: Stack(
        children: [
          Container(
            color: colorGrey,
            width: size!.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size!.width * 0.1,
                  height: size!.width * 0.1,
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
                    fontSize: size!.height * 0.05,
                  ),
                ),
                Text(
                  "Junior Yazılım Geliştirici",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size!.height * 0.025,
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
                SizedBox(height: size!.height * 0.03),
                GestureDetector(
                  onTap: () => downloadCV(),
                  child: Container(
                    width: size!.width * 0.18,
                    height: size!.height * 0.08,
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
                          fontSize: size!.width * 0.012,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          getCurrentPage(),
        ],
      ),
      floatingActionButton: Container(
        width: 400,
        height: 70,
        decoration: BoxDecoration(
          color: colorGrey,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: colorGrey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: _drawer(),
      ),
    );
  }

  Row _drawer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              currentPageIndex = 0;
              carouselController.animateToPage(
                0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.linear,
              );
            });
          },
          icon: FaIcon(
            FontAwesomeIcons.house,
            color: currentPageIndex == 0 ? colorYellow : colorYellow2,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              currentPageIndex = 1;
              carouselController.animateToPage(1,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.linear);
            });
          },
          icon: FaIcon(
            FontAwesomeIcons.userLarge,
            color: currentPageIndex == 1 ? colorYellow : colorYellow2,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              currentPageIndex = 2;
              carouselController.animateToPage(2,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.linear);
            });
          },
          icon: FaIcon(
            FontAwesomeIcons.code,
            color: currentPageIndex == 2 ? colorYellow : colorYellow2,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              currentPageIndex = 3;
              carouselController.animateToPage(3,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.linear);
            });
          },
          icon: FaIcon(
            FontAwesomeIcons.graduationCap,
            color: currentPageIndex == 3 ? colorYellow : colorYellow2,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              currentPageIndex = 4;
              carouselController.animateToPage(4,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.linear);
            });
          },
          icon: FaIcon(
            FontAwesomeIcons.briefcase,
            color: currentPageIndex == 4 ? colorYellow : colorYellow2,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget getCurrentPage() {
    List<Widget> pages = [
      _home(),
      _about(),
      _projects(),
      _education(),
      _jobs()
    ];
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: size!.width * 0.71,
        child: CarouselSlider(
          items: pages,
          carouselController: carouselController,
          options: CarouselOptions(
            viewportFraction: 1,
            aspectRatio: 2.0,
            height: size!.height,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            disableCenter: true,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
    // return pages[currentPageIndex];
  }

  Widget _home() {
    return Container(
      width: size!.width * 0.7,
      decoration: BoxDecoration(
        color: colorBlack,
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enes Dorukbaşı",
            style: TextStyle(
              color: Colors.white,
              fontSize: size!.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Junior Yazılım Geliştirici",
            style: TextStyle(color: Colors.white, fontSize: size!.width * 0.02),
          ),
        ],
      ),
    );
  }

  Widget _about() {
    return Container(
      width: size!.width * 0.7,
      decoration: BoxDecoration(
        color: colorBlack,
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: size!.width * 0.4,
                  child: Text(
                    "Merhaba ben Enes, üniversiteden mezun olduğumdan beri kendimi geliştirmek adına projeler geliştirip, eğitimlere katıldım. Projelerime github hesabım üzerinden ulaşabilirsiniz, github'da bulunmayan yapım aşamasında uygulamamı da dilerseniz sunabilirim. Kendimi geliştirebileceğim ve gelişirken de çalıştığım firmaya bir şeyler katabileceğim bir iş arayışındayım. Becerilerimin uygunluğu hakkında detaylı konuşmak isterseniz bana ulaşabilirsiniz. Teşekkür ederim.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: size!.width * 0.013,
                    ),
                  ),
                ),
              ),
              SizedBox(width: size!.width * 0.02),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Telefon ',
                      style: TextStyle(
                        fontSize: size!.width * 0.014,
                        color: colorBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '+90 541 842 9774',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: size!.width * 0.012,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'E-mail ',
                      style: TextStyle(
                        fontSize: size!.width * 0.014,
                        color: colorBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'enesdorukbasi@outlook.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: size!.width * 0.012,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: TextSpan(
                      text: 'Adres ',
                      style: TextStyle(
                        fontSize: size!.width * 0.014,
                        color: colorBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Pendik/İstanbul',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: size!.width * 0.012,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _education() {
    return Container(
      width: size!.width * 0.7,
      decoration: BoxDecoration(
        color: colorBlack,
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size!.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size!.height * 0.2),
                    Text(
                      'Eğitim',
                      style: TextStyle(
                        color: colorWhite,
                        fontSize: size!.width * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: colorWhite,
                    ),
                    SizedBox(height: size!.width * 0.03),
                    _educationItem(
                      "2018-2021",
                      "Düzce üniversitesi",
                      "ÖNLİSANS / BİLGİSAYAR PROGRAMCILIĞI",
                    ),
                    SizedBox(height: size!.width * 0.03),
                    _educationItem(
                      "2021-2022",
                      "BİLİŞİM EĞİTİM MERKEZİ",
                      "İŞKUR DESTEKLİ EĞİTİM. SİSTEM VE AĞ YÖNETİM (800 SAAT)",
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: size!.height,
                  width: 1,
                  color: colorWhite,
                ),
              ),
              SizedBox(
                height: size!.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size!.height * 0.2),
                    Text(
                      'Yetenekler',
                      style: TextStyle(
                        color: colorWhite,
                        fontSize: size!.width * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 200,
                      color: colorWhite,
                    ),
                    SizedBox(height: size!.width * 0.03),
                    _skillsItem('Flutter&Dart', 4),
                    _skillsItem('WPF (C#)', 4),
                    _skillsItem('.NET MVC (C#)', 3),
                    _skillsItem('HTML-CSS', 3),
                    _skillsItem('Firebase', 4),
                    _skillsItem('MSSQL', 4),
                    _skillsItem('SqLite', 4),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _jobs() {
    return Container(
      width: size!.width * 0.7,
      decoration: BoxDecoration(
        color: colorBlack,
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: size!.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: size!.height * 0.2),
                Text(
                  'Deneyim',
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: size!.width * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 1,
                  width: 200,
                  color: colorWhite,
                ),
                const SizedBox(height: 30),
                _jobItem(
                  "07.2019-08.2019",
                  "Arge-log Ar-Ge Merkezi Yönetim Danışmanlığı Ve Yazılım Hizmetleri A.Ş",
                  "Stajyer olarak kendimi yazılım sektörüne hazırlamam ve bir yön çizmem için etkili bir staj deneyimi oldu.",
                ),
                _jobItem(
                  "04.2022-Devam Ediyor",
                  "Aymed Medikal Teknoloji",
                  "Medikal alanda yapılacak projelerde bilgisayar tarafında yazılım geliştirme prosedürlerine uygun uygulamaların geliştirilmesi ve desteğinin sağlanmasında rol aldığım bir iş tecrübesi oldu.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _projects() {
    return Container(
      width: size!.width * 0.7,
      decoration: BoxDecoration(
        color: colorBlack,
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: SizedBox(
        height: size!.height * 0.7,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: size!.height * 0.1),
                Text(
                  'Projeler',
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: size!.width * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 1,
                  width: 200,
                  color: colorWhite,
                ),
                const SizedBox(height: 30),
                FutureBuilder<List<GithubRepoJsonModel>>(
                  future: GithubRepoService().getRepos(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("Paylaşılmış bir proje bulunmuyor."),
                        );
                      }
                      List<Widget> grids = [];
                      snapshot.data!.map(
                        (e) {
                          try {
                            grids.add(repoItem(e));
                            // ignore: empty_catches
                          } catch (e) {}
                        },
                      ).toList();
                      return GridView.count(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.86),
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        children: grids,
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container repoItem(GithubRepoJsonModel githubRepoJsonModel) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: size!.width * 0.18,
      height: size!.height * 0.21,
      decoration: BoxDecoration(
        color: colorGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              githubRepoJsonModel.name!,
              style: TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.bold,
                fontSize: size!.width * 0.01,
              ),
            ),
            Text(
              githubRepoJsonModel.fullName!,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.bold,
                fontSize: size!.width * 0.007,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  githubRepoJsonModel.language!,
                  style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: size!.width * 0.007,
                  ),
                ),
                Text(
                  "${githubRepoJsonModel.createdAt!.day}.${githubRepoJsonModel.createdAt!.month}.${githubRepoJsonModel.createdAt!.year}",
                  style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: size!.width * 0.007,
                  ),
                ),
                IconButton(
                    onPressed: () => openUrl(githubRepoJsonModel.htmlUrl!),
                    icon: const FaIcon(Icons.arrow_circle_right))
              ],
            )
          ],
        ),
      ),
    );
  }

  Row _skillsItem(String title, int point) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 11,
          height: 20,
          decoration: BoxDecoration(
            color: colorYellow,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.bold,
                fontSize: size!.width * 0.013,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: point >= 1 ? colorBlue : colorGrey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: point >= 2 ? colorBlue : colorGrey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: point >= 3 ? colorBlue : colorGrey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: point >= 4 ? colorBlue : colorGrey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: point >= 5 ? colorBlue : colorGrey,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Row _educationItem(String years, String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              years,
              style: const TextStyle(
                color: colorWhite,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.bold,
                fontSize: size!.width * 0.013,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subTitle,
              style: const TextStyle(
                color: colorWhite,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(width: 10),
        Container(
          width: 11,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: colorYellow,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
          ),
        ),
      ],
    );
  }

  Column _jobItem(String years, String title, String content) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: colorYellow,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          years,
          style: TextStyle(
            color: colorWhite,
            fontSize: size!.width * 0.009,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: TextStyle(
            color: colorWhite,
            fontWeight: FontWeight.bold,
            fontSize: size!.width * 0.012,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: size!.width * 0.4,
          child: Text(
            content,
            style: TextStyle(
              color: colorWhite,
              fontSize: size!.width * 0.009,
            ),
          ),
        ),
      ],
    );
  }
}
