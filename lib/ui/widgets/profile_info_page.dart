import 'package:flutter/material.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(),
                          backgroundColor: Colors.black,
                          body:
                              Center(child: Image.asset('images/joabe.jpeg')),
                        );
                      },
                    ));
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        image: DecorationImage(
                            image: AssetImage('images/joabe.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            const BoldText(
              text: 'Joabe Santana Correia',
              fontSize: 20,
              color: Colors.white70,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
              child: Column(
                
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [BoxShadow(blurRadius: 15)],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xff121212)),
                    child: const Padding(
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ItemDescriptionWithDivider(
                            title: 'BIO',
                            description:
                                'A Student who get very interisting and became a Flutter Lover ❤️',
                          ),
                          ItemDescriptionWithDivider(
                            title: 'STUDENT ID',
                            description: '2373171007',
                            paddingTop: 10,
                          ),
                          ItemDescriptionWithDivider(
                            title: 'EMAIL',
                            description: 'joabesantana.c@gmail.com',
                            paddingTop: 10,
                          ),
                          ItemDescriptionWithDivider(
                            title: 'PHONE',
                            description: '(61) 99161-3281',
                            paddingTop: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Center(
                    child: AboutListTile(
                      icon: Icon(Icons.info_outline),
                      applicationVersion: '1.0.0.0',
                      applicationName: 'Dogs Breeds',
                      aboutBoxChildren: [
                        Text(
                            'An App to list images of Dogs and show information of each Dogs Breeds'),
                      ],
                      child: Text('About this App'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  const BoldText(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color});

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class ItemDescriptionWithDivider extends StatelessWidget {
  const ItemDescriptionWithDivider(
      {super.key,
      required this.title,
      required this.description,
      this.paddingTop = 0.0,
      this.paddingBottom = 0.0});

  final String title;
  final String description;
  final double paddingTop;
  final double paddingBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: paddingTop)),
        BoldText(
          text: title,
          fontSize: 16,
          color: Colors.white70,
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          description,
          style: const TextStyle(color: Colors.white60),
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        const Divider(color: Colors.white10),
        Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
      ],
    );
  }
}
