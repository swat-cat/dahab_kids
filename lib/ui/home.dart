import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dahab app"),
        elevation: 16,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_alert_sharp))
        ],
      ),
      body: SizedBox.expand(
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.yellow,
              width: 50,
              height: 50,
            ),
            const Text(
              "Names:",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            const Text("Miron"),
            const Text("Yurii"),
            const Text("Dima"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse("https://google.com"));
                },
                child: const Text("Open google"),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.ac_unit_sharp),
                Checkbox(value: true, onChanged: (v) {}),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ],
            ),
            UserItem(
              title: "Maksym",
              subtitle: "Software engineer",
              showCard: () {
                setState(() {
                  showCard = true;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              opacity: showCard ? 1 : 0,
              child: UserCard(
                name: "Name",
                occupation: "Occupation",
                hideCard: () {
                  setState(() {
                    showCard = false;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        )),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() showCard;

  const UserItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.showCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).typography.englishLike.titleMedium,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .typography
                        .englishLike
                        .bodyMedium
                        ?.copyWith(
                            color: Theme.of(context).colorScheme.outline),
                  )
                ],
              )),
              IconButton(onPressed: showCard, icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatefulWidget {
  final String name;
  final String occupation;
  final Function() hideCard;

  const UserCard(
      {super.key,
      required this.name,
      required this.occupation,
      required this.hideCard});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  Image? avatar;
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: SizedBox(
        width: 200,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: widget.hideCard, icon: const Icon(Icons.close)),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final _image =
                                      await ImagePickerWeb.getImageAsWidget();
                                  setState(() {
                                    avatar = _image;
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 24,
                                  foregroundImage: avatar?.image,
                                  child: const Icon(Icons.person),
                                ),
                              ),
                              if (likes > 0)
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red),
                                      child: Center(
                                        child: Text(
                                          likes.toString() ?? "",
                                          style: const TextStyle(
                                              fontSize: 8, color: Colors.white),
                                        ),
                                      ),
                                    ))
                            ],
                          ),
                        ),
                        Text(
                          widget.name,
                          style: Theme.of(context)
                              .typography
                              .englishLike
                              .titleMedium,
                        ),
                        Text(
                          widget.occupation,
                          style: Theme.of(context)
                              .typography
                              .englishLike
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.outline),
                        ),
                        SizedBox(
                          height: 48,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 0,
                child: IconButton(
                  icon: Image.asset(
                    'images/like.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      likes++;
                    });
                  },
                ))
          ],
        ),
      ),
    );
  }
}
