import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'app_bar.dart';
import 'drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const String routeName = "/settings";

  @override
  State<SettingsPage> createState() => _SettingState();
}

class _SettingState extends State<SettingsPage> {
  bool _isDarkMode = false;

  // Initial Selected Value of language
  String dropdownvalue = "English";
  var items = ["English", "Amharic", "Tigrigna", "Oromogna", "Somaligna"];
  double _fontsize = 16.0;

  set isDarkMode(value) => _isDarkMode = value;
  bool get isDarkMode => _isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarState(),
      drawer: drawerState(context),
      body: SettingsList(
        shrinkWrap: false,
        contentPadding: const EdgeInsets.all(8.0),
        applicationType: ApplicationType.both,
        brightness: Brightness.dark,
        sections: <AbstractSettingsSection>[
          SettingsSection(
            title: const Text("Preferences"),
            tiles: [
              SettingsTile.navigation(
                title: const Text("Language Selection"),
                leading: const Icon(Icons.language),
                value: Text(dropdownvalue),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    value: dropdownvalue,
                    items: items
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue = value!;
                      });
                    },
                    iconEnabledColor: Colors.teal,
                    buttonHeight: 35,
                    buttonPadding: const EdgeInsets.only(left: 7, right: 7),
                    buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.teal,
                        )),
                    itemPadding: const EdgeInsets.only(left: 7, right: 7),
                    offset: const Offset(0, -3),
                    dropdownMaxHeight: 300,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
                enabled: true,
              ),
              SettingsTile.switchTile(
                title: const Text("Dark Mode"),
                leading: const Icon(Icons.dark_mode_outlined),
                initialValue: isDarkMode,
                onToggle: (context) {
                  setState(() {
                    isDarkMode = true;
                  });
                },
              ),
              SettingsTile.navigation(
                title: const Text("Font Size Adjustment"),
                leading: const Icon(Icons.format_size_rounded),
                value: Text('$_fontsize'),
                trailing: Slider(
                  min: 12,
                  max: 72,
                  divisions: 10,
                  value: _fontsize,
                  onChanged: (value) {
                    setState(
                      () {
                        _fontsize = value;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
