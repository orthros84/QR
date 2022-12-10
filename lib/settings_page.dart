// import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:qr_code_scanner_app/utils/boxes.dart';
import 'package:qr_code_scanner_app/widgets/card.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool showBanner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: Hive.box(settingsBox).listenable(),
                builder: (context, Box box, widget) {
                  return CardList(
                    items: [
                      CardListItem(
                        icon: Icon(Icons.volume_up),
                        text: "Sound",
                        suffixIcon: Switch(
                          value: box.get('sound', defaultValue: true),
                          onChanged: (value) => box.put('sound', value),
                        ),
                      ),
                      CardListItem(
                        icon: Icon(Icons.vibration),
                        text: "Vibration",
                        suffixIcon: Switch(
                          value: box.get('vibration', defaultValue: true),
                          onChanged: (value) => box.put('vibration', value),
                        ),
                      ),
                      CardListItem(
                        centerText: true,
                        text: "Version 1.0.0 (1)",
                        suffixIcon: Container(),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
