import 'package:financial_apps_prgi/pages/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings".tr),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text("Notifications".tr,style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text("Language".tr,style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    settingsController.navigateLanguagePage();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.format_paint),
                  title: Text("Theme".tr,style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    settingsController.navigateThemePage();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: Text("About_Us".tr,style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: Text("Help_Support".tr,style: const TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}