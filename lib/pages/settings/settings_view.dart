import 'package:financial_apps_prgi/pages/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  
  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
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
                  title: const Text("Notifications",style:TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text("Language",style:TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.format_paint),
                  title: const Text("Theme",style:TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    settingsController.navigateThemePage();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("About_Us",style:TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text("Help_Support",style:TextStyle(fontSize: 18)),
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