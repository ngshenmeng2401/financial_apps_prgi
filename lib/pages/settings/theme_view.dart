import 'package:financial_apps_prgi/pages/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeView extends GetView<SettingsController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Theme"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                GetBuilder<SettingsController>(
                  init: SettingsController(),
                  builder: (controller) {
                    return ListTile(
                      title: const Text("Dark_Theme", style: TextStyle(fontSize: 18)),
                      subtitle: const Text("Dark_Theme_Desciption",
                          style: TextStyle(fontSize: 14)),
                      trailing: Radio(
                        activeColor: Colors.blue[200],
                        value: true,
                        groupValue: controller.isDarkMode,
                        onChanged: (value) {
                          controller.chooseLightTheme(value);
                        },
                      ),
                    );
                  },
                ),
                GetBuilder<SettingsController>(
                  init: SettingsController(),
                  builder: (controller) {
                    return ListTile(
                      title: const Text("Light_Theme", style: TextStyle(fontSize: 18)),
                      subtitle: const Text("Light_Theme_Desciption",
                          style: TextStyle(fontSize: 14)),
                      trailing: Radio(
                        activeColor: Colors.blue[200],
                        value: false,
                        groupValue: controller.isDarkMode,
                        onChanged: (value) {
                          controller.chooseLightTheme(value);
                        },
                      ),
                    );
                  },
                ),
                // GetBuilder<SettingsController>(
                //   init: SettingsController(),
                //   builder: (controller) {
                //     return ListTile(
                //       title: Text("System Default",
                //           style: TextStyle(fontSize: 18)),
                //       subtitle: Text(
                //           "The primary color will base on system theme",
                //           style: TextStyle(fontSize: 14)),
                //       trailing: Radio(
                //         activeColor: Colors.red[200],
                //         value: null,
                //         groupValue: false,
                //         onChanged: (value) {
                //           // controller.onClickRadioButton(value);
                //         },
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}