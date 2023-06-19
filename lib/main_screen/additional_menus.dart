import 'package:flutter/material.dart';

import 'main_screen_widgets/all_additional_menu_tiles.dart';

class AdditionalMenuManager extends StatelessWidget {
  const AdditionalMenuManager({super.key});

  static const mainColor = Color.fromRGBO(241, 242, 252, 1);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: mainColor,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        toolbarHeight: 80,
        leadingWidth: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          children: const <Widget>[
            MainTile(),
            MyPropertiesTile(),
            BuildingDataTile(),
            InstructionsTile(),
            ContactUsTile(),
            WhatsAppTile(),
          ],
        ),
      ),
    );
  }
}

class AdditionalTenant extends StatelessWidget {
  const AdditionalTenant({super.key});

  static const mainColor = Color.fromRGBO(241, 242, 252, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        toolbarHeight: 80,
        leadingWidth: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              //   statusBarColor: Colors.white,
              //   statusBarIconBrightness: Brightness.dark,
              // ));
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          children: const <Widget>[
            MainTile(),
            MyPropertiesTile(),
            InstructionsTile(),
            ContactUsTile(),
            WhatsAppTile(),
          ],
        ),
      ),
    );
  }
}

class AdditionalWorker extends StatelessWidget {
  const AdditionalWorker({super.key});

  static const mainColor = Color.fromRGBO(241, 242, 252, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        toolbarHeight: 80,
        leadingWidth: 70,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              //   statusBarColor: Colors.white,
              //   statusBarIconBrightness: Brightness.dark,
              // ));
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          children: const <Widget>[
            MainTile(),
            InstructionsTile(),
            ContactUsTile(),
            WhatsAppTile(),
          ],
        ),
      ),
    );
  }
}
