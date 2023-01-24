import 'package:carousel_slider/carousel_slider.dart';
import 'package:cv_project/cores/github_api_service.dart';
import 'package:cv_project/cores/launch_urls.dart';
import 'package:cv_project/models/github_repo_json_model.dart';
import 'package:cv_project/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widget_size/widget_size.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  Size? size;
  int currentPageIndex = 0;
  double heightEducation = 0;
  double heightJob = 0;

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBlack,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const FaIcon(Icons.menu),
        ),
        title: const Text(
          "Enes Dorukbaşı",
          style: TextStyle(fontWeight: FontWeight.bold, color: colorWhite),
        ),
        centerTitle: true,
      ),
      backgroundColor: colorBlack,
      body: getCurrentPage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: size!.width,
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
    return SizedBox(
      width: size!.width,
      child: CarouselSlider(
        items: pages,
        carouselController: carouselController,
        options: CarouselOptions(
          viewportFraction: 2,
          aspectRatio: 1,
          height: size!.height,
          initialPage: 0,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          disableCenter: true,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
    // return pages[currentPageIndex];
  }

  Widget _home() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enes Dorukbaşı",
            style: TextStyle(
              color: Colors.white,
              fontSize: size!.width * 0.1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Junior Yazılım Geliştirici",
            style: TextStyle(color: Colors.white, fontSize: size!.width * 0.07),
          ),
        ],
      ),
    );
  }

  Widget _about() {
    return SizedBox(
      width: size!.width,
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: size!.width,
                  child: Text(
                    "Merhaba ben Enes, üniversiteden mezun olduğumdan beri kendimi geliştirmek adına projeler geliştirip, eğitimlere katıldım. Projelerime github hesabım üzerinden ulaşabilirsiniz, github'da bulunmayan yapım aşamasında uygulamamı da dilerseniz sunabilirim. Kendimi geliştirebileceğim ve gelişirken de çalıştığım firmaya bir şeyler katabileceğim bir iş arayışındayım. Becerilerimin uygunluğu hakkında detaylı konuşmak isterseniz bana ulaşabilirsiniz. Teşekkür ederim.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: size!.width * 0.05,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size!.height * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Telefon ',
                      style: TextStyle(
                        fontSize: size!.width * 0.05,
                        color: colorBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '+90 541 842 9774',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: size!.width * 0.04,
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
                        fontSize: size!.width * 0.05,
                        color: colorBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'enesdorukbasi@outlook.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: size!.width * 0.04,
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
                        fontSize: size!.width * 0.05,
                        color: colorBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Pendik/İstanbul',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: size!.width * 0.04,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: size!.height * 0.15),
        ],
      ),
    );
  }

  Widget _education() {
    return Center(
      child: SizedBox(
        width: size!.width,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      SizedBox(height: size!.height * 0.072),
                      Container(
                        height: heightEducation,
                        width: 1,
                        color: colorWhite,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WidgetSize(
                      onChange: (p0) {
                        setState(() {
                          heightEducation = p0.height - (size!.height * 0.06);
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: size!.height * 0.03),
                          Text(
                            'Eğitim',
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: size!.width * 0.07,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 200,
                            color: colorWhite,
                          ),
                          SizedBox(height: size!.width * 0.05),
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
                  ],
                ),
              ],
            ),
            SizedBox(height: size!.height * 0.072),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      SizedBox(height: size!.height * 0.072),
                      Container(
                        height: heightJob,
                        width: 1,
                        color: colorWhite,
                      ),
                    ],
                  ),
                ),
                WidgetSize(
                  onChange: (p0) {
                    setState(() {
                      heightJob = p0.height - (size!.height * 0.06);
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size!.height * 0.03),
                      Text(
                        'Yetenekler',
                        style: TextStyle(
                          color: colorWhite,
                          fontSize: size!.width * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 200,
                        color: colorWhite,
                      ),
                      SizedBox(height: size!.width * 0.05),
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
            ),
            SizedBox(height: size!.height * 0.15),
          ],
        ),
      ),
    );
  }

  Widget _jobs() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size!.height * 0.03),
            Text(
              'Deneyim',
              style: TextStyle(
                color: colorWhite,
                fontSize: size!.width * 0.1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 1,
              width: size!.width * 0.9,
              color: colorWhite,
            ),
            const SizedBox(height: 30),
            _jobItem(
              "07.2019-08.2019",
              "Arge-log Ar-Ge Merkezi Yönetim Danışmanlığı Ve Yazılım Hizmetleri A.Ş",
              "Stajyer olarak kendimi yazılım sektörüne hazırlamam ve bir yön çizmem için etkili bir staj deneyimi oldu.",
            ),
            const SizedBox(height: 30),
            _jobItem(
              "04.2022-Devam Ediyor",
              "Aymed Medikal Teknoloji",
              "Medikal alanda yapılacak projelerde bilgisayar tarafında yazılım geliştirme prosedürlerine uygun uygulamaların geliştirilmesi ve desteğinin sağlanmasında rol aldığım bir iş tecrübesi oldu.",
            ),
          ],
        ),
        SizedBox(height: size!.height * 0.15),
      ],
    );
  }

  Widget _projects() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size!.height * 0.03),
          Text(
            'Projeler',
            style: TextStyle(
              color: colorWhite,
              fontSize: size!.width * 0.1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 1,
            width: size!.width * 0.9,
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
                return SizedBox(
                  height: size!.height * 0.7,
                  child: ListView.builder(
                    itemCount: grids.length,
                    itemBuilder: (context, index) {
                      return grids[index];
                    },
                  ),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
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
                fontSize: size!.width * 0.06,
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
        Container(
          width: 11,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: colorYellow,
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
                fontSize: size!.width * 0.06,
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                SizedBox(
                  width: size!.width - 45,
                  child: Text(
                    subTitle,
                    maxLines: 4,
                    // softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: size!.width * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  SizedBox _jobItem(String years, String title, String content) {
    return SizedBox(
      width: size!.width,
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: colorYellow,
              border: Border.all(color: Colors.white, width: 1.5),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            years,
            style: TextStyle(
              color: colorWhite,
              fontSize: size!.width * 0.05,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorWhite,
              fontWeight: FontWeight.bold,
              fontSize: size!.width * 0.06,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: size!.width,
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colorWhite,
                fontSize: size!.width * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column repoItem(GithubRepoJsonModel githubRepoJsonModel) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: size!.width * 0.9,
          height: size!.height * 0.2,
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
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: size!.width * 0.06,
                  ),
                ),
                Text(
                  githubRepoJsonModel.fullName!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: size!.width * 0.04,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      githubRepoJsonModel.language!,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: size!.width * 0.03,
                      ),
                    ),
                    Text(
                      "${githubRepoJsonModel.createdAt!.day}.${githubRepoJsonModel.createdAt!.month}.${githubRepoJsonModel.createdAt!.year}",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: size!.width * 0.03,
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
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
